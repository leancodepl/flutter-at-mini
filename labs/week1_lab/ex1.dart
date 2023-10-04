class User {
  User(this.name, this.age, {this.luckyNumber});

  final String name;
  final int age;
  final int? luckyNumber;

  @override
  String toString() => '$name $age luckyNumber: $luckyNumber';
}

final users = [
  User('Linus', 53, luckyNumber: 32),
  User('Richard', 20),
  User('Bjarne', 72, luckyNumber: 18),
  User('Chris', 45),
  User('Bill', 30, luckyNumber: 16),
  User('Clarissa', 23, luckyNumber: 4),
  User('Clara', 15),
  User('Beatrice', 60, luckyNumber: 17),
  User('Dobrosława', 29),
  User('Arnold 🇦🇹', 41),
  User('Julianna', 30),
  User('Cindi', 53, luckyNumber: 48),
  User('Fredric', 36),
  User('Garfield 🍝', 15),
  User('Melyssa 😳', 34),
];

void main() {
  runPart(1, part1);
  runPart(2, part2);
  runPart(3, part3);
  runPart(4, part4);
  runPart(5, part5);
}



// YOUR TASK begins here.
// For each part, return the result from its function.
// Try avoiding using loops. You can use the packages available in dartpad.


/// Get users between 40 and 50 years old
void part1() {}

/// For users whose name ends with 'a', get the lengths of their names.
/// Sort the results in a descending order
void part2() {}

/// Get all characters from all names
void part3() {}

/// Find users, whose index in the list divides their age. (Let's assume 0 divides everything)
/// Return the users with their original indices.
void part4() {}

/// Group users by the first letter of their name. For each group find the largest lucky number
void part5() {}


// YOUR TASK ends here.



void runPart(int id, dynamic Function() part) {
  print('====== Part $id ======');
  final result = part();
  print('Result:\n$result\n');
}
