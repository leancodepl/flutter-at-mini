// import 'package:flutter/material.dart';

// class FormStep1Route extends MaterialPageRoute {
//   /* ... */
// }

// class FormStep1Data {}

// class FormStep2Route extends MaterialPageRoute {
//   FormStep2Route({required FormStep1Data step1Data})
//       : super(
//           builder: (context) => Step2(step1Data: step1Data),
//         );
// }

// class FormStep2Data {}

// class FormStep3Route extends MaterialPageRoute {
//   FormStep3Route({
//     required FormStep1Data step1Data,
//     required FormStep2Data step2Data,
//   }) : super(
//           builder: (context) => Step3(
//             step1Data: step1Data,
//             step2Data: step2Data,
//           ),
//         );
// }

// @immutable
// class MyFormBundle {
//   const MyFormBundle({
//     required this.text,
//     required this.checkbox,
//     required this.slider,
//   });

//   final String text;
//   final bool checkbox;
//   final double slider;
// }

// class _MyFormBundleBuilder {
//   String? text;
//   bool? checkbox;
//   double? slider;

//   MyFormBundle build() {
//     final text = this.text;
//     final checkbox = this.checkbox;
//     final slider = this.slider;

//     if (text == null || checkbox == null || slider == null) {
//       throw StateError('Some values are missing');
//     }

//     return MyFormBundle(
//       text: text,
//       checkbox: checkbox,
//       slider: slider,
//     );
//   }
// }

// class _BasicFormBundle extends StatefulWidget {
//   const _BasicFormBundle();

//   @override
//   State<_BasicFormBundle> createState() => _BasicFormBundleState();
// }

// class _BasicFormBundleState extends State<_BasicFormBundle> {
//   late final GlobalKey<FormState> _formKey;
//   late final _MyFormBundleBuilder _bundleBuilder;

//   MyFormBundle get _bundle => _bundleBuilder.build();

//   @override
//   void initState() {
//     super.initState();

//     _formKey = GlobalKey();
//     _bundleBuilder = _MyFormBundleBuilder();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Basic form with bundle'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//                 label: Text('Text field'),
//               ),
//               onSaved: (value) => _bundleBuilder..text = value,
//             ),
//             const SizedBox(height: 16),
//             FormField<bool>(
//               initialValue: false,
//               onSaved: (value) => _bundleBuilder..checkbox = value,
//               builder: (field) => Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: field.value,
//                         onChanged: field.didChange,
//                       ),
//                       const Expanded(
//                         child: Text('Checkbox field'),
//                       ),
//                     ],
//                   ),
//                   if (field.hasError)
//                     Text(
//                       field.errorText ?? '',
//                       style: const TextStyle(color: Colors.red),
//                     ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             FormField<double>(
//               initialValue: 0.5,
//               onSaved: (value) => _bundleBuilder..slider = value,
//               builder: (field) => Slider(
//                 value: field.value ?? 0,
//                 onChanged: field.didChange,
//                 min: 0,
//                 max: 1,
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 final bundle = _bundle;

//                 print(
//                   'Form values: '
//                   'text: ${bundle.text}, '
//                   'checkbox: ${bundle.checkbox}, '
//                   'slider: ${bundle.slider}',
//                 );
//               },
//               child: const Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// class Step1Data {}

// class Step2Data {}

// class Step3Data {}

// class MyFormData extends ChangeNotifier {
//   Step1Data? _step1Data;
//   Step1Data? get step1Data => _step1Data;
//   set step1Data(Step1Data? value) {
//     if (value != _step1Data) {
//       _step1Data = value;
//       notifyListeners();
//     }
//   }

//   Step2Data? _step2Data;
//   Step2Data? get step2Data => _step2Data;
//   set step2Data(Step2Data? value) {
//     if (value != _step2Data) {
//       _step2Data = value;
//       notifyListeners();
//     }
//   }

//   Step3Data? _step3Data;
//   Step3Data? get step3Data => _step3Data;
//   set step3Data(Step3Data? value) {
//     if (value != _step3Data) {
//       _step3Data = value;
//       notifyListeners();
//     }
//   }
// }

// void main(List<String> args) {
//   return ChangeNotifierProvider<MyFormData>(
//     create: (context) => MyFormData(),
//   );

//   final formData = context.watch<MyFormData>();
// }
