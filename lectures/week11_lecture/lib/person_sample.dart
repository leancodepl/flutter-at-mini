import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week11_lecture/code_generation/freezed/person.dart';
import 'package:week11_lecture/code_generation/freezed/person_state.dart';
import 'package:week11_lecture/code_generation/sample_person.dart';

void main() {
  final samplePerson = SamplePerson(name: "Rafal", age: 18);
  final newSamplePerson = SamplePerson(name: "Geralt", age: samplePerson.age);
  final nextSamplePerson =
      SamplePerson(name: "Rafal", age: newSamplePerson.age);

  final person = Person(name: "Rafal", age: 18);
  final newPerson = person.copyWith(name: "Geralt");
  final nextPerson = newPerson.copyWith(name: "Rafal");

  print("Without Freezed: ${samplePerson == nextSamplePerson}");
  print("Freezed: ${person == nextPerson}");

  print("Without Freezed: ${samplePerson.toString()}");
  print("Freezed: ${person.toString()}");

  final personState = PersonState.success(nextPerson);

  personState.when(success: (person) {
    print(person);
  }, error: (error) {
    print(error);
  }, loading: () {
    print("Loading");
  });

  personState.maybeWhen(orElse: () {});

  personState.maybeMap(orElse: () {});
}

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(const PersonState.loading());

  void setPerson(Person person) {
    emit(PersonState.success(person));
  }

  void setError(String error) {
    emit(PersonState.error(error));
  }
}

class PersonWidget extends StatefulWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  State<PersonWidget> createState() => _PersonWidgetState();
}

class _PersonWidgetState extends State<PersonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonCubit, PersonState>(builder: (context, state) {
      return state.maybeWhen(
        loading: () {
          return const CircularProgressIndicator();
        },
        success: (person) {
          return Text(person.name);
        },
        orElse: () {
          return Container();
        },
      );
    });
  }
}
