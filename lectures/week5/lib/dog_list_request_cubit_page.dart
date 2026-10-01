import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:lecture_week5/bloc/dog_list_request_cubit.dart';
import 'package:lecture_week5/bloc/dog_list_state.dart';
import 'package:lecture_week5/widgets/dog_list_data_widget.dart';
import 'package:lecture_week5/widgets/empty_dog_list_widget.dart';
import 'package:lecture_week5/widgets/loading_widget.dart';

class const DogListRequestCubitPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RequestLayoutConfigProvider(
      onLoading: (context) => const LoadingWidget(),
      onError: (context, error, retry) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $error'),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: retry, child: const Text('Retry')),
          ],
        ),
      ),
      child: BlocProvider(
        create: (context) => DogListRequestCubit(client: http.Client()),
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: RequestCubitBuilder<List<({String url})>, int>(
              cubit: context.watch<DogListRequestCubit>(),
              onInitial: (context) => EmptyDogListWidget(
                onFetch: () => context.read<DogListRequestCubit>().run(),
              ),
              onErrorCallback: () => context.read<DogListRequestCubit>().run(),
              onSuccess: (context, dogs) => DogListDataWidget(
                dogList: FetchedDogList(dogs: dogs),
                onFetch: () => context.read<DogListRequestCubit>().refresh(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
