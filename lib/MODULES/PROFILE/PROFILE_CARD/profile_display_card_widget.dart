import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_buttons_widgets.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_followers_count_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_image_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_username_and_bio_widget.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:flutter/material.dart';

import '../../../SERIALIZERS/models/Profile.dart';
import 'FOLLOW_UNFOLLOW_BUTTONS/ui/Follow_widget.dart';
import 'FOLLOW_UNFOLLOW_BUTTONS/ui/Unfollow_widget.dart';

class ProfileDisplayCardWidget extends StatelessWidget {
  final Profile profileObj;
  final bool isFromSearchScreen;
  const ProfileDisplayCardWidget({
    super.key,
    required this.profileObj,
    required this.isFromSearchScreen,
  });

  @override
  Widget build(BuildContext context) {
    Profile myProfile = ProfileSpRepo.instance.getProfile()!;

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
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isFromSearchScreen
                            ? const ProfileDummyBackButtonWidget()
                            : Container(),
                        isFromSearchScreen
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
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ProfileFollowersCountWidget(
                                    count: '867', label: 'Followers'),
                                ProfileFollowersCountWidget(
                                    count: '249', label: 'Following')
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
          ProfileUsernameAndBioWidget(profileObj: profileObj),

          //

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //@
              profileObj == myProfile
                  ? const ProfileEditProfileButtonWidget()

                  //
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Follow_widget(
                            my_profileId: myProfile.p_uid,
                            otherProfileId: profileObj.p_uid),
                        Unfollow_widget(
                            my_profileId: myProfile.p_uid,
                            otherProfileId: profileObj.p_uid),
                      ],
                    ),

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
