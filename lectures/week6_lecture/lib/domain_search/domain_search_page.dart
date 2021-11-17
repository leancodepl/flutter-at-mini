import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week6_lecture/domain_search/domain_search_cubit.dart';

class DomainSearchPage extends StatelessWidget {
  const DomainSearchPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => DomainSearchBloc(),
          child: const DomainSearchPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domain search'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (text) =>
                context.read<DomainSearchBloc>().add(TextChanged(text)),
          ),
          Expanded(
            child: BlocBuilder<DomainSearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchLoaded) {
                  return ListView.builder(
                    itemCount: state.domains.length,
                    itemBuilder: (_, i) => ListTile(
                      title: Text(state.domains[i]),
                    ),
                  );
                } else if (state is SearchEmpty) {
                  return const SizedBox();
                } else {
                  return const Center(
                    child: Text('error'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
