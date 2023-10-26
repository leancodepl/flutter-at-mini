import 'package:bookstore_data/authors.dart';
import 'package:bookstore_data/entities.dart';
import 'package:bookstore_data/genres.dart';
import 'package:faker/faker.dart';

final _faker = Faker(seed: 2137);

final books = List.generate(
  1000,
  (index) => Book(
    id: _faker.guid.guid(),
    title: _faker.lorem.words(3).join(' '),
    author: _faker.randomGenerator.element(authors),
    genre: _faker.randomGenerator.element(genres),
    coverUrl: _faker.image.image(width: 210, height: 270, random: true),
    publishDate: _faker.date.dateTime(minYear: 1850, maxYear: 2020),
    description: _faker.lorem.sentences(20).join(' '),
  ),
);
