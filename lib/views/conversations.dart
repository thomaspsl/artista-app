import 'package:artista/layouts/conversations/conversations_content.dart';
import 'package:flutter/material.dart';

class Conversations extends StatefulWidget {
  const Conversations({super.key});

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  @override
  Widget build(BuildContext context) {
    return ConversationsContent();
    // return Container(
    //   color: Theme.of(context).backgroundColor,
    //   child: Center(
    //     child: Text(
    //       'Travaux en cours',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         color: Theme.of(context).primaryColor,
    //         fontSize: 15,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    // );
  }
}
