sealed class CartEvent {}

class ResetBeers extends CartEvent {
  ResetBeers();
}

class AddBeer extends CartEvent {
  AddBeer({required this.beerId});

  final int beerId;
}
