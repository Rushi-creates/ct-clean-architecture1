import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../PROFILE/My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart';
import '../PROFILE/profile_screen.dart';

class SearchProfileListTileWidget extends StatelessWidget {
  final singleObj;
  const SearchProfileListTileWidget({super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
      child: ListTile(
        tileColor: Color.fromARGB(255, 18, 0, 97),
        leading: tile_leading(),
        title: tile_title(),
        subtitle: tile_subtitle(),
        onTap: () async => await fetchListFunc(context, singleObj),
      ),
    );
  }

  tile_leading() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(singleObj.p_uid.toString()),
    );
  }

  tile_title() {
    return Text(
      singleObj.username,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      maxLines: 1,
    );
  }

  tile_subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleObj.bio,
          maxLines: 1,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  fetchListFunc(context, listTileInfo) async {
    //!
    BlocProvider.of<FetchPostsBloc<GMyPosts>>(context)
        .add(List_Refresh_Event<GMyPosts>());
    BlocProvider.of<FetchPostsBloc<GMyPosts>>(context).add(
        List_FetchPosts_Event<GMyPosts>((counter) => MyPostRepo.instance
            .fetchProp(counter, listTileInfo.p_uid.toString())));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      ProfileScreenSingleton.instance.setIsFromProfileScreen(true);
      ProfileScreenSingleton.instance.setProfileObj(singleObj);
      return const ProfileScreen();
    }));
  }
}
