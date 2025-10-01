foo() {}

int bar() {
  return 42;
}

int bar2() => 42;

void fun(int arg1, int arg2) {}

void fun2(int arg1, {int? arg2}) {}

void fun3(int arg1, [int? arg2, int? arg3]) {}

void main() {
  fun(1, 2);
  fun2(1);
  fun2(1, arg2: 2);
  fun3(1, 2);
  fun3(1, 2, 3);

  // `Function` is a supertype of all functions and allows for dynamic dispatch
  void run(Function f) => f(2, 3);

  // Use type-safe function types to validate usages at compile time
  void runTypeSafe(String Function(int, int) f) => print(f(2, 3).length);

  // tear-off
  const op = fun;
  op(1, 2);
  run(fun);

  runTypeSafe((x, y) => 'x: $x, y: $y');
  // This won't compile:
  // runTypeSafe((x, y) => x + y);
}
