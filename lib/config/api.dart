import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class Api extends StatelessWidget {
  // Global api url for the application
  static String apiUrl = "https://artista.thomaspsl.fr";

  // Global function to reach data
  static Future getData(BuildContext context, String url) async {
    final response = await http.get(Uri.parse(Api.apiUrl + url));

    // print(response.body);
    // print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      default:
        return throw Exception('Failed to get');
    }
  }

  // Global function to push data
  static Future postData(BuildContext context, String url) async {
    final response = await http.post(Uri.parse(Api.apiUrl + url));

    // print(response.body);
    // print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 401:
        Controller.toast(json.decode(response.body)['message'], AppColors.redLava);
        return throw Exception('Failed to push');
      default:
        return throw Exception('Failed to push');
    }
  }

  // Global function to modify data
  static Future putData(BuildContext context, String url) async {
    final response = await http.put(Uri.parse(Api.apiUrl + url));

    print(response.body);
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        Controller.toast(json.decode(response.body)['message'], Theme.of(context).indicatorColor);
        return json.decode(response.body);
      case 401:
        Controller.toast(json.decode(response.body)['message'], AppColors.redLava);
        return throw Exception('Failed to put');
      default:
        return throw Exception('Failed to put');
    }
  }
}
