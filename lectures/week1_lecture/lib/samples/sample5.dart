// Collections
void main() {
  list();
  map();
  set();
}

void list() {
  final names = ["Bob", "Zoe"];
  names.forEach((element) => print(element));

  // Modify growable
  final emptyList = List<String>.empty(growable: true);
  emptyList.add("value");

  final newList = ["Next", ...names];
  for (final element in newList) {
    print(element);
  }

  names
    ..add("Roger")
    ..add("Alice");
  names.forEach((element) => print(element));
}

void map() {
  final candidates = {
    1: "Bob",
    2: "Zoe",
  };
  print(candidates[1]);

  candidates[3] = "Roger";
  candidates.forEach((key, value) => print("$key - $value"));
}

void set() {
  final candidates = {
    "Bob",
    "Zoe",
    "Bob",
  };

  candidates.add("Roger");
  candidates.forEach((element) => print(element));
}
