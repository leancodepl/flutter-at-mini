import 'package:bookstore_data/src/data.dart' as data;
import 'package:equatable/equatable.dart';

class const Book({
  required final String id,
  required final String title,
  required final Author author,
  required final Genre genre,
  required final String coverUrl,
  required final DateTime publishDate,
  required final String description,
}) with Equatable {
  @override
  List<Object?> get props => [
    id,
    title,
    author,
    genre,
    coverUrl,
    publishDate,
    description,
  ];
}

class const Author({
  required final String id,
  required final String name,
  required final String pictureUrl,
  required final String bio,
}) with Equatable {
  Iterable<Genre> get genres => data.books
      .where((book) => book.author.id == id)
      .map((book) => book.genre)
      .toSet();

  Iterable<Book> get books => data.books.where((book) => book.author.id == id);

  @override
  List<Object?> get props => [id, name, pictureUrl, bio];
}

class const Genre({required final String id, required final String name})
    with Equatable {
  Iterable<Author> get authors => data.books
      .where((book) => book.genre.id == id)
      .map((book) => book.author)
      .toSet();

  Iterable<Book> get books => data.books.where((book) => book.genre.id == id);

  @override
  List<Object?> get props => [id, name];
}
