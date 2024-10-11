import '7_sealed_classes_1.dart';

void printStatus(PaymentStatus status) {
  switch (status) {
    case PaymentSuccess(transactionId: var t):
      print('success with id: $t');
    case PaymentFailure(errorCode: int code, :final errorDescription):
      print('failure with code: $code');
    case PaymentPending():
      print('still pending');
  }
}

final failure = PaymentFailure(errorCode: 123, errorDescription: 'hello');

void main() {
  // without:
  final code = failure.errorCode;
  final errorDescription = failure.errorDescription;

  // with:
  final PaymentFailure(
    errorCode: code,
    errorDescription: description,
  ) = failure;

  
  final PaymentFailure(
    :errorCode,
    :errorDescription,
  ) = failure;


  printStatus(PaymentSuccess(transactionId: '123456'));
  printStatus(
    PaymentFailure(
      errorCode: -1,
      errorDescription: 'unknown error',
    ),
  );
  printStatus(PaymentPending());
}
