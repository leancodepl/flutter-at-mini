import 'package:flutter/material.dart';
import 'package:forms_lecture/examples/async_validation/data.dart';

class CurrencyPickerField extends FormField<String> {
  CurrencyPickerField({
    super.key,
    super.initialValue,
    super.validator,
    InputDecoration? decoration,
  }) : super(
          builder: (field) {
            return DropdownButtonFormField<String>(
              value: field.value,
              items: [
                for (final currency in supportedCurrencies)
                  DropdownMenuItem(
                    value: currency,
                    child: Text(currency),
                  ),
              ],
              onChanged: field.didChange,
              validator: validator,
              decoration: decoration,
            );
          },
        );
}
