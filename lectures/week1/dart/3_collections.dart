final list = [1, 2, 3];

// spread operator
final list2 = [...list, 4];

final map = {'foo': 10, 'bar': 20};

final map2 = {'foo': 10, 0.5: String};

final map3 = {...map2, 0.5: int};

final set = {1, 2, 3};

List<int>? get nullableList => [1, 2, 3];
int? get nullableItem1 => 123;
int? get nullableItem2 => null;

final List<int> listFromNullables = [
  // Spread the collection if not null
  ...?nullableList,
  // Include element in the collection if not null
  ?nullableItem1,
  ?nullableItem2,
];

void main() {
  print(list2);
  print(map3);
  print(set);
  print(listFromNullables);
}
