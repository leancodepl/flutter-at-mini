import '7_sealed_classes_1.dart';

void printStatus(PaymentStatus status) {
  switch (status) {
    case PaymentSuccess(transactionId: var t):
      print('success with id: $t');
    case PaymentFailure(errorCode: int code):
      print('failure with code: $code');
    case PaymentPending():
      print('still pending');
  }
}

void main() {
  printStatus(PaymentSuccess(transactionId: '123456'));
  printStatus(
    PaymentFailure(
      errorCode: -1,
      errorDescription: 'unknown error',
    ),
  );
  printStatus(PaymentPending());
}
