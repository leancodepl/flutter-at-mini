import 'package:comms/comms.dart';
import 'package:week6_lab/comms/cart_events.dart';

class BeersCartCubit extends ListenerCubit<int, CartEvent> {
  BeersCartCubit() : super(0);

  add() => emit(state + 1);
  reset() => emit(0);

  @override
  void onMessage(CartEvent event) {
    switch (event) {
      case ResetBeers():
        reset();
      case AddBeer():
        add();
    }
  }
}
