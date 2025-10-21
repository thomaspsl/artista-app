import 'package:artista/config/artista.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/home/short_post.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  HomeContent({super.key, required this.data});

  final dynamic data;

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  ScrollController _scrollController = ScrollController();
  int loadedPosts = 10;
  int addedPosts = 10;

  void _loadMorePosts() {
    if (loadedPosts >= widget.data['posts'].length) return;
    setState(() {
      if (loadedPosts + addedPosts < widget.data['posts'].length) {
        loadedPosts += addedPosts;
      } else {
        loadedPosts = widget.data['posts'].length;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMorePosts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RefreshIndicator(
        color: AppColors.orangeJuice,
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1), () {
            setState(() {
              loadedPosts = addedPosts;
            });
          });
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: loadedPosts + 1,
          itemBuilder: (context, index) {
            if (loadedPosts + 1 != index + 1)
              return ShortPost(
                uuidUser: widget.data['posts'][index]['id_user'],
                uuidPost: widget.data['posts'][index]['uuid'],
                url: widget.data['posts'][index]['profile_image'],
                name: widget.data['posts'][index]['profile_user'],
                address: widget.data['posts'][index]['location'],
                urlPicture: widget.data['posts'][index]['images'][0],
                namePicture: widget.data['posts'][index]['title_post'],
              );
            else if (loadedPosts != widget.data['posts'].length)
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: LoadContent(),
              );
            else
              return Container();
          },
        ),
      ),
    );
  }
}
