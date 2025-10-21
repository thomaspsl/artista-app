import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortSearchProfile extends StatefulWidget {
  const ShortSearchProfile({
    super.key,
    required this.image,
    required this.name,
    required this.tag,
    required this.uuid,
  });

  final String uuid;
  final String image;
  final String name;
  final String tag;

  @override
  State<ShortSearchProfile> createState() => _ShortSearchProfileState();
}

class _ShortSearchProfileState extends State<ShortSearchProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('profile', params: {
              'uuid': widget.uuid,
            }),
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
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              widget.tag,
                              style: TextStyle(
                                color: Theme.of(context).cardColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).indicatorColor,
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
