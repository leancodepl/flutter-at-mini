import 'package:flutter/material.dart';

class ConditionalRenderingRoute extends MaterialPageRoute {
  ConditionalRenderingRoute()
      : super(
          builder: (context) => const _ConditionalRenderingForm(),
        );
}

class _ConditionalRenderingForm extends StatefulWidget {
  const _ConditionalRenderingForm();

  @override
  State<_ConditionalRenderingForm> createState() =>
      _ConditionalRenderingFormState();
}

class _ConditionalRenderingFormState extends State<_ConditionalRenderingForm> {
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

  void _forceRebuild() {
    print('rebuilding');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditional rendering'),
      ),
      body: Form(
        key: _formKey,
        onChanged: _forceRebuild,
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
            if (_checkboxKey.currentState?.value ?? false) ...[
              const SizedBox(height: 16),
              FormField<double>(
                key: _sliderKey,
                initialValue: 0.5,
                builder: (field) => Slider(
                  value: field.value ?? 0,
                  onChanged: field.didChange,
                  min: 0,
                  max: 1,
                ),
              ),
            ],
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
