import 'package:equatable/equatable.dart';

import 'data.dart' as data;

class Book with EquatableMixin {
  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.coverUrl,
    required this.publishDate,
    required this.description,
  });

  final String id;
  final String title;
  final Author author;
  final Genre genre;
  final String coverUrl;
  final DateTime publishDate;
  final String description;

  @override
  List<Object?> get props =>
      [id, title, author, genre, coverUrl, publishDate, description];
}

class Author with EquatableMixin {
  const Author({
    required this.id,
    required this.name,
    required this.pictureUrl,
    required this.bio,
  });

  final String id;
  final String name;
  final String pictureUrl;
  final String bio;

  Iterable<Genre> get genres => data.books
      .where((book) => book.author.id == id)
      .map((book) => book.genre)
      .toSet();

  Iterable<Book> get books => data.books.where((book) => book.author.id == id);

  @override
  List<Object?> get props => [id, name, pictureUrl, bio];
}

class Genre with EquatableMixin {
  const Genre({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  Iterable<Author> get authors => data.books
      .where((book) => book.genre.id == id)
      .map((book) => book.author)
      .toSet();

  Iterable<Book> get books => data.books.where((book) => book.genre.id == id);

  @override
  List<Object?> get props => [id, name];
}
