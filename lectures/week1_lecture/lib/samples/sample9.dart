// Extensions
void main() {
  var name = "42";
  print(name.parseInt());
}

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
}
