import 'package:ct_single_post/MODULES/COMMON/Crud_stub/fetch_stub/fetch_widget.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/follow_account_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CONSTANTS/generic_classes.dart';
import '../COMMON/Crud_stub/fetch_stub/fetch_bloc.dart';

//to change class name = right click on className> Rename symbol
class FollowingScreen extends StatefulWidget {
  final profileId;
  final isAnotherProfile;
  const FollowingScreen(
      {required this.profileId, required this.isAnotherProfile});

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
            .fetchProp_myFollowing(counter, widget.profileId)));
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
        fetchAutomatically: widget.isAnotherProfile ? false : true,
        myFetchFunc: (counter) => FollowAccountRepo.instance
            .fetchProp_myFollowing(counter, widget.profileId),
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
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
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
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
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
            style: TextStyle(
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

  // myListTile(singleObj) {
  //   return ListTile(
  //     leading: Image.network(
  //       singleObj.imageUrl == 'empty'
  //           ? 'https://i.pravatar.cc/400'
  //           : singleObj.imageUrl,
  //       width: 40,
  //       height: 40,
  //     ),
  //     title: Text(singleObj.username),
  //     trailing: Icon(Icons.arrow_forward),
  //     onTap: () {
  //       // do something when the list tile is tapped
  //     },
  //     contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       side: BorderSide(
  //         color: Colors.grey.shade300,
  //         width: 1,
  //       ),
  //     ),
  //     tileColor: Colors.white,
  //     selectedTileColor: Colors.grey.shade200,
  //     selected: true,
  //   );
  // }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
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
}
