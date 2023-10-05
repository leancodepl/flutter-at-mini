import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/match_details/match_details_page.dart';
import 'package:testing/matches/matches_cubit.dart';
import 'package:testing/ui/match_item.dart';

class MatchesPage extends StatelessWidget {
  const MatchesPage({super.key}) : super();

  static const listKey = ValueKey('MatchesList');

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MatchesCubit>(
      create: (context) => MatchesCubit(context.read())..fetch(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Matches'),
        ),
        body: Container(
          color: const Color(0xffe0E0E0),
          child: BlocBuilder<MatchesCubit, MatchesState>(
            builder: (context, state) {
              if (state is MatchesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MatchesError) {
                return const Center(
                  child: Text('Error'),
                );
              } else if (state is MatchesLoaded) {
                return RefreshIndicator(
                  onRefresh: () => context.read<MatchesCubit>().fetch(),
                  child: ListView.separated(
                    key: listKey,
                    padding: const EdgeInsets.all(16),
                    itemCount: state.matches.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) => MatchItem(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => MatchDetailsPage(
                            match: state.matches[index],
                          ),
                        ),
                      ),
                      match: state.matches[index],
                    ),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
