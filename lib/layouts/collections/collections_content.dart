import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_collection.dart';
import 'package:artista/layouts/collections/short_favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionsContent extends StatefulWidget {
  const CollectionsContent({super.key});

  @override
  State<CollectionsContent> createState() => _CollectionsContentState();
}

class _CollectionsContentState extends State<CollectionsContent> {
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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Text(
                  "Vos collections",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 253,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: userManager.auth_user['user']['collections'].length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding: EdgeInsets.only(right: 3, top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Card(
                            elevation: 0,
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).indicatorColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 50,
                                color: Theme.of(context).backgroundColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  int length =
                      userManager.auth_user['user']['collections'][index - 1]['posts'].length;
                  return ShortCollection(
                    uuid: userManager.auth_user['user']['collections'][index - 1]['uuid'],
                    image1_url: (length - 1 >= 0)
                        ? userManager.auth_user['user']['collections'][index - 1]['posts'][0]
                            ['image']
                        : "",
                    image2_url: (length - 1 >= 1)
                        ? userManager.auth_user['user']['collections'][index - 1]['posts'][1]
                            ['image']
                        : "",
                    image3_url: (length - 1 >= 2)
                        ? userManager.auth_user['user']['collections'][index - 1]['posts'][2]
                            ['image']
                        : "",
                    image4_url: (length - 1 >= 3)
                        ? userManager.auth_user['user']['collections'][index - 1]['posts'][3]
                            ['image']
                        : "",
                    collection_name: userManager.auth_user['user']['collections'][index - 1]
                        ['name'],
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Divider(
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "Coups de coeur",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: userManager.auth_user['user']['coupdecoeur'].length,
              itemBuilder: (context, index) {
                return ShortFavorite(
                  uuid: userManager.auth_user['user']['coupdecoeur'][index]['uuid'],
                  image_url: userManager.auth_user['user']['coupdecoeur'][index]['url'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
