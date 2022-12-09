import 'package:flutter/material.dart';

class CheckboxFormField extends StatelessWidget {
  const CheckboxFormField({
    super.key,
    this.autovalidateMode,
    this.enabled = true,
    required this.label,
  });

  final AutovalidateMode? autovalidateMode;
  final bool enabled;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      builder: (FormFieldState<bool> field) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Checkbox(
                value: field.value,
                onChanged: enabled ? field.didChange : null,
              ),
              Expanded(
                child: Text(label),
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
    );
  }
}
