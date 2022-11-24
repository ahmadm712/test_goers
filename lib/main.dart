import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_goers_app/services/api_services.dart';
import 'package:test_goers_app/shared/styles.dart';
import 'package:test_goers_app/ui/bloc/list_starwar_species/list_starwar_species_bloc.dart';
import 'package:test_goers_app/ui/pages/splash/splash_page.dart';
import 'package:test_goers_app/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ApiServices apiServices = ApiServices();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ListStarwarSpeciesBloc(apiServices),
        )
      ],
      child: MaterialApp(
        title: 'Starwar Goers Test App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: kPrimaryColor,
          ),
        ),
        home: const SplashScreenPage(),
        onGenerateRoute: mainRoutes,
      ),
    );
  }
}
