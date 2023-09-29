// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(List<Post> posts) ready,
    required TResult Function(PostsStateErrorKind errorKind) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(List<Post> posts)? ready,
    TResult? Function(PostsStateErrorKind errorKind)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(List<Post> posts)? ready,
    TResult Function(PostsStateErrorKind errorKind)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsStateInitial value) initial,
    required TResult Function(PostsStateInProgress value) inProgress,
    required TResult Function(PostsStateReady value) ready,
    required TResult Function(PostsStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostsStateInitial value)? initial,
    TResult? Function(PostsStateInProgress value)? inProgress,
    TResult? Function(PostsStateReady value)? ready,
    TResult? Function(PostsStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsStateInitial value)? initial,
    TResult Function(PostsStateInProgress value)? inProgress,
    TResult Function(PostsStateReady value)? ready,
    TResult Function(PostsStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsStateCopyWith<$Res> {
  factory $PostsStateCopyWith(
          PostsState value, $Res Function(PostsState) then) =
      _$PostsStateCopyWithImpl<$Res, PostsState>;
}

/// @nodoc
class _$PostsStateCopyWithImpl<$Res, $Val extends PostsState>
    implements $PostsStateCopyWith<$Res> {
  _$PostsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PostsStateInitialImplCopyWith<$Res> {
  factory _$$PostsStateInitialImplCopyWith(_$PostsStateInitialImpl value,
          $Res Function(_$PostsStateInitialImpl) then) =
      __$$PostsStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostsStateInitialImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$PostsStateInitialImpl>
    implements _$$PostsStateInitialImplCopyWith<$Res> {
  __$$PostsStateInitialImplCopyWithImpl(_$PostsStateInitialImpl _value,
      $Res Function(_$PostsStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostsStateInitialImpl implements PostsStateInitial {
  const _$PostsStateInitialImpl();

  @override
  String toString() {
    return 'PostsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PostsStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(List<Post> posts) ready,
    required TResult Function(PostsStateErrorKind errorKind) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(List<Post> posts)? ready,
    TResult? Function(PostsStateErrorKind errorKind)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(List<Post> posts)? ready,
    TResult Function(PostsStateErrorKind errorKind)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsStateInitial value) initial,
    required TResult Function(PostsStateInProgress value) inProgress,
    required TResult Function(PostsStateReady value) ready,
    required TResult Function(PostsStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostsStateInitial value)? initial,
    TResult? Function(PostsStateInProgress value)? inProgress,
    TResult? Function(PostsStateReady value)? ready,
    TResult? Function(PostsStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsStateInitial value)? initial,
    TResult Function(PostsStateInProgress value)? inProgress,
    TResult Function(PostsStateReady value)? ready,
    TResult Function(PostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PostsStateInitial implements PostsState {
  const factory PostsStateInitial() = _$PostsStateInitialImpl;
}

/// @nodoc
abstract class _$$PostsStateInProgressImplCopyWith<$Res> {
  factory _$$PostsStateInProgressImplCopyWith(_$PostsStateInProgressImpl value,
          $Res Function(_$PostsStateInProgressImpl) then) =
      __$$PostsStateInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PostsStateInProgressImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$PostsStateInProgressImpl>
    implements _$$PostsStateInProgressImplCopyWith<$Res> {
  __$$PostsStateInProgressImplCopyWithImpl(_$PostsStateInProgressImpl _value,
      $Res Function(_$PostsStateInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PostsStateInProgressImpl implements PostsStateInProgress {
  const _$PostsStateInProgressImpl();

  @override
  String toString() {
    return 'PostsState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsStateInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(List<Post> posts) ready,
    required TResult Function(PostsStateErrorKind errorKind) error,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(List<Post> posts)? ready,
    TResult? Function(PostsStateErrorKind errorKind)? error,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(List<Post> posts)? ready,
    TResult Function(PostsStateErrorKind errorKind)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsStateInitial value) initial,
    required TResult Function(PostsStateInProgress value) inProgress,
    required TResult Function(PostsStateReady value) ready,
    required TResult Function(PostsStateError value) error,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostsStateInitial value)? initial,
    TResult? Function(PostsStateInProgress value)? inProgress,
    TResult? Function(PostsStateReady value)? ready,
    TResult? Function(PostsStateError value)? error,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsStateInitial value)? initial,
    TResult Function(PostsStateInProgress value)? inProgress,
    TResult Function(PostsStateReady value)? ready,
    TResult Function(PostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class PostsStateInProgress implements PostsState {
  const factory PostsStateInProgress() = _$PostsStateInProgressImpl;
}

/// @nodoc
abstract class _$$PostsStateReadyImplCopyWith<$Res> {
  factory _$$PostsStateReadyImplCopyWith(_$PostsStateReadyImpl value,
          $Res Function(_$PostsStateReadyImpl) then) =
      __$$PostsStateReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Post> posts});
}

/// @nodoc
class __$$PostsStateReadyImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$PostsStateReadyImpl>
    implements _$$PostsStateReadyImplCopyWith<$Res> {
  __$$PostsStateReadyImplCopyWithImpl(
      _$PostsStateReadyImpl _value, $Res Function(_$PostsStateReadyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$PostsStateReadyImpl(
      null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc

class _$PostsStateReadyImpl implements PostsStateReady {
  const _$PostsStateReadyImpl(final List<Post> posts) : _posts = posts;

  final List<Post> _posts;
  @override
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostsState.ready(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsStateReadyImpl &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsStateReadyImplCopyWith<_$PostsStateReadyImpl> get copyWith =>
      __$$PostsStateReadyImplCopyWithImpl<_$PostsStateReadyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(List<Post> posts) ready,
    required TResult Function(PostsStateErrorKind errorKind) error,
  }) {
    return ready(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(List<Post> posts)? ready,
    TResult? Function(PostsStateErrorKind errorKind)? error,
  }) {
    return ready?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(List<Post> posts)? ready,
    TResult Function(PostsStateErrorKind errorKind)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsStateInitial value) initial,
    required TResult Function(PostsStateInProgress value) inProgress,
    required TResult Function(PostsStateReady value) ready,
    required TResult Function(PostsStateError value) error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostsStateInitial value)? initial,
    TResult? Function(PostsStateInProgress value)? inProgress,
    TResult? Function(PostsStateReady value)? ready,
    TResult? Function(PostsStateError value)? error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsStateInitial value)? initial,
    TResult Function(PostsStateInProgress value)? inProgress,
    TResult Function(PostsStateReady value)? ready,
    TResult Function(PostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class PostsStateReady implements PostsState {
  const factory PostsStateReady(final List<Post> posts) = _$PostsStateReadyImpl;

  List<Post> get posts;
  @JsonKey(ignore: true)
  _$$PostsStateReadyImplCopyWith<_$PostsStateReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PostsStateErrorImplCopyWith<$Res> {
  factory _$$PostsStateErrorImplCopyWith(_$PostsStateErrorImpl value,
          $Res Function(_$PostsStateErrorImpl) then) =
      __$$PostsStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PostsStateErrorKind errorKind});
}

/// @nodoc
class __$$PostsStateErrorImplCopyWithImpl<$Res>
    extends _$PostsStateCopyWithImpl<$Res, _$PostsStateErrorImpl>
    implements _$$PostsStateErrorImplCopyWith<$Res> {
  __$$PostsStateErrorImplCopyWithImpl(
      _$PostsStateErrorImpl _value, $Res Function(_$PostsStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorKind = null,
  }) {
    return _then(_$PostsStateErrorImpl(
      null == errorKind
          ? _value.errorKind
          : errorKind // ignore: cast_nullable_to_non_nullable
              as PostsStateErrorKind,
    ));
  }
}

/// @nodoc

class _$PostsStateErrorImpl implements PostsStateError {
  const _$PostsStateErrorImpl(this.errorKind);

  @override
  final PostsStateErrorKind errorKind;

  @override
  String toString() {
    return 'PostsState.error(errorKind: $errorKind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostsStateErrorImpl &&
            (identical(other.errorKind, errorKind) ||
                other.errorKind == errorKind));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorKind);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsStateErrorImplCopyWith<_$PostsStateErrorImpl> get copyWith =>
      __$$PostsStateErrorImplCopyWithImpl<_$PostsStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() inProgress,
    required TResult Function(List<Post> posts) ready,
    required TResult Function(PostsStateErrorKind errorKind) error,
  }) {
    return error(errorKind);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? inProgress,
    TResult? Function(List<Post> posts)? ready,
    TResult? Function(PostsStateErrorKind errorKind)? error,
  }) {
    return error?.call(errorKind);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? inProgress,
    TResult Function(List<Post> posts)? ready,
    TResult Function(PostsStateErrorKind errorKind)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorKind);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PostsStateInitial value) initial,
    required TResult Function(PostsStateInProgress value) inProgress,
    required TResult Function(PostsStateReady value) ready,
    required TResult Function(PostsStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PostsStateInitial value)? initial,
    TResult? Function(PostsStateInProgress value)? inProgress,
    TResult? Function(PostsStateReady value)? ready,
    TResult? Function(PostsStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PostsStateInitial value)? initial,
    TResult Function(PostsStateInProgress value)? inProgress,
    TResult Function(PostsStateReady value)? ready,
    TResult Function(PostsStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PostsStateError implements PostsState {
  const factory PostsStateError(final PostsStateErrorKind errorKind) =
      _$PostsStateErrorImpl;

  PostsStateErrorKind get errorKind;
  @JsonKey(ignore: true)
  _$$PostsStateErrorImplCopyWith<_$PostsStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String authorId,
      String title,
      String content,
      DateTime createdAt});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String authorId,
      String title,
      String content,
      DateTime createdAt});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$PostImpl implements _Post {
  const _$PostImpl(
      {required this.id,
      required this.authorId,
      required this.title,
      required this.content,
      required this.createdAt});

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'Post(id: $id, authorId: $authorId, title: $title, content: $content, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, authorId, title, content, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);
}

abstract class _Post implements Post {
  const factory _Post(
      {required final String id,
      required final String authorId,
      required final String title,
      required final String content,
      required final DateTime createdAt}) = _$PostImpl;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String get title;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
