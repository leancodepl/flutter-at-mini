class BalanceState {
  const BalanceState({required this.balance});

  final int balance;

  BalanceState copyWith({int? balance}) =>
      BalanceState(balance: balance ?? this.balance);
}
