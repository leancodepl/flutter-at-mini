import 'package:flutter/material.dart';
import 'package:forms_lecture/examples/async_validation/async_validation.dart';
import 'package:forms_lecture/examples/basic_form.dart';
import 'package:forms_lecture/examples/basic_form_bundle.dart';
import 'package:forms_lecture/examples/conditional_rendering.dart';
import 'package:forms_lecture/examples/conditional_rendering_alt.dart';
import 'package:forms_lecture/examples/dependent_field.dart';
import 'package:forms_lecture/examples/text_input_actions.dart';
import 'package:forms_lecture/examples/text_input_types.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forms'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Basic'),
            onTap: () => Navigator.of(context).push(BasicFormRoute()),
          ),
          ListTile(
            title: const Text('Basic with bundle'),
            onTap: () => Navigator.of(context).push(BasicBundleFormRoute()),
          ),
          ListTile(
            title: const Text('Conditional rendering'),
            onTap: () => Navigator.of(context).push(
              ConditionalRenderingRoute(),
            ),
          ),
          ListTile(
            title: const Text('Conditional rendering alternative'),
            onTap: () => Navigator.of(context).push(
              ConditionalRenderingAltRoute(),
            ),
          ),
          ListTile(
            title: const Text('Dependent field'),
            onTap: () => Navigator.of(context).push(
              DependentFieldRoute(),
            ),
          ),
          ListTile(
            title: const Text('Async validation'),
            onTap: () => Navigator.of(context).push(
              AsyncValidationRoute(),
            ),
          ),
          ListTile(
            title: const Text('Text input types'),
            onTap: () => Navigator.of(context).push(
              TextInputTypesRoute(),
            ),
          ),
          ListTile(
            title: const Text('Text input actions'),
            onTap: () => Navigator.of(context).push(
              TextInputActionsRoute(),
            ),
          ),
        ],
      ),
    );
  }
}
