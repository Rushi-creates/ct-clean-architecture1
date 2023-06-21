import 'package:ct_single_post/MODULES/SEARCH_PROFILE/search_profile_list_tile_widget.dart';
import 'package:ct_single_post/MODULES/SEARCH_PROFILE/search_profile_searchbar_widget.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CONSTANTS/generic_classes.dart';
import '../../SERIALIZERS/repositories/drf_api/profile_repo.dart';
import '../COMMON/Crud_stub/fetch_stub/fetch_widget.dart';
import '../PROFILE/My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart';

class SearchProfileScreen extends StatefulWidget {
  const SearchProfileScreen({super.key});

  @override
  State<SearchProfileScreen> createState() => _SearchProfileScreenState();
}

class _SearchProfileScreenState extends State<SearchProfileScreen> {
  TextEditingController profileNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: myHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchProfileSearchBarWidget(
                  searchProfileController: profileNameController),

              //@

              Fetch_widget<GSearchUsers>(
                fetchAutomatically: false,
                myFetchFunc: (counter) =>
                    ProfileRepo.instance.filterFetchByUsername(
                  counter,
                  profileNameController.text,
                ),
                // (profileNameController.text.isNotEmpty)
                //     ? ProfileRepo.instance.filterFetchByUsername(
                //         counter,
                //         profileNameController.text,
                //       )
                //     : null,
                listTile: (singleObj) => SearchProfileListTileWidget(
                  singleObj: singleObj,
                ),
              ),
            ],
          ),
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Search users',
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            //!
            BlocProvider.of<FetchPostsBloc<GMyPosts>>(context)
                .add(List_Refresh_Event<GMyPosts>());
            BlocProvider.of<FetchPostsBloc<GMyPosts>>(context).add(
                List_FetchPosts_Event<GMyPosts>((counter) => MyPostRepo.instance
                    .fetchProp(
                        counter,
                        ProfileSpRepo.instance
                            .getProfile()!
                            .p_uid!
                            .toString())));

            Navigator.pop(context);
          }),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: () {
      //           // Navigator.pushNamed(context, '/Home');
      //         },
      //         icon: Icon(
      //           Icons.settings,
      //           color: Colors.black,
      //         )),
      //   )
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: () {
      //         onRefreshFunc()
      //       },
      //       icon: Icon(
      //         Icons.refresh,
      //         color: Colors.black,
      //       )),
      // )
      // ],
    );
  }
}
