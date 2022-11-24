part of 'list_starwar_species_bloc.dart';

abstract class ListStarwarSpeciesEvent extends Equatable {
  const ListStarwarSpeciesEvent();

  @override
  List<Object> get props => [];
}

class FetchStarwarSpecies extends ListStarwarSpeciesEvent {}
