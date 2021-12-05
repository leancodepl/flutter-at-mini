import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 9',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSample(),
    );
  }
}

class LoginSample extends StatefulWidget {
  LoginSample({Key? key}) : super(key: key);

  @override
  State<LoginSample> createState() => _LoginSampleState();
}

class _LoginSampleState extends State<LoginSample> {
  final loginTextController = TextEditingController();

  @override
  void initState() {
    loginTextController.addListener(() {
      print("Controller ${loginTextController.text}");
    });

    super.initState();
  }

  @override
  void dispose() {
    loginTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Login"),
              controller: loginTextController,
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (text) {
                print("On Changed $text");
              },
              onSubmitted: (text) {
                print("On Submitted $text");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginSample2 extends StatefulWidget {
  LoginSample2({Key? key}) : super(key: key);

  @override
  State<LoginSample2> createState() => _LoginSample2State();
}

class _LoginSample2State extends State<LoginSample2> {
  final loginTextController = TextEditingController();
  final verificationCodeFocusNode = FocusNode();

  @override
  void initState() {
    loginTextController.addListener(() {
      print("Controller ${loginTextController.text}");
    });

    super.initState();
  }

  @override
  void dispose() {
    loginTextController.dispose();
    verificationCodeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Login"),
              controller: loginTextController,
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (text) {
                print("On Changed $text");
              },
              onSubmitted: (text) {
                verificationCodeFocusNode.requestFocus();
                print("On Submitted $text");
              },
            ),
            Row(
              children: [
                const Text("Optional value"),
                const SizedBox(width: 8),
                Checkbox(value: false, onChanged: (value) {}),
              ],
            ),
            TextField(
              focusNode: verificationCodeFocusNode,
              decoration: const InputDecoration(hintText: "Verification Code"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginSample3 extends StatefulWidget {
  LoginSample3({Key? key}) : super(key: key);

  @override
  State<LoginSample3> createState() => _LoginSample3State();
}

class _LoginSample3State extends State<LoginSample3> {
  final loginTextController = TextEditingController();

  bool isWrongPassword = false;

  @override
  void initState() {
    loginTextController.addListener(() {
      print("Controller ${loginTextController.text}");
    });

    super.initState();
  }

  @override
  void dispose() {
    loginTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Login"),
              controller: loginTextController,
            ),
            const SizedBox(height: 8),
            TextField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                  RegExp(r'\s'),
                  replacementString: "space",
                ),
              ],
              decoration: InputDecoration(
                hintText: "Password",
                errorText: isWrongPassword ? "Wrong Password" : null,
              ),
              onChanged: (text) {
                print("On Changed $text");
              },
              onSubmitted: (text) {
                print("On Submitted $text");
                setState(() {
                  isWrongPassword = text.length < 4;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginSample4 extends StatefulWidget {
  LoginSample4({Key? key}) : super(key: key);

  @override
  State<LoginSample4> createState() => _LoginSample4State();
}

class _LoginSample4State extends State<LoginSample4> {
  final loginTextController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    loginTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Email"),
                controller: loginTextController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  final regex = RegExp(r'\w+@\w+\.\w+');
                  if (email!.isEmpty) {
                    return 'We need an email address';
                  } else if (!regex.hasMatch(email)) {
                    return "That doesn't look like an email address";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(hintText: "Password"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (text) {
                  print("On Saved $text");
                },
                validator: (password) {
                  if (password!.length < 4) {
                    return "Password is too short";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 8),
              MaterialButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    // Using Text Controller
                    print('Text Controller ${loginTextController.text}');

                    // Using on saved
                    _key.currentState!.save();
                  }
                },
                child: const Text("Sign In"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleHookSample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(counter.value.toString()),
            const SizedBox(height: 8),
            MaterialButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}

class HookSample extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final loginTextController = useTextEditingController();
    print(loginTextController.hashCode);

    // Memoized sample
    // final user = User();
    // print("User ${user.hashCode}");

    // Effect sample
    // Stream stream = Stream.value(counter.value);
    // useEffect(() {
    //   print("New stream");
    //   final subscription = stream.listen(print);
    //   // This will cancel the subscription when the widget is disposed
    //   // or if the callback is called again.
    //   return subscription.cancel;
    // },
    //   // when the stream change, useEffect will call the callback again.
    //   [stream],
    // );

    // One effect
    // useEffect(() {
    //   print("Effect");
    // }, []);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: "Login"),
              controller: loginTextController,
            ),
            const SizedBox(height: 8),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Password"),
              onChanged: (text) {
                print("On Changed $text");
              },
              onSubmitted: (text) {
                print("On Submitted $text");
              },
            ),
            const SizedBox(width: 8),
            MaterialButton(
              onPressed: () {
                counter.value++;
              },
              child: const Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
}
