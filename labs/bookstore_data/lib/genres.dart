import 'package:bookstore_data/entities.dart';
import 'package:faker/faker.dart';

final _faker = Faker();

final genres = <Genre>[
  Genre(id: _faker.guid.guid(), name: 'Fantasy'),
  Genre(id: _faker.guid.guid(), name: 'Science Fiction'),
  Genre(id: _faker.guid.guid(), name: 'Mystery'),
  Genre(id: _faker.guid.guid(), name: 'Thriller'),
  Genre(id: _faker.guid.guid(), name: 'Romance'),
  Genre(id: _faker.guid.guid(), name: 'Children\'s'),
  Genre(id: _faker.guid.guid(), name: 'Young Adult'),
];
