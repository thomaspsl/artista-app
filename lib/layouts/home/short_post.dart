import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_artwork.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class ShortPost extends StatefulWidget {
  const ShortPost({
    super.key,
    required this.uuidUser,
    required this.uuidPost,
    required this.url,
    required this.name,
    required this.address,
    required this.urlPicture,
    required this.namePicture,
  });

  final String uuidUser;
  final String uuidPost;
  final String url;
  final String name;
  final String address;
  final String urlPicture;
  final String namePicture;

  @override
  State<ShortPost> createState() => _ShortPostState();
}

class _ShortPostState extends State<ShortPost> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    GlobalKey buttonPost = GlobalKey();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => (widget.uuidUser != userManager.auth_user['user']['uuid'])
                    ? GoRouter.of(context).pushNamed('profile', params: {'uuid': widget.uuidUser})
                    : GoRouter.of(context).pushNamed('me'),
                child: ShortPicture(
                  url: widget.url,
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
                        onTap: () => (widget.uuidUser != userManager.auth_user['user']['uuid'])
                            ? GoRouter.of(context)
                                .pushNamed('profile', params: {'uuid': widget.uuidUser})
                            : GoRouter.of(context).pushNamed('me'),
                        child: Container(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 4,
                        ),
                        child: Text(
                          "a partagé",
                          style: TextStyle(
                            color: Theme.of(context).cardColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 2,
                          left: 10,
                        ),
                        child: Text(
                          widget.address,
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
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Row(
            children: [
              GestureDetector(
                onDoubleTap: () async => Controller.clickFavorite(context, buttonPost),
                onTap: () =>
                    GoRouter.of(context).pushNamed('post', params: {'uuid': widget.uuidPost}),
                child: ShortArtwork(
                  url: widget.urlPicture,
                  radius: 12,
                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8, right: 6),
                    alignment: Alignment.bottomLeft,
                    height: 27,
                    color: Colors.black.withAlpha(125),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.namePicture,
                          style: const TextStyle(
                            color: AppColors.greyLight,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        LikeButton(
                          key: buttonPost,
                          size: 18,
                          isLiked: isLiked,
                          likeBuilder: (isLiked) {
                            return Icon(
                              Icons.bookmark,
                              color: isLiked ? AppColors.yellowSun : AppColors.greyLight,
                              size: 18,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
