import 'package:flutter/material.dart';
import 'package:forms_lecture/examples/async_validation/async_state.dart';
import 'package:forms_lecture/examples/async_validation/models.dart';

class CurrencyRateField extends StatelessWidget {
  const CurrencyRateField({
    super.key,
    required this.data,
  });

  final AsyncState<CurrencyRateInfo> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Column(
        children: [
          const Text('Currency conversion rate'),
          const SizedBox(height: 4),
          data.when(
            initial: () => const SizedBox(),
            loading: () => const CircularProgressIndicator(),
            result: (data) => Text(
              'Total: ${data.to.currency} ${data.to.amount}, '
              'rate: ${data.from.currency} 1 = ${data.to.currency} ${data.multiplier.toStringAsFixed(4)}',
            ),
          ),
        ],
      ),
    );
  }
}
