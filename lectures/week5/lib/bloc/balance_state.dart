class const BalanceState({required final int balance}) {
  BalanceState copyWith({int? balance}) =>
      BalanceState(balance: balance ?? this.balance);
}
