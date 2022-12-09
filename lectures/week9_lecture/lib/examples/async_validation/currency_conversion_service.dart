import 'package:forms_lecture/examples/async_validation/models.dart';
import 'package:tuple/tuple.dart';

class CurrencyConversionService {
  Future<CurrencyRateInfo> convert(Money amount, String targetCurrency) async {
    await Future<void>.delayed(const Duration(seconds: 3));

    final multiplier =
        _conversionTable[Tuple2(amount.currency, targetCurrency)] ?? 1;

    return CurrencyRateInfo(
      multiplier: multiplier,
      from: amount,
      to: Money(multiplier * amount.amount, targetCurrency),
    );
  }
}

final _conversionTable = <Tuple2<String, String>, double>{
  const Tuple2('PLN', 'USD'): 0.23,
  const Tuple2('PLN', 'EUR'): 0.21,
  const Tuple2('USD', 'PLN'): 4.44,
  const Tuple2('USD', 'EUR'): 0.95,
  const Tuple2('EUR', 'PLN'): 4.67,
  const Tuple2('EUR', 'USD'): 1.05,
};
