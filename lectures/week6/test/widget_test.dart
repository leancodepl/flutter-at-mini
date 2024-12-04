import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:week6/bloc/dog_list_cubit.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/dog_list_cubit_page.dart';
import 'package:week6/widgets/empty_dog_list_widget.dart';

class MockDogListCubit extends Mock implements DogListCubit {}

void main() {
  testWidgets('DogListCubitPage shows EmptyDogList on empty cubit state',
      (tester) async {
    // ASSIGN

    final DogListCubit cubit = MockDogListCubit();
    when(() => cubit.state).thenReturn(const EmptyDogList());
    when(() => cubit.stream)
        .thenAnswer((_) => Stream.fromIterable([const EmptyDogList()]));

    // ACT
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const DogListCubitPage(),
        ),
      ),
    );

    // ASSERT
    expect(
      find.byType(EmptyDogListWidget),
      findsOneWidget,
    );
  });

  testWidgets('DogListCubitPage calls cubit.fetchDogs on button tap',
      (tester) async {
    // ASSIGN
    final DogListCubit cubit = MockDogListCubit();
    when(() => cubit.state).thenReturn(const EmptyDogList());
    when(() => cubit.stream)
        .thenAnswer((_) => Stream.fromIterable([const EmptyDogList()]));
    when(cubit.fetchDogs).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: const DogListCubitPage(),
        ),
      ),
    );

    // ACT
    await tester.tap(find.byKey(const Key('moreDogsButton')));

    // ASSERT
    verify(cubit.fetchDogs).called(1);
  });
}
