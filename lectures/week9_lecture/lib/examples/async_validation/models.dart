import 'package:meta/meta.dart';

@immutable
class Money {
  const Money(this.amount, this.currency);

  final double amount;
  final String currency;
}

@immutable
class BankAccount {
  const BankAccount({
    required this.name,
    required this.funds,
  });

  final String name;
  final Money funds;
}

@immutable
class CurrencyRateInfo {
  const CurrencyRateInfo({
    required this.multiplier,
    required this.from,
    required this.to,
  });

  final Money from;
  final Money to;

  /// from = to * multiplier
  final double multiplier;
}
