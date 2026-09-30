import 'dart:math';

enum SimpleEnum { one, two, three }

// Enums can have fields and constructors like regular classes.
enum EnumWithFields {
  one(1, label: 'one'),
  two.emptyLabel(2),
  three(3, label: 'three');

  // Generative enum constructors have to be const.
  const EnumWithFields(this.value, {required this.label});
  const EnumWithFields.emptyLabel(this.value) : label = '';

  // Factories don't have to be const.
  factory EnumWithFields.random() {
    if (Random().nextBool()) {
      return one;
    } else {
      return two;
    }
  }

  final int value;
  final String label;
}

// Enums can be generic – each enum value can have a different type parameter.
enum GenericEnum<T> {
  one<int>(1),
  two<String>('two'),
  three<List<int>>([3, 3, 3]);

  const GenericEnum(this.value);

  final T value;
}

mixin EnumMixin on Enum {
  String get fancyName => '*** $name ***';
}

// Enums can implement interfaces, have mixins and methods.
enum EnumWithMethods with EnumMixin implements Comparable<EnumWithMethods> {
  one,
  two,
  three;

  String formatLabel() {
    // Inside enum methods, you can access num values (like `three`) without the prefix
    if (this == three) {
      return "Third time's the charm";
    }

    return name;
  }

  @override
  int compareTo(EnumWithMethods other) => index.compareTo(other.index);

  bool operator <(EnumWithMethods other) => compareTo(other) < 0;

  @override
  toString() => 'My enum value: $name';
}

void main() {
  print('=== Traditional enums ===');
  print(SimpleEnum.one);
  print(SimpleEnum.one.name);
  print(SimpleEnum.one.index);
  print(SimpleEnum.values);
  print('');

  print('=== Enums with fields ===');
  print(EnumWithFields.one);
  print(EnumWithFields.one.value);
  print(EnumWithFields.one.label);
  print('');

  print('=== Generic enums ===');
  print(GenericEnum.one.runtimeType);
  print(GenericEnum.one.value.isOdd);
  print(GenericEnum.three.value[2]);
  print('');

  print('=== Enums with methods ===');
  print(EnumWithMethods.one.formatLabel());
  print(EnumWithMethods.one < EnumWithMethods.two);
  print(EnumWithMethods.one.compareTo(EnumWithMethods.two));
  print(EnumWithMethods.one.fancyName);
}
