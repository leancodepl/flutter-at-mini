import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_cubit.freezed.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this.repository) : super(const PostsState.initial());

  final PostsRepository repository;

  Future<void> initialize() async {
    if (state is! PostsStateInitial) {
      // usually you would replace `print` with some logger
      print('Cannot initialize PostsCubit twice.');
      return;
    }

    emit(const PostsState.inProgress());

    try {
      final posts = await repository.getAllPosts();

      emit(PostsState.ready(posts));
    } on SocketException {
      emit(const PostsState.error(PostsStateErrorKind.network));
    } catch (err, st) {
      // this should not happen, so we print it to track such issues
      print('Unknown error: $err $st');
      emit(const PostsState.error(PostsStateErrorKind.unknown));
    }
  }

  // usually, you would have a separate cubit for creating posts: "NewPostCubit"
  Future<void> createPost(String title, String content) async {
    // we want to create a post only if we have finished initialization
    // we save a snapshot of the state in a local variable
    final state = this.state;
    // to then check its type
    if (state is! PostsStateReady) {
      return;
    }

    // now, we know we are in a ready state
    try {
      final newPost = await repository.createPost(
        title: title,
        content: content,
      );

      emit(state.copyWith(posts: [...state.posts, newPost]));
    } on SocketException {
      emit(const PostsState.error(PostsStateErrorKind.network));
    } catch (err, st) {
      print('Unknown error: $err $st');
      emit(const PostsState.error(PostsStateErrorKind.unknown));
    }
  }

  Future<void> refreshPost(String postId) async {
    // same state checking pattern here
    final state = this.state;
    if (state is! PostsStateReady) {
      return;
    }

    try {
      final post = await repository.getPostById(postId);

      if (post == null) {
        emit(const PostsState.error(PostsStateErrorKind.postDoesNotExist));
        return;
      }

      final alreadyPresent = state.posts.any((p) => p.id == post.id);

      final newPosts = alreadyPresent
          ? [
              for (final p in state.posts)
                if (p.id == post.id) post else p,
            ]
          : [...state.posts, post];

      emit(state.copyWith(posts: newPosts));
    } on SocketException {
      emit(const PostsState.error(PostsStateErrorKind.network));
    } catch (err, st) {
      print('Unknown error: $err $st');
      emit(const PostsState.error(PostsStateErrorKind.unknown));
    }
  }
}

@freezed
class PostsState with _$PostsState {
  const factory PostsState.initial() = PostsStateInitial;
  const factory PostsState.inProgress() = PostsStateInProgress;
  const factory PostsState.ready(List<Post> posts) = PostsStateReady;
  const factory PostsState.error(PostsStateErrorKind errorKind) =
      PostsStateError;
}

enum PostsStateErrorKind {
  network,
  postDoesNotExist,
  unknown,
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String authorId,
    required String title,
    required String content,
    required DateTime createdAt,
  }) = _Post;
}

abstract class PostsRepository {
  Future<Post?> getPostById(String postId);

  Future<List<Post>> getAllPosts();

  Future<Post> createPost({
    required String title,
    required String content,
  });
}
