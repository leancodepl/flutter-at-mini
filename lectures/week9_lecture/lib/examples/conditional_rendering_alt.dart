import 'package:flutter/material.dart';

class ConditionalRenderingAltRoute extends MaterialPageRoute<void> {
  ConditionalRenderingAltRoute()
      : super(
          builder: (context) => const _ConditionalRenderingAltForm(),
        );
}

class _ConditionalRenderingAltForm extends StatefulWidget {
  const _ConditionalRenderingAltForm();

  @override
  State<_ConditionalRenderingAltForm> createState() =>
      _ConditionalRenderingAltFormState();
}

class _ConditionalRenderingAltFormState
    extends State<_ConditionalRenderingAltForm> {
  late final GlobalKey<FormState> _formKey;

  late final GlobalKey<FormFieldState<String>> _textKey;
  late final GlobalKey<FormFieldState<bool>> _checkboxKey;
  late final GlobalKey<FormFieldState<double>> _sliderKey;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey();

    _textKey = GlobalKey();
    _checkboxKey = GlobalKey();
    _sliderKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditional rendering alternative'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 40,
          ),
          children: [
            TextFormField(
              key: _textKey,
              decoration: const InputDecoration(
                label: Text('Text field'),
              ),
            ),
            const SizedBox(height: 16),
            FormField<bool>(
              key: _checkboxKey,
              initialValue: false,
              builder: (field) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: field.value,
                        onChanged: field.didChange,
                      ),
                      const Expanded(
                        child: Text('Checkbox field'),
                      ),
                    ],
                  ),
                  if (field.hasError)
                    Text(
                      field.errorText ?? '',
                      style: const TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
            FormField(
              builder: (_) {
                if (_checkboxKey.currentState?.value ?? false) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: FormField<double>(
                      key: _sliderKey,
                      initialValue: 0.5,
                      builder: (field) => Slider(
                        value: field.value ?? 0,
                        onChanged: field.didChange,
                        min: 0,
                        max: 1,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (!(_formKey.currentState?.validate() ?? false)) {
                  return;
                }

                final text = _textKey.currentState?.value;
                final checkbox = _checkboxKey.currentState?.value;
                final slider = _sliderKey.currentState?.value;

                print(
                  'Form values: '
                  'text: $text, '
                  'checkbox: $checkbox, '
                  'slider: $slider',
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
