import 'package:artista/config/api.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/conversations/short_conv.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_inputSearch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConversationsContent extends StatefulWidget {
  const ConversationsContent({super.key});

  @override
  State<ConversationsContent> createState() => _ConversationsContentState();
}

class _ConversationsContentState extends State<ConversationsContent> {
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
    var userManager = Provider.of<UserManager>(context, listen: true);

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
                text: "Cherchez une conversation",
                variable: 'search',
                searchValue: updateVariable,
              ),
            ),
            FutureBuilder(
              future:
                  Api.getData(context, "/conversations/${userManager.auth_user['user']['uuid']}"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data['conversations'].length,
                      itemBuilder: (context, index) {
                        return ShortConv(
                          uuid: snapshot.data['conversations'][index]['uuid'],
                          uuid_user: snapshot.data['conversations'][index]['to']['uuid'],
                          image: snapshot.data['conversations'][index]['to']['avatar'],
                          name: snapshot.data['conversations'][index]['to']['username'],
                          text: snapshot.data['conversations'][index]['lastMsg']['content'],
                          date: Controller.getFormattedCurrentTime(
                              snapshot.data['conversations'][index]['lastMsg']['date']['date']),
                          read: true,
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
