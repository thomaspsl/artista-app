import 'package:artista/modules/short_picture.dart';
import 'package:artista/modules/short_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortCollection extends StatefulWidget {
  const ShortCollection({
    super.key,
    required this.image1_url,
    required this.image2_url,
    required this.image3_url,
    required this.image4_url,
    required this.collection_name,
    required this.uuid,
  });

  final String uuid;
  final String image1_url;
  final String image2_url;
  final String image3_url;
  final String image4_url;
  final String collection_name;

  @override
  State<ShortCollection> createState() => _ShortCollection();
}

class _ShortCollection extends State<ShortCollection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pushNamed('collection', params: {'uuid': widget.uuid}),
        child: Stack(
          children: [
            ShortCard(
              size: 100,
              color: Theme.of(context).indicatorColor,
              radius: 17,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (widget.image1_url != "")
                          ? ShortPicture(
                              url: widget.image1_url,
                              radius: 8,
                              size: 33,
                            )
                          : SizedBox.fromSize(
                              size: Size.square(33),
                              child: Container(),
                            ),
                      (widget.image2_url != "")
                          ? ShortPicture(
                              url: widget.image2_url,
                              radius: 8,
                              size: 33,
                            )
                          : SizedBox.fromSize(
                              size: Size.square(33),
                              child: Container(),
                            ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      (widget.image3_url != "")
                          ? ShortPicture(
                              url: widget.image3_url,
                              radius: 8,
                              size: 33,
                            )
                          : SizedBox.fromSize(
                              size: Size.square(33),
                              child: Container(),
                            ),
                      (widget.image4_url != "")
                          ? ShortPicture(
                              url: widget.image4_url,
                              radius: 8,
                              size: 33,
                            )
                          : SizedBox.fromSize(
                              size: Size.square(33),
                              child: Container(),
                            ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                alignment: Alignment.bottomCenter,
                child: Text(
                  widget.collection_name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
