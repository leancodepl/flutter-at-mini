import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:week6/bloc/dog_list_request_cubit.dart';
import 'package:week6/bloc/dog_list_state.dart';
import 'package:week6/widgets/dog_list_data_widget.dart';
import 'package:week6/widgets/empty_dog_list_widget.dart';
import 'package:week6/widgets/loading_widget.dart';

class DogListRequestCubitPage extends StatelessWidget {
  const DogListRequestCubitPage({super.key});

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
        create: (_) => DogListRequestCubit(client: http.Client()),
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: RequestCubitBuilder<List<({String url})>, int>(
              cubit: context.read<DogListRequestCubit>(),
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
