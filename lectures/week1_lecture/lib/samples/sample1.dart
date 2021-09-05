// Variables
void main() {
  var name = "Bob";
  final name2 = "Bob";
  const name3 = "Bob";
  Object name4 = "Bob";
  String name5 = "Bob";

  moreComplexExample();
}

void moreComplexExample() {
  var name = "Bob";
  //name = 1;

  Object objectName = "Bob";
  objectName = 1;

  dynamic dynamicName = "Bob";
  dynamicName = 5;

  print(objectName);

  // print(objectName.length);

  print(dynamicName.length);
}
