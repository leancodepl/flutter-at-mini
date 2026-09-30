sealed class PaymentStatus {}

class PaymentSuccess extends PaymentStatus {
  PaymentSuccess({required this.transactionId});

  final String transactionId;
}

class PaymentFailure extends PaymentStatus {
  PaymentFailure({required this.errorCode, required this.errorDescription});

  final int errorCode;
  final String errorDescription;
}

class PaymentPending extends PaymentStatus {}
