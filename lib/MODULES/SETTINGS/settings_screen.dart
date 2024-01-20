import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/snackbar_widget.dart';
import 'package:ct_single_post/MODULES/SETTINGS/settings_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../SERIALIZERS/repositories/drf_api/user_repo.dart';
import '../SPLASH/splash__screen.dart';
import 'UserLod_logic/user_lod_bloc.dart';

//to change class name = right click on className> Rename symbol
class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10),
            aboutProfilCard(),
            cautionZone(),
          ],
        ),
      ),
    );
  }

  aboutProfilCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: sp_userAccObj_BlocProvider_STATES(),
        ),
      ),
    );
  }

  cautionZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              caution_tile_logout(),
              const Divider(),
              caution_tile_DeleteAccount(),
            ],
          ),
        ),
      ),
    );
  }

//   seeYouSoonCard() {
//     var dimVar = MediaQuery.of(context).size;

// //height : dimVar.height*0.5    //to access height
// //width : dimVar.width*0.5       //acces width
//     return FittedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Card(
//           elevation: 3,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Text(
//                   'New features \ncomming soon :)',
//                   // maxLines: 2,
//                   // overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.end,
//                   style: TextStyle(
//                     color: Colors.pink,
//                     // decoration: TextDecoration.none,
//                     fontStyle: FontStyle.italic,
//                     // fontFamily: "FontNameHere" ,
//                     fontWeight: FontWeight.bold,
//                     // fontWeight: FontWeight.w300,
//                     fontSize: 17.0,
//                   ),
//                 ),
//               ),
//               Image.asset("images/waiting.jpg",
//                   height: 200, width: dimVar.width * 0.5)
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  caution_Text() {
    return const Text(
      "CAUTION ZONE !",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
        fontSize: 25.0,
      ),
    );
  }

  caution_tile_logout() {
    return BlocConsumer<UserLodBloc, UserLodState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is UserLogout_Success_State) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SplashScreen();
          }));
          SnackBarWidget(context, "Signed out of app successfully",
              bgColor: Colors.green);
        } else if (state is UserLogout_Failure_State) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Couldn't Sign out of app, try again later"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is UserLogout_Loading_State) {
          return const Center(child: CircularProgressIndicator());
        }
        return SettingsTileWidget(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () {
            BlocProvider.of<UserLodBloc>(context)
                .add(UserLogoutButtonPressedEvent());
          },
        );
      },
    );
  }

  caution_tile_DeleteAccount() {
    return BlocConsumer<UserLodBloc, UserLodState>(
      listener: (context, state) {
        if (state is UserDeleteUserAccount_Success_State) {
          Navigator.pop(context);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const SplashScreen();
          }));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              content: Text("Account deleted permanantly"),
            ),
          );
        } else if (state is UserDeleteUserAccount_Failure_State) {
          Navigator.pop(context);
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                  "Couldn't delete account right now, please try again later"),
            ),
          );
        } else if (state is UserDeleteUserAccount_Loading_State) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is UserDeleteUserAccount_Loading_State) {
          return const Center(child: CircularProgressIndicator());
        }
        return SettingsTileWidget(
          icon: Icons.account_circle_outlined,
          label: 'Delete your account',
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: const EdgeInsets.all(14.0),
                    content: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Warning!",
                            style: TextStyle(
                              color: Color.fromARGB(255, 13, 0, 88),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Are you sure you want to delete your account? This can't be undone, once deleted."),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          "Delete permanently",
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          BlocProvider.of<UserLodBloc>(context)
                              .add(UserDeleteUserAccount_ButtonPressedEvent());
                        },
                      )
                    ],
                  );
                });
          },
        );
      },
    );
  }

  AppBar myHeader() {
    return AppBar(
      elevation: 0.5,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: const Text(
        'Settings', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ STATES                                 */
/* -------------------------------------------------------------------------- */

  sp_userAccObj_BlocProvider_STATES() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.11,
                backgroundColor: Colors.blue[200],
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.1,
                  backgroundColor: Colors.grey,
                  // backgroundImage:
                  //     UserSpRepo.instance.getUser()?.photoUrl == "empty"
                  //         ? NetworkImage(noPfp)
                  //         : NetworkImage(UserSpRepo.instance.getUser()!.photoUrl!),
                  child: ClipOval(
                    child: CachedNetworkImage(
                        imageUrl: UserSpRepo.instance.getUser()!.photoUrl!),
                  ),
                  // radius: 35.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('Your Google signIn Id : ${User_sp_repo.get_user()!.gauth_id}'),
                Text(
                  '${UserSpRepo.instance.getUser()!.name}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  UserSpRepo.instance.getUser()!.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                // Text('Your photoUrl : ${User_sp_repo.get_user()!.photoUrl}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
