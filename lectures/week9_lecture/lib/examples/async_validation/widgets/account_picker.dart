import 'package:flutter/material.dart';
import 'package:forms_lecture/examples/async_validation/data.dart';
import 'package:forms_lecture/examples/async_validation/models.dart';

class AccountPicker extends FormField<BankAccount> {
  AccountPicker({
    Key? key,
    BankAccount? initialValue,
    FormFieldValidator<BankAccount>? validator,
    InputDecoration? decoration,
  }) : super(
          key: key,
          initialValue: initialValue,
          validator: validator,
          builder: (field) {
            return DropdownButtonFormField<BankAccount>(
              items: [
                for (final account in accounts)
                  DropdownMenuItem(
                    value: account,
                    child: Text(
                        '${account.name} (${account.funds.currency} ${account.funds.amount})'),
                  ),
              ],
              value: field.value,
              onChanged: field.didChange,
              validator: validator,
              decoration: decoration,
            );
          },
        );
}
