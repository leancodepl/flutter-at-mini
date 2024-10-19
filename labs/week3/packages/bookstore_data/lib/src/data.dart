import 'package:faker/faker.dart';
import 'package:meta/meta.dart';

import 'entities.dart';

final _faker = Faker(seed: 2137);

@internal
final authors = List.generate(
  6,
  (index) => Author(
    id: _faker.guid.guid(),
    name: _faker.person.name(),
    pictureUrl:
        _faker.image.loremPicsum(width: 300, height: 300, random: index),
    bio: _faker.lorem.sentences(3).join(' '),
  ),
);

@internal
final genres = [
  Genre(id: _faker.guid.guid(), name: 'Fantasy'),
  Genre(id: _faker.guid.guid(), name: 'Science Fiction'),
  Genre(id: _faker.guid.guid(), name: 'Mystery'),
  Genre(id: _faker.guid.guid(), name: 'Thriller'),
  Genre(id: _faker.guid.guid(), name: 'Romance'),
  Genre(id: _faker.guid.guid(), name: "Children's"),
  Genre(id: _faker.guid.guid(), name: 'Young Adult'),
];

@internal
final books = List.generate(
  1000,
  (index) => Book(
    id: _faker.guid.guid(),
    title: _faker.lorem.words(3).join(' '),
    author: _faker.randomGenerator.element(authors),
    genre: _faker.randomGenerator.element(genres),
    coverUrl: _faker.image.loremPicsum(width: 210, height: 270, random: index),
    publishDate: _faker.date.dateTime(minYear: 1850, maxYear: 2020),
    description: _faker.lorem.sentences(20).join(' '),
  ),
);
