import 'package:artista/config/controller.dart';
import 'package:artista/layouts/messages/short_bulleMess.dart';
import 'package:artista/layouts/messages/short_inputMess.dart';
import 'package:artista/layouts/messages/short_userMess.dart';
import 'package:flutter/material.dart';

class MessagesContent extends StatefulWidget {
  const MessagesContent({
    super.key,
    this.data,
  });

  final dynamic data;

  @override
  State<MessagesContent> createState() => _MessagesContentState();
}

class _MessagesContentState extends State<MessagesContent> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);

    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShortUserMess(
            uuid: widget.data['user']['user_id'],
            image: widget.data['user']['image_user'],
            name: widget.data['user']['pseudo'],
            tag: widget.data['user']['identifiant'],
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.data['messages'].length,
              itemBuilder: (context, index) {
                return ShortMessageBubble(
                  text: widget.data['messages'][index]['content'],
                  hours:
                      Controller.getFormattedTime(widget.data['messages'][index]['date']['date']),
                  isSentByMe: widget.data['messages'][index]['isMe'],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInputMess(text: "Envoyer un message..."),
          ),
        ],
      ),
    );
  }
}
