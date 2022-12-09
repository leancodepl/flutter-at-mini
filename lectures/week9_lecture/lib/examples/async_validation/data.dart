import 'package:forms_lecture/examples/async_validation/models.dart';

const supportedCurrencies = [
  'PLN',
  'USD',
  'EUR',
];

const accounts = [
  BankAccount(
    name: 'My personal account',
    funds: Money(2000, 'PLN'),
  ),
  BankAccount(
    name: 'My EUR account',
    funds: Money(1000, 'EUR'),
  ),
];
