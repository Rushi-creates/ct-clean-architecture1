import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_post_common_tile.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_posts_chips_row_widget.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import '../fetchPosts_stub/fetchPosts_widget.dart';

class MyPostsWidget extends StatelessWidget {
  final isFromSearchScreen;
  final profileObj;
  const MyPostsWidget({
    super.key,
    required this.isFromSearchScreen,
    required this.profileObj,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

        const MyPostsChipsRowWidget(),

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FetchPosts_widget<GMyPosts>(
            //

            isFromSearchScreen: isFromSearchScreen,

            //

            myFetchPostsFunc: (counter) => MyPostRepo.instance.fetchProp(
              //
              counter,
              //
              isFromSearchScreen
                  ? profileObj.p_uid.toString()
                  : ProfileSpRepo.instance.getProfile()!.p_uid.toString(),
            ),

            //!
            listTile: (singleObj) => MyPostCommonTile(
              //
              wholePostObj: singleObj,

              //
              singleTrendObj: (singleObj.songResults != null)
                  ? singleObj.songResults
                  : (singleObj.movieResults != null)
                      ? singleObj.movieResults
                      : (singleObj.seriesResults != null)
                          ? singleObj.seriesResults
                          : (singleObj.youtubeSingleResult != null)
                              ? singleObj.youtubeSingleResult
                              : '',
            ),
          ),
        ),
      ],
    );
  }
}