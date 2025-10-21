import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class ShortMessageBubble extends StatelessWidget {
  final String text;
  final String hours;
  final bool isSentByMe;

  const ShortMessageBubble({
    Key? key,
    required this.text,
    required this.hours,
    required this.isSentByMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isSentByMe ? Theme.of(context).indicatorColor : AppColors.orangeJuice;
    final alignment =
        isSentByMe ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart;

    return Column(
      children: [
        Align(
          alignment: alignment,
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: isSentByMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))
                  : BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 2, bottom: 7),
          child: Align(
            alignment: alignment,
            child: Text(
              hours,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
