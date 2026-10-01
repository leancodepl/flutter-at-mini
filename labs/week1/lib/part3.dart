void part3() {
  print('\n=== Part 3: OOP ===');

  const animals = [
    Dog('Buddy', age: 3, color: 'brown'),
    Cat('Whiskers', age: 2, color: 'white'),
    Cow('MooMoo', age: 5, weight: 500),
  ];

  for (final animal in animals) {
    print(animal.description);
    animal.makeSound();
    print(switch (animal) {
      Dog(:final color) || Cat(:final color) => 'Color: $color',
      Cow(:final weight) => 'Weight: $weight',
    });
  }
}

sealed class const Animal(final String name, {required final int age}) {
  String get description;

  void makeSound();
}

class const Dog(super.name, {required super.age, required final String color})
    extends Animal {
  @override
  String get description => 'A $color dog named $name';

  @override
  void makeSound() {
    print('Woof woof');
  }
}

class const Cat(super.name, {required super.age, required final String color})
    extends Animal {
  @override
  String get description => 'A $color cat named $name';

  @override
  void makeSound() {
    print('Meow');
  }
}

class const Cow(super.name, {required super.age, required final int weight})
    extends Animal {
  @override
  String get description => 'A cow named $name weighing $weight kg';

  @override
  void makeSound() {
    print('Moo');
  }
}
