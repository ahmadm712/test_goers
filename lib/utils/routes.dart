import 'package:flutter/material.dart';
import 'package:test_goers_app/data/models/starwars_species_response_model.dart';
import 'package:test_goers_app/ui/pages/detail_species/detail_species_page.dart';
import 'package:test_goers_app/ui/pages/home/home_page.dart';

var mainRoutes = (RouteSettings settings) {
  switch (settings.name) {
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case DetailSpeciesPage.routeName:
      final species = settings.arguments as Species;

      return MaterialPageRoute(
        builder: (context) => DetailSpeciesPage(
          species: species,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page Not Found :('),
          ),
        ),
      );
  }
};
