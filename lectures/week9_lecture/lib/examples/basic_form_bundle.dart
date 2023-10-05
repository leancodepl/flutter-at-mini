import 'package:flutter/material.dart';

class BasicBundleFormRoute extends MaterialPageRoute<void> {
  BasicBundleFormRoute()
      : super(
          builder: (context) => const _BasicFormBundle(),
        );
}

@immutable
class MyFormBundle {
  const MyFormBundle({
    required this.text,
    required this.checkbox,
    required this.slider,
  });

  final String text;
  final bool checkbox;
  final double slider;
}

class _MyFormBundleBuilder {
  String? text;
  bool? checkbox;
  double? slider;

  MyFormBundle build() {
    final text = this.text;
    final checkbox = this.checkbox;
    final slider = this.slider;

    if (text == null || checkbox == null || slider == null) {
      throw StateError('Some values are missing');
    }

    return MyFormBundle(
      text: text,
      checkbox: checkbox,
      slider: slider,
    );
  }
}

class _BasicFormBundle extends StatefulWidget {
  const _BasicFormBundle();

  @override
  State<_BasicFormBundle> createState() => _BasicFormBundleState();
}

class _BasicFormBundleState extends State<_BasicFormBundle> {
  late final GlobalKey<FormState> _formKey;
  late final _MyFormBundleBuilder _bundleBuilder;

  MyFormBundle get _bundle => _bundleBuilder.build();

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey();
    _bundleBuilder = _MyFormBundleBuilder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic form with bundle'),
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
              decoration: const InputDecoration(
                label: Text('Text field'),
              ),
              onSaved: (value) => _bundleBuilder..text = value,
            ),
            const SizedBox(height: 16),
            FormField<bool>(
              initialValue: false,
              onSaved: (value) => _bundleBuilder..checkbox = value,
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
            const SizedBox(height: 16),
            FormField<double>(
              initialValue: 0.5,
              onSaved: (value) => _bundleBuilder..slider = value,
              builder: (field) => Slider(
                value: field.value ?? 0,
                onChanged: field.didChange,
                min: 0,
                max: 1,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (!(_formKey.currentState?.validate() ?? false)) {
                  return;
                }

                final bundle = _bundle;

                print(
                  'Form values: '
                  'text: ${bundle.text}, '
                  'checkbox: ${bundle.checkbox}, '
                  'slider: ${bundle.slider}',
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
