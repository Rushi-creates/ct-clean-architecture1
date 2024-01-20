import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../CREATE_PROFILE/cubit/create_profile_cubit.dart';
// import '../../CREATE_PROFILE/ui/create_profile_screen.dart';
import '../../CREATE_PROFILE/create_profile_singleton.dart';
import '../../CREATE_PROFILE/ui/create_profile_screen.dart';
import '../../FOLLOWING/FollowingScreen.dart';
import '../../SETTINGS/Settings_screen.dart';

class ProfileEditProfileButtonWidget extends StatelessWidget {
  const ProfileEditProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            CreateProfileSingleton.instance.setIsFromProfileScreen(true);
            return const CreateProfileScreen();
          }));
        },
        child: Container(
          decoration: const BoxDecoration(
              // color: Color(0xFF6DBDFF),
              gradient: LinearGradient(
                colors: [Color(0xFF6DBDFF), Color(0xFF4B9BFF)],
                // colors: [Color(0xFF6DBDFF), Color(0xFFA0E6FF)],
                // colors: [Color(0xFF6DBDFF), Color(0xFF1756FF)],
                // colors: [Color(0xFF6DBDFF), Color(0xFF2D95FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    '  Edit Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            //! Dummy back button                           */
/* -------------------------------------------------------------------------- */

class ProfileDummyBackButtonWidget extends StatelessWidget {
  const ProfileDummyBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: SafeArea(
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromARGB(54, 255, 255, 255),
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             //! Setting button                             */
/* -------------------------------------------------------------------------- */

class ProfileSettingButtonWidget extends StatelessWidget {
  const ProfileSettingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color.fromARGB(17, 255, 255, 255),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SettingScreen();
            }));
          },
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         //! Following list Button()                        */
/* -------------------------------------------------------------------------- */
class ProfileFollowingListButton extends StatelessWidget {
  const ProfileFollowingListButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const FollowingScreen();
          }));
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
              color: Colors.white,
              // color: Color(0xFF6DBDFF),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                    size: 14,
                    color: Colors.blue,

                    // color: Color(0xff56A8E9),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
