abstract class Animal {
  String speak();
}

class Dog extends Animal implements Huggable {
  @override
  String speak() => 'Woof woof!';

  @override
  void hug() {
    print('Ah woooo!');
  }
}

abstract class Huggable {
  void hug() {
    print('Hug');
  }
}

mixin Meow {
  String speak() => 'Meow';
}

mixin Woof {
  String speak() => 'Woof!';
}

class Cat extends Animal with Meow {}

class Cat2 extends Animal with Meow {
  @override
  String speak() => 'Meow meow';
}

class CatDog extends Animal with Meow, Woof implements Dog, Cat {
  @override
  void hug() {}
}

void main() {
  final catDog = CatDog();

  print(catDog.speak());
  print(catDog is Dog);
  print(catDog is Cat);
}
