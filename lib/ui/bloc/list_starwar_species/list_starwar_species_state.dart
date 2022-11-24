// ignore_for_file: must_be_immutable

part of 'list_starwar_species_bloc.dart';

abstract class ListStarwarSpeciesState extends Equatable {
  ListStarwarSpeciesState(
      {this.species = const <Species>[], required this.hasReachedMaximum});
  List<Species> species;
  bool hasReachedMaximum;

  @override
  List<Object> get props => [species];
}

class ListStarwarSpeciesInitial extends ListStarwarSpeciesState {
  ListStarwarSpeciesInitial() : super(hasReachedMaximum: false);
}

class ListStarwarSpeciesLoading extends ListStarwarSpeciesState {
  final bool isInitial;

  ListStarwarSpeciesLoading(
    final List<Species> species,
    this.isInitial,
  ) : super(species: species, hasReachedMaximum: false);
}

class ListStarwarSpeciesHasData extends ListStarwarSpeciesState {
  final List<Species>? result;
  final bool hasReachedMaximum;

  ListStarwarSpeciesHasData({
    required this.result,
    required this.hasReachedMaximum,
  }) : super(
          hasReachedMaximum: hasReachedMaximum,
          species: result!,
        );

  @override
  List<Object> get props => [species, hasReachedMaximum];
}

class ListStarwarSpeciesFailed extends ListStarwarSpeciesState {
  final String message;

  ListStarwarSpeciesFailed({required this.message})
      : super(hasReachedMaximum: false);
}
