import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_goers_app/data/models/starwars_species_response_model.dart';
import 'package:test_goers_app/services/api_services.dart';
import 'package:test_goers_app/utils/failure.dart';

part 'list_starwar_species_event.dart';
part 'list_starwar_species_state.dart';

class ListStarwarSpeciesBloc
    extends Bloc<ListStarwarSpeciesEvent, ListStarwarSpeciesState> {
  ApiServices apiServices;
  ListStarwarSpeciesBloc(this.apiServices)
      : super(ListStarwarSpeciesInitial()) {
    int page = 1;
    on<ListStarwarSpeciesEvent>((event, emit) {});

    on<FetchStarwarSpecies>((event, emit) async {
      try {
        if (state.hasReachedMaximum) {
          return;
        }
        emit(ListStarwarSpeciesLoading(
            state.species, state is ListStarwarSpeciesInitial));

        await apiServices
            .getStarwarSpecies(page: page.toString())
            .then((value) {
          page++;
          final species = [...state.species, ...value.species!];
          final hasReachedMaximum =
              value.next == null || value.species!.isEmpty;
          return emit(ListStarwarSpeciesHasData(
              result: species, hasReachedMaximum: hasReachedMaximum));
        });
      } on ServerFailure catch (e) {
        emit(ListStarwarSpeciesFailed(message: e.message));
      } catch (e) {
        emit(ListStarwarSpeciesFailed(message: e.toString()));
      }
    });
  }
}
