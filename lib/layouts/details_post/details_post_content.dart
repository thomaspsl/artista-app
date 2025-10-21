import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:artista/modules/short_slidingUp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class DetailsPostContent extends StatefulWidget {
  const DetailsPostContent({super.key, required this.data});

  final dynamic data;

  @override
  State<DetailsPostContent> createState() => _DetailsPostContentState();
}

class _DetailsPostContentState extends State<DetailsPostContent> {
  bool isLiked = false;
  GlobalKey myButtonDetails = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return ShortSlidingUp(
      body: GestureDetector(
        onDoubleTap: () async => Controller.clickFavorite(context, myButtonDetails),
        child: Image.network(
          widget.data['post']['images'][0],
          fit: BoxFit.cover,
        ),
      ),
      panel: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greyLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.data['post']['title_post'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    LikeButton(
                      key: myButtonDetails,
                      size: 25,
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.bookmark,
                          color: isLiked ? AppColors.yellowSun : AppColors.greyLight,
                          size: 25,
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    widget.data['post']['caption_post'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.data['post']['hastags'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => (widget.data['post']['id_user'] !=
                                userManager.auth_user['user']['uuid'])
                            ? GoRouter.of(context).pushNamed('profile', params: {
                                'uuid': widget.data['post']['id_user'],
                              })
                            : GoRouter.of(context).pushNamed('me'),
                        child: ShortPicture(
                          url: widget.data['post']['profile_image'],
                          radius: 12,
                          size: 35,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => GoRouter.of(context).pushNamed('profile',
                                    params: {'uuid': widget.data['post']['id_user']}),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.data['post']['profile_user'],
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 2, left: 10),
                                child: Text(
                                  widget.data['post']['location'],
                                  style: TextStyle(
                                    color: Theme.of(context).cardColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    widget.data['post']['presentation'],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
