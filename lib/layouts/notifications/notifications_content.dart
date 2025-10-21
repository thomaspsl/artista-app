import 'package:artista/config/controller.dart';
import 'package:artista/layouts/notifications/short_notif.dart';
import 'package:flutter/material.dart';

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({super.key, this.data});

  final dynamic data;

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "Nouvelles notifications",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: widget.data['notifications'].length,
              itemBuilder: (context, index) {
                return ShortNotif(
                  image: widget.data['notifications'][index]['user']['profile_image'],
                  name: widget.data['notifications'][index]['user']['profile_user'],
                  text: widget.data['notifications'][index]['content'],
                  date: Controller.getFormattedCurrentTime(
                      widget.data['notifications'][index]['date']['date']),
                  view: widget.data['notifications'][index]['views'],
                  uuid: (widget.data['notifications'][index]['views'] == 'post')
                      ? widget.data['notifications'][index]['post']['uuid']
                      : widget.data['notifications'][index]['user']['uuid'],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
