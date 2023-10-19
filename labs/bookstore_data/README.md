# Bookstore data

The book store contains information about its books. This package exposes three
lists:

- `books`: a list of all books available in the store
- `authors`: a list of all authors of the books available
- `genres`: a list of all book genres available in the store

The following information is provided on the books:

- title,
- author,
- genre,
- URL of its cover image,
- date of publishing,
- a short description;

on authors:

- name,
- URL of their profile picture,
- list of books,
- list of genres;

and finally on genres:

- name,
- books in this genre,
- authors.

## Usage

If you didn't know yet, you can depend on packages that aren't published on
[pub.dev](https://pub.dev)! Add an entry to your pubspec.yaml that points to
this package in the course's git repository:

```yaml
bookstore_data:
  git:
    url: https://github.com/leancodepl/flutter-at-mini
    ref: "2023/2024"
    path: labs/bookstore_data
```

Now run `flutter pub get` and you should be able to import the package. Try
accessing the data via one of the following classes!

```dart
import 'package:bookstore_data/bookstore_data.dart';

print(Bookstore.books); // this should give you a list of all the books,
print(Bookstore.authors); // authors,
print(Bookstore.genres); // and genres

// There are also three classes: `Book`, `Author` and `Genre`
```
