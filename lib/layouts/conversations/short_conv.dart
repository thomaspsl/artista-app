import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShortConv extends StatefulWidget {
  const ShortConv({
    super.key,
    required this.image,
    required this.name,
    required this.text,
    required this.date,
    required this.read,
    required this.uuid,
    required this.uuid_user,
  });

  final String uuid;
  final String uuid_user;
  final String image;
  final String name;
  final String text;
  final String date;
  final bool read;

  @override
  State<ShortConv> createState() => _ShortConvState();
}

class _ShortConvState extends State<ShortConv> {
  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('messages',
                params: {'from': userManager.auth_user['user']['uuid'], 'to': widget.uuid_user}),
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Row(
                children: [
                  ShortPicture(
                    url: widget.image,
                    radius: 12,
                    size: 55,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 12,
                              bottom: 2,
                            ),
                            child: Text(
                              widget.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Text(
                            " - ",
                            style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            widget.date,
                            style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              widget.text,
                              style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    (widget.read == false) ? Icons.markunread : Icons.mark_email_unread,
                    color: (widget.read == false)
                        ? Theme.of(context).indicatorColor
                        : Theme.of(context).primaryColor,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
