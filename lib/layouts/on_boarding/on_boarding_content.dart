import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/modules/short_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingContent extends StatefulWidget {
  OnBoardingContent({super.key});

  final CarouselController carouselController = CarouselController();

  final featuredImages = [
    [
      'lib/assets/pictures/phone_light_home.png',
      'lib/assets/pictures/phone_dark_home.png',
      '🚀 Partager & Explorer 🤩'
    ],
    [
      'lib/assets/pictures/phone_light_friend.png',
      'lib/assets/pictures/phone_dark_friend.png',
      '✨ Retrouver vos Amis ✨'
    ],
    [
      'lib/assets/pictures/phone_light_collections.png',
      'lib/assets/pictures/phone_dark_collections.png',
      '🎨 Créer vos Collections 🖌️'
    ]
  ];

  @override
  State<OnBoardingContent> createState() => _OnBoardingContentState();
}

class _OnBoardingContentState extends State<OnBoardingContent> {
  @override
  Widget build(BuildContext context) {
    Controller.autoLogin(context);

    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(top: 52.5, bottom: 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            alignment: AlignmentDirectional.center,
            children: [
              CarouselSlider(
                carouselController: widget.carouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.65,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 8),
                ),
                items: widget.featuredImages.map((featuredImage) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(360),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(360)),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).primaryColor.withOpacity(0.45),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 12.5),
                          child: Image.asset(
                            Theme.of(context).brightness == Brightness.light
                                ? featuredImage[0]
                                : featuredImage[1],
                            height: 390.0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            featuredImage[2],
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => widget.carouselController.previousPage(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        shape: BoxShape.circle,
                      ),
                      height: 55,
                      width: 50,
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 30,
                        color: AppColors.whiteTitanium,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => widget.carouselController.nextPage(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        shape: BoxShape.circle,
                      ),
                      height: 55,
                      width: 50,
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 30,
                        color: AppColors.whiteTitanium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShortButton(
                color: AppColors.orangeJuice,
                name: "Se connecter",
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                onTap: () => GoRouter.of(context).goNamed('login'),
              ),
              ShortButton(
                color: Theme.of(context).indicatorColor,
                name: "S'inscrire",
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                onTap: () => GoRouter.of(context).goNamed('register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
