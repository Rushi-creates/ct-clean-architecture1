import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_posts_top_posts_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_posts_widget/my_posts_chips_row_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/FOLLOW_BUTTONS/follow_unfollow_logic/follow_unfollow_bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_custom_collapsed_appbar_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_display_card_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';

import '../../SERIALIZERS/models/follow_account.dart';
import '../../SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart';
import 'My_POSTS/ui/my_posts_widget/my_posts_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
/* -------------------------------------------------------------------------- */
/*                                //! lifecycle                               */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //
    FollowAccount followAccount = FollowAccount(
        my_profile_fk: ProfileSpRepo.instance.getProfile()!.p_uid!,
        other_profile_fk: ProfileScreenSingleton.instance.profileObj.p_uid!);

    //
    BlocProvider.of<FollowUnfollowBloc>(context)
        .add(CheckIfFollowsEvent(followAccount));
  }
/* -------------------------------------------------------------------------- */
/*                                //! structure                               */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // backgroundColor: const Color(0xfff5f7f9),
      body:

//

          RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<FetchPostsBloc<GMyPosts>>(context)
              .add(List_Refresh_Event<GMyPosts>());

          BlocProvider.of<FetchPostsBloc<GMyPosts>>(context).add(
              List_FetchPosts_Event<GMyPosts>((counter) => MyPostRepo.instance
                  .fetchProp(
                      counter,
                      ProfileScreenSingleton.instance.profileObj.p_uid
                          .toString())));
        },

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        child: SliverSnap(
            snap: false,
            collapsedBackgroundColor: Color.fromARGB(255, 245, 245, 245),
            expandedBackgroundColor: Colors.transparent,
            expandedContentHeight: MediaQuery.of(context).size.height * 0.33,

            /* -------------------------------------------------------------------------- */
            /*                                //@ Expnaded                                */
            /* -------------------------------------------------------------------------- */

            expandedContent: const ProfileDisplayCardWidget(),

            /* -------------------------------------------------------------------------- */
            /*                                //@ Collapsed                               */
            /* -------------------------------------------------------------------------- */

            collapsedContent: const ProfileCustomCollapsedAppBarWidget(),

            /* -------------------------------------------------------------------------- */
            /*                                  //@ body                                  */
            /* -------------------------------------------------------------------------- */

            body: const Column(
              children: [
                MyPostsChipsRowWidget(),
                SizedBox(height: 10),
                MyPostsTopPostsWidget(),
                SizedBox(height: 10),
                MyPostsWidget(),
              ],
            )),
      ),
    );
  }
}
