import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/ui/my_posts_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_custom_collapsed_appbar_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_display_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliver_snap/widgets/sliver_snap.dart';

import '../../SERIALIZERS/models/Profile.dart';

class ProfileScreen extends StatefulWidget {
  final Profile profileObj;
  final bool isFromSearchScreen;
  const ProfileScreen({
    super.key,
    required this.profileObj,
    required this.isFromSearchScreen,
  });

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

        expandedContent: ProfileDisplayCardWidget(
          isFromSearchScreen: widget.isFromSearchScreen,
          profileObj: widget.profileObj,
        ),

/* -------------------------------------------------------------------------- */
/*                                //@ Collapsed                               */
/* -------------------------------------------------------------------------- */

        collapsedContent: ProfileCustomCollapsedAppBarWidget(
          isFromSearchScreen: widget.isFromSearchScreen,
          profileObj: widget.profileObj,
        ),

/* -------------------------------------------------------------------------- */
/*                                  //@ body                                  */
/* -------------------------------------------------------------------------- */

        body: MyPostsWidget(
          isFromSearchScreen: widget.isFromSearchScreen,
          profileObj: widget.profileObj,
        ),
      ),
    );
  }
}
