sealed class PaymentStatus();

class PaymentSuccess({required final String transactionId})
    extends PaymentStatus;

class PaymentFailure({
  required final int errorCode,
  required final String errorDescription,
}) extends PaymentStatus;

class PaymentPending() extends PaymentStatus;
