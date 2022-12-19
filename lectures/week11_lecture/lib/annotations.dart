// Annotation is any constant class
class Obsolete {
  const Obsolete([this.message]);

  final String? message;
}

@Obsolete('Use `NewApi` instead.')
class OldApi {}

// You can even use inheritance
class Noop extends Obsolete {
  const Noop() : super('This is obsolete and no longer does anything.');
}

const noop = Noop();

// as long as it is a constant it can be an annotation
@noop
class OldStubbedApi {}
