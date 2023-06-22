import 'package:ct_single_post/MODULES/COMMON/Crud_stub/fetch_stub/fetch_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/follow_account_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CONSTANTS/generic_classes.dart';
import '../COMMON/Crud_stub/fetch_stub/fetch_bloc.dart';
// import '../../SERIALIZERS/repositories/drf_api/my_post_repo.dart';
// import '../PROFILE/My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart'
//     as fetchGMyPosts;
// import '../PROFILE/profile_screen.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  @override
  void initState() {
    super.initState();
    // if (widget.isAnotherProfile) {
    BlocProvider.of<FetchBloc<GFollowing>>(context)
        .add(List_Refresh_Event<GFollowing>());

    BlocProvider.of<FetchBloc<GFollowing>>(context).add(
        List_Fetch_Event<GFollowing>((counter) => FollowAccountRepo.instance
            .fetchProp_myFollowing(
                counter, ProfileScreenSingleton.instance.profileObj.p_uid)));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(
        child: Container(
      child: Fetch_widget<GFollowing>(
        fetchAutomatically:
            ProfileScreenSingleton.instance.isFromSearchScreen ? false : true,
        myFetchFunc: (counter) => FollowAccountRepo.instance
            .fetchProp_myFollowing(
                counter, ProfileScreenSingleton.instance.profileObj.p_uid),
        listTile: (singleObj) => myListTile(singleObj),
      ),
      // child: Zoo_Fetch_Screen(
      //     // fetchEvent: Zoo_Fetch_onInit_Event(),
      //     ),
    ));
  }

  myListTile(singleObj) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 245, 245, 245),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              singleObj.imageUrl == 'empty'
                  ? 'https://i.pravatar.cc/400'
                  : singleObj.imageUrl,
            ),
          ),
          title: Text(
            singleObj.username,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black.withOpacity(0.6),
            size: 18,
          ),
          onTap: () {
            // do something when the list tile is tapped
          },
        ),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: const Text(
        'My following', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      // actions: [

      //   //  Padding(
      //   //    padding: const EdgeInsets.all(8.0),
      //   //   child: IconButton(
      //   //       onPressed: null,
      //   //       icon: Icon(
      //   //         Icons.search,
      //   //         color: Colors.black,
      //   //       )), )
      // ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ functionlities                             */
/* -------------------------------------------------------------------------- */

  // fetchListFunc(context, listTileInfo) async {
  //   //!
  //   BlocProvider.of<fetchGMyPosts.FetchPostsBloc<GMyPosts>>(context)
  //       .add(fetchGMyPosts.List_Refresh_Event<GMyPosts>());
  //   BlocProvider.of<fetchGMyPosts.FetchPostsBloc<GMyPosts>>(context).add(
  //       fetchGMyPosts.List_FetchPosts_Event<GMyPosts>((counter) => MyPostRepo
  //           .instance
  //           .fetchProp(counter, listTileInfo.other_profile_fk.toString())));

  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     ProfileScreenSingleton.instance.setIsFromProfileScreen(true);
  //     // here we need to pass visited profile obj, but we dont have it since, we only have /following/ data in here
  //     ProfileScreenSingleton.instance.setProfileObj(singleObj);
  //     return const ProfileScreen();
  //   }));
  // }
}
