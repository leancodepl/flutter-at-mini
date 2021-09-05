// Non-nullability
void main() {
  var a = 1;
  int? b = null;

  print(b?.isEven ?? "Missing value");

  // b!.isEven;

  b ??= 3;
  b ??= 4;
  print(b);

  String? notAString = null;
  print(notAString?.length.isEven);

  lateSample();
  listSample();
}

void lateSample() {
  late String lateString;

  lateString = "late";
  print(lateString);

  late final String finalLate;

  finalLate = "first";
  //finalLate = "second";
}

void listSample() {
  List<String?>? list = null;
  print(list?[0]?.length ?? "Missing");
  list?..add("First");
  list = ["First", null];

  print(list[1]?.length ?? "Missing");
  list.forEach((element) => print(element));
}
