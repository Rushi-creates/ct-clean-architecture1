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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GestureDetector(
        onTap: () => fetchListFunc(context, singleObj),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 56, 165, 255),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(25),
          child: Row(
            children: [
              const Icon(Icons.person, color: Colors.white),
              const SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tile_title(),
                  tile_subtitle(),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
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
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          style: const TextStyle(color: Colors.white),
        ),
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
