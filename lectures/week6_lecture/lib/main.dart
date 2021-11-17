import 'package:flutter/material.dart';
import 'package:week6_lecture/dog_facts/dog_facts_page.dart';
import 'package:week6_lecture/domain_search/domain_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          body: ListView(
            children: [
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).push(DogFactsPage.route()),
                child: const Text('Dog facts'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).push(DomainSearchPage.route()),
                child: const Text('Domain search'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
