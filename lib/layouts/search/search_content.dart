import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/search/short_searchProfile.dart';
import 'package:artista/modules/short_inputSearch.dart';
import 'package:flutter/material.dart';

class SearchContent extends StatefulWidget {
  const SearchContent({super.key});

  @override
  State<SearchContent> createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  late String search = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'search':
          search = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: ShortInputSearch(
                text: "Cherchez un artiste",
                variable: 'search',
                searchValue: updateVariable,
              ),
            ),
            if (search != "")
              FutureBuilder(
                future: Api.getData(context, "/searchuser?q=${search}"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data['users'].length,
                        itemBuilder: (context, index) {
                          return ShortSearchProfile(
                            uuid: snapshot.data['users'][index]['uuid'],
                            image: snapshot.data['users'][index]['profile_image'],
                            name: snapshot.data['users'][index]['profile_user'],
                            tag: snapshot.data['users'][index]['pseudo_user'],
                          );
                        },
                      ),
                    );
                  }
                  return LoadContent();
                },
              )
          ],
        ),
      ),
    );
  }
}
