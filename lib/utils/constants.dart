import 'package:flutter/material.dart';

const String imageAssets = 'assets/images/';
const String baseUrl = 'https://swapi.dev/api/';

scaffoldMessage(
    {required BuildContext context,
    required String message,
    required Color color}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      duration: const Duration(milliseconds: 1500),
      content: Text(
        message,
      ),
    ),
  );
}
