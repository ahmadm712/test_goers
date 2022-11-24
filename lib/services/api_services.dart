import 'package:test_goers_app/data/models/starwars_species_response_model.dart';
import 'package:test_goers_app/utils/constants.dart';
import 'package:test_goers_app/utils/failure.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<StarwarsSpeciesResponseModel> getStarwarSpecies(
      {String page = '1'}) async {
    try {
      final response = await http.get(
        Uri.parse(
          "${baseUrl}species?page=$page",
        ),
      );

      if (response.statusCode == 200) {
        return starwarsSpeciesResponseModelFromJson(response.body);
      } else {
        throw ServerFailure(response.body);
      }
    } on ServerFailure catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
