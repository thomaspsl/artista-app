// import 'package:artista/config/api.dart';
// import 'package:artista/layouts/app/error_content.dart';
// import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/search/search_content.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SearchContent();
  }
}
