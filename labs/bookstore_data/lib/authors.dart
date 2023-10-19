import 'package:bookstore_data/entities.dart';
import 'package:faker/faker.dart';

final _faker = Faker();

final authors = List.generate(
  6,
  (index) => Author(
    id: _faker.guid.guid(),
    name: _faker.person.name(),
    pictureUrl: _faker.image.image(
      width: 300,
      height: 300,
      keywords: ['avatar', 'people'],
      random: true,
    ),
    bio: _faker.lorem.sentences(3).join(' '),
  ),
);
