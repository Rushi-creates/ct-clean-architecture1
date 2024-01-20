// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/profile_followers_count_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:flutter/material.dart';
import '../../../SERIALIZERS/repositories/drf_api/profile_repo.dart';
import '../../../SERIALIZERS/repositories/drf_api/user_repo.dart';
import '../../SETTINGS/Settings_screen.dart';

class ProfileCustomCollapsedAppBarWidget extends StatelessWidget {
  const ProfileCustomCollapsedAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                              //@ declarations                              */
/* -------------------------------------------------------------------------- */

    String noPfp =
        'https://icon-library.com/images/no-image-icon/no-image-icon-25.jpg';

/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        ProfileScreenSingleton.instance.isFromSearchScreen
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromARGB(255, 231, 231, 231),
                ))
            : Container(),

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
        Row(
          children: [
            const SizedBox(width: 8),
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.04,
              backgroundColor: Colors.grey,
              backgroundImage:
                  UserSpRepo.instance.getUser()?.photoUrl == "empty"
                      ? NetworkImage(noPfp)
                      : NetworkImage(UserSpRepo.instance.getUser()!.photoUrl!),
              // radius: 35.0,
            ),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                '${ProfileSpRepo.instance.getProfile()!.username}',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 71, 71, 71),
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  // fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        const Spacer(),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

        const Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: ProfileFollowersCountWidget(
            count: '783',
            label: 'Followers',
            fontSize: 10,
            fontColor: Colors.grey,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: ProfileFollowersCountWidget(
            count: '90',
            label: 'Following',
            fontSize: 10,
            fontColor: Colors.grey,
          ),
        ),

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
        // followButtonUi(context)
        ProfileScreenSingleton.instance.isFromSearchScreen
            ? Container()
            : IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingScreen();
                  }));
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Color.fromARGB(255, 107, 107, 107),
                ))
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ button                                 */
/* -------------------------------------------------------------------------- */

  buttonContainer(context, Widget child) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.15,
          height: MediaQuery.of(context).size.height * 0.036,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 178, 120, 255),
                Color.fromARGB(255, 112, 45, 255),
              ],
              // colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: child,
        ));
  }

  followButtonUi(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.15,
        height: MediaQuery.of(context).size.height * 0.036,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 178, 120, 255),
              Color.fromARGB(255, 112, 45, 255),
            ],
            // colors: [Colors.purple, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: TextButton(
          onPressed: () {
            print('Button pressed');
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          child: const FittedBox(
            child: Text(
              'Follow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
