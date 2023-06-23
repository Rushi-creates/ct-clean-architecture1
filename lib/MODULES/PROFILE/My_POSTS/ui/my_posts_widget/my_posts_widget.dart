import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import '../../fetchPosts_stub/fetchPosts_widget.dart';
import 'my_post_common_tile.dart';

class MyPostsWidget extends StatelessWidget {
  const MyPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

        // const MyPostsChipsRowWidget(),

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FetchPosts_widget<GMyPosts>(
            //

            isFromSearchScreen:
                ProfileScreenSingleton.instance.isFromSearchScreen,

            //

            myFetchPostsFunc: (counter) => MyPostRepo.instance.fetchProp(
              //
              counter,
              //
              ProfileScreenSingleton.instance.isFromSearchScreen
                  ? ProfileScreenSingleton.instance.profileObj.p_uid.toString()
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
