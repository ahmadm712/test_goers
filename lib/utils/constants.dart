import 'package:flutter/material.dart';

const String assets = 'assets/';
const String baseUrl = 'https://swapi.dev/api/';
const String urlPlaceholder =
    'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg';

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
