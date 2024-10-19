import 'src/data.dart' as data;
import 'src/entities.dart';

export 'src/entities.dart';

abstract class Bookstore {
  static final books = data.books;
  static final authors = data.authors;
  static final genres = data.genres;

  Book getBook({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return books.firstWhere((book) => book.id == id);
  }

  Author getAuthor({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return authors.firstWhere((author) => author.id == id);
  }

  Genre getGenre({required String id}) {
    if (id.startsWith(':')) {
      throw ArgumentError(_paramColorError);
    }
    return genres.firstWhere((genre) => genre.id == id);
  }
}

const _paramColorError =
    "`:` is not part of the ID – it's only used in go_router to mark a path parameter";
