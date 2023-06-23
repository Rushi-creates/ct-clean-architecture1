import 'package:ct_single_post/MODULES/HOME/ui/home_post_tile_widget.dart';
import 'package:ct_single_post/MODULES/message_screen.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/following_posts_repo.dart';
import 'package:flutter/material.dart';

import '../../../CONSTANTS/generic_classes.dart';
import '../logic/fetchFollowingPosts_stub/fetchFollowingPosts_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        // backgroundColor: Color(0xFFF1F1F1),
        // backgroundColor: Color(0xFFF5F5F5),
        // backgroundColor: Color(0xffE9E9E9),
        // resizeToAvoidBottomInset: false,
        body: PageView(
          children: [fetchPosts(), const MessageScreen()],
        ));
  }

  fetchPosts() {
    return FetchFollowingPosts_widget<GFollowingPosts>(
        listTile: (myObj, isEven) => HomePostTileWidget(
              isEven: isEven,
              myObj: myObj,
              singleObj: (myObj.songResults != null)
                  ? myObj.songResults
                  : (myObj.movieResults != null)
                      ? myObj.movieResults
                      : (myObj.seriesResults != null)
                          ? myObj.seriesResults
                          : (myObj.youtubeSingleResult != null)
                              ? myObj.youtubeSingleResult
                              : '',
            ),
        myFetchFollowingPostsFunc: (counter) =>
            FollowingPostsRepo.instance.fetchHomePosts(counter));
  }
}
