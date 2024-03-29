import 'package:ct_single_post/MODULES/FOLLOWING/followers_screen.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/FOLLOW_BUTTONS/ui/follow_unfollow_button_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_buttons_widgets.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_followers_count_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_image_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_username_and_bio_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:flutter/material.dart';

import '../../../SERIALIZERS/repositories/drf_api/profile_repo.dart';
import '../../FOLLOWING/FollowingScreen.dart';

class ProfileDisplayCardWidget extends StatelessWidget {
  const ProfileDisplayCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          //
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  backgroundCoverImage(context),

                  //@
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 10, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileScreenSingleton.instance.isFromSearchScreen
                            ? const ProfileDummyBackButtonWidget()
                            : Container(),
                        ProfileScreenSingleton.instance.isFromSearchScreen
                            ? Container()
                            : const ProfileSettingButtonWidget()
                      ],
                    ),
                  )
                ],
              ),

              //@
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  //@
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const FollowersScreen();
                                    }));
                                  },
                                  child: ProfileFollowersCountWidget(
                                      count:
                                          '${ProfileSpRepo.instance.getProfile()!.followersCount}',
                                      label: 'Followers'),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const FollowingScreen();
                                    }));
                                  },
                                  child: ProfileFollowersCountWidget(
                                      count:
                                          '${ProfileSpRepo.instance.getProfile()!.followingCount}',
                                      label: 'Following'),
                                )
                                // username_bio(),
                                // editProfile_button(),
                              ]),
                        ),
                      ),
                    ],
                  ),

                  const ProfileImageWidget()
                ],
              )
            ],
          ),

          //
          const ProfileUsernameAndBioWidget(),

          //

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //@
              ProfileScreenSingleton.instance.profileObj ==
                      ProfileSpRepo.instance.getProfile()
                  ? const ProfileEditProfileButtonWidget()

                  //

                  : const FollowUnfollowButtonWidget(),

              //@
              const SizedBox(width: 5),

              //@
              const ProfileFollowingListButton()
            ],
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                               //! background                               */
/* -------------------------------------------------------------------------- */
  backgroundCoverImage(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.black,
          gradient: LinearGradient(colors: [
            Color(0xff2A8CD9),
            Color(0xff96D1FF),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          image: DecorationImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            image: AssetImage('images/profile_cover_bg.png'),
          ),
        ),
      ),
    );
  }
}
