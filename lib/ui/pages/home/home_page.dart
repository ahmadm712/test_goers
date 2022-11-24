import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_goers_app/shared/styles.dart';
import 'package:test_goers_app/ui/bloc/list_starwar_species/list_starwar_species_bloc.dart';
import 'package:test_goers_app/ui/widgets/species_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ListStarwarSpeciesBloc>().add(FetchStarwarSpecies());
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Future.microtask(() =>
          context.read<ListStarwarSpeciesBloc>().add(FetchStarwarSpecies()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<ListStarwarSpeciesBloc, ListStarwarSpeciesState>(
        builder: (context, state) {
          if (state is ListStarwarSpeciesHasData ||
              state is ListStarwarSpeciesLoading && !state.isInitial) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index >= state.species.length) {
                  return state.hasReachedMaximum
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Has Reach Max',
                              style: blackTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: semiBold,
                                color: Colors.white,
                              )),
                        ))
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                } else {
                  final species = state.species[index];
                  return SpeciesCard(
                    species: species,
                  );
                }
              },
              itemCount: state.species.length + 1,
            );
          } else if (state is ListStarwarSpeciesFailed) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is ListStarwarSpeciesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
