import './7_sealed_classes_1.dart';

// we can't extend PaymentStatus here
// class PaymentCanceled extends PaymentStatus {}

void handlePaymentStatus(PaymentStatus status) {
  switch (status) {
    case PaymentSuccess():
    // TODO: Handle this case.
    case PaymentFailure():
    // TODO: Handle this case.
    case PaymentPending():
    // TODO: Handle this case.
  }
}
