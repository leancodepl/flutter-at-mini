import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:forms_lecture/examples/async_validation/async_state.dart';
import 'package:forms_lecture/examples/async_validation/currency_conversion_service.dart';
import 'package:forms_lecture/examples/async_validation/data.dart';
import 'package:forms_lecture/examples/async_validation/models.dart';
import 'package:forms_lecture/examples/async_validation/widgets/account_picker.dart';
import 'package:forms_lecture/examples/async_validation/widgets/currency_picker.dart';
import 'package:forms_lecture/examples/async_validation/widgets/currency_rate_field.dart';
import 'package:provider/provider.dart';

class AsyncValidationRoute extends MaterialPageRoute {
  AsyncValidationRoute()
      : super(
          builder: (context) => Provider<CurrencyConversionService>(
            create: (context) => CurrencyConversionService(),
            child: const _AsyncValidationForm(),
          ),
        );
}

class _AsyncValidationForm extends StatefulWidget {
  const _AsyncValidationForm();

  @override
  State<_AsyncValidationForm> createState() => _AsyncValidationFormState();
}

class _AsyncValidationFormState extends State<_AsyncValidationForm> {
  late final GlobalKey<FormState> _formKey;

  late final GlobalKey<FormFieldState<BankAccount>> _accountFieldKey;
  late final GlobalKey<FormFieldState<String>> _paymentCurrencyFieldKey;
  late final GlobalKey<FormFieldState<String>> _paymentAmountFieldKey;

  late final GlobalKey<FormFieldState<AsyncState<CurrencyRateInfo>>>
      _currencyRateFieldKey;

  CurrencyConversionController? _currencyConversionController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey();

    _accountFieldKey = GlobalKey();
    _paymentCurrencyFieldKey = GlobalKey();
    _paymentAmountFieldKey = GlobalKey();

    _currencyRateFieldKey = GlobalKey();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_currencyConversionController == null) {
      _currencyConversionController = CurrencyConversionController(
        conversionService: context.read(),
      );
      _currencyConversionController?.addListener(_updateConversionField);
    }
  }

  @override
  void dispose() {
    _currencyConversionController?.removeListener(_updateConversionField);
    super.dispose();
  }

  void _updateConversionField() {
    print('updating state ${_currencyConversionController?.state}');
    _currencyRateFieldKey.currentState
        ?.didChange(_currencyConversionController?.state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async validation'),
      ),
      body: Form(
        key: _formKey,
        onChanged: () {
          final currencyConversionController = _currencyConversionController;
          if (currencyConversionController != null) {
            currencyConversionController
              ..amount = double.tryParse(
                  _paymentAmountFieldKey.currentState?.value ?? '')
              ..fromCurrency =
                  _accountFieldKey.currentState?.value?.funds.currency
              ..toCurrency = _paymentCurrencyFieldKey.currentState?.value;
          }
        },
        child: ListView(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: 40,
          ),
          children: [
            AccountPicker(
              key: _accountFieldKey,
              initialValue: accounts.first,
              decoration: const InputDecoration(
                label: Text('Account'),
              ),
            ),
            const SizedBox(height: 24),
            CurrencyPickerField(
              key: _paymentCurrencyFieldKey,
              initialValue: supportedCurrencies.first,
              decoration: const InputDecoration(
                label: Text('Currency'),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              key: _paymentAmountFieldKey,
              decoration: const InputDecoration(
                label: Text('Amount'),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                final parsed = double.tryParse(value ?? '');

                if (parsed == null) {
                  return 'Invalid value';
                }

                if (parsed == 0) {
                  return 'The amount must be greater than 0';
                }

                final selectedCurrency =
                    _paymentCurrencyFieldKey.currentState!.value!;
                final selectedAccount = _accountFieldKey.currentState!.value!;
                final currencyRateInfo =
                    _currencyRateFieldKey.currentState!.value!.whenOrNull(
                  result: (data) => data,
                );

                if (selectedCurrency == selectedAccount.funds.currency &&
                    parsed > selectedAccount.funds.amount) {
                  return 'Not enough funds';
                }
                if (selectedCurrency != selectedAccount.funds.currency &&
                    currencyRateInfo != null &&
                    selectedCurrency == currencyRateInfo.to.currency &&
                    parsed > currencyRateInfo.to.amount) {
                  return 'Not enough funds';
                }

                return null;
              },
            ),
            FormField<AsyncState<CurrencyRateInfo>?>(
              key: _currencyRateFieldKey,
              validator: (value) => value?.when(
                initial: () => '',
                loading: () => '',
                result: (data) => null,
              ),
              builder: (field) {
                final value = field.value;

                print('building $value');
                if (value == null) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: CurrencyRateField(data: value),
                );
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (!(_formKey.currentState?.validate() ?? false)) {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CurrencyConversionController extends ChangeNotifier {
  CurrencyConversionController({
    required CurrencyConversionService conversionService,
  }) : _conversionService = conversionService;

  final CurrencyConversionService _conversionService;

  int _generation = 0;
  double? _amount;
  String? _fromCurrency;
  String? _toCurrency;

  set amount(double? value) {
    if (value != _amount) {
      _amount = value;
      _tryConvert();
    }
  }

  set fromCurrency(String? value) {
    if (value != _fromCurrency) {
      _fromCurrency = value;
      _tryConvert();
    }
  }

  set toCurrency(String? value) {
    if (value != _toCurrency) {
      _toCurrency = value;
      _tryConvert();
    }
  }

  AsyncState<CurrencyRateInfo>? _state;
  AsyncState<CurrencyRateInfo>? get state => _state;

  Future<void> _tryConvert() async {
    final amount = _amount;
    final fromCurrency = _fromCurrency;
    final toCurrency = _toCurrency;

    if (amount != null && fromCurrency != null && toCurrency != null) {
      return _convert(
        amount: amount,
        fromCurrency: fromCurrency,
        toCurrency: toCurrency,
      );
    }
  }

  Future<void> _convert({
    required double amount,
    required String fromCurrency,
    required String toCurrency,
  }) async {
    _generation++;

    if (fromCurrency == toCurrency) {
      _state = null;
      notifyListeners();
    }

    final thisGeneration = _generation;
    _state = const AsyncState.loading();
    notifyListeners();

    final result = await _conversionService.convert(
      Money(amount, fromCurrency),
      toCurrency,
    );

    if (thisGeneration != _generation) {
      return;
    }

    _state = AsyncState.result(result);
    notifyListeners();
  }
}
