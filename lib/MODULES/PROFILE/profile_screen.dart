import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_posts_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/FOLLOW_BUTTONS/follow_unfollow_logic/follow_unfollow_bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_custom_collapsed_appbar_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_display_card_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';

import '../../SERIALIZERS/models/follow_account.dart';

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
    FollowAccount followAccount = FollowAccount(
        my_profile_fk: ProfileSpRepo.instance.getProfile()!.p_uid!,
        other_profile_fk: ProfileScreenSingleton.instance.profileObj.p_uid!);
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
      body: SliverSnap(
        collapsedBackgroundColor: Colors.white,
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

        body: const MyPostsWidget(),
      ),
    );
  }
}
