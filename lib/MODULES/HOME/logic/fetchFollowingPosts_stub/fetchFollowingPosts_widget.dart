import 'package:ct_single_post/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:ct_single_post/MODULES/SEARCH_PROFILE/search_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../SERIALIZERS/repositories/drf_api/profile_repo.dart';
import '../../../../SERIALIZERS/repositories/drf_api/user_repo.dart';
import 'fetchFollowingPosts_bloc.dart';

class FetchFollowingPosts_widget<T> extends StatefulWidget {
  final Function(dynamic, dynamic) listTile;
  final Future<dynamic> Function(int counter) myFetchFollowingPostsFunc;

  const FetchFollowingPosts_widget({
    Key? key,
    required this.listTile,
    required this.myFetchFollowingPostsFunc,
  }) : super(key: key);

  @override
  _FetchFollowingPosts_widgetState<T> createState() =>
      _FetchFollowingPosts_widgetState<T>();
}

class _FetchFollowingPosts_widgetState<T>
    extends State<FetchFollowingPosts_widget<T>> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    // widget.isFromSearchScreen ? onRefreshFunc() : null;
    print('common fetchFollowingPosts init called');
    // BlocProvider.of<FetchFollowingPostsBloc<T>>(context).add(
    //     List_FetchFollowingPosts_Event<T>(widget.myFetchFollowingPostsFunc));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      Future.delayed(const Duration(milliseconds: 100), () {
        BlocProvider.of<FetchFollowingPostsBloc<T>>(context).add(
            List_FetchFollowingPosts_Event<T>(
                widget.myFetchFollowingPostsFunc));
      });
    }
  }

/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return myBody();
    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: myHeader(),
    //   body: myBody(),
    // );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  // myBody_STATES() {
  //   return BlocConsumer<JooCudBloc, JooCudState>(
  //     listener: (context, state) {
  //       if (state is Joo_create_Loaded_State ||
  //           state is Joo_update_Loaded_State ||
  //           state is Joo_Delete_Loaded_state) {
  //         onRefreshFunc();
  //       }
  //     },
  //     builder: (context, state) {
  //       return myBody();
  //     },
  //   );
  // }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              myAppBar(context),
              const SizedBox(height: 30),
              // bodyTitle(),
              // SizedBox(height: 15),
              fetchFollowingPostsListStates(),
              belowLastTile_STATES(),
              const SizedBox(height: 60)
            ],
          )),
    );
  }

  bodyTitle() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Text(
          'Check up with what your friends \nwatched recently :',
          textAlign: TextAlign.left,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            color: Colors.grey[500],
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  myAppBar(context) {
    return Container(
      decoration: const BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Current Trends',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Spacer(),
                searchProfileIcon(context)
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Welcome back!\n${ProfileSpRepo.instance.getProfile()!.username!.toUpperCase()}, explore the feed.',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                // SizedBox(width: 20,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(UserSpRepo.instance
                                  .getUser()!
                                  .photoUrl ==
                              'empty'
                          ? 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg'
                          : UserSpRepo.instance.getUser()!.photoUrl!),
                    ),
                  ),
                ),
              ],
            ),
            bodyTitle()
          ],
        ),
      ),
    );
  }

  searchProfileIcon(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SearchProfileScreen();
            }));
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          )),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //@ fetchFollowingPosts list states                            */
/* -------------------------------------------------------------------------- */

  fetchFollowingPostsListStates() {
    return BlocBuilder<FetchFollowingPostsBloc<T>, FetchFollowingPostsState<T>>(
        builder: (context, state) {
      // print(state);
      return
          // (state.fetchFollowingPostsList.first is YoutubeModel)
          //     ? buildFetchFollowingPostsList_ForYT(state.fetchFollowingPostsList)
          //     :
          buildFetchFollowingPostsList_ForYT(state.fetchFollowingPostsList);
    });
  }

  buildFetchFollowingPostsList_ForYT(List listArg) {
    return listArg.isEmpty
        ? const Text('empty')
        : ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              return widget.listTile(listArg[i], (i % 4 == 0 ? true : false));
            },
          );
  }

  // buildFetchFollowingPostsList(List listArg) {
  //   return listArg.isEmpty
  //       ? Text('empty')
  //       : MasonryGridView.count(
  //           padding: EdgeInsets.zero,
  //           physics: NeverScrollableScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           shrinkWrap: true,
  //           crossAxisCount: 2,
  //           mainAxisSpacing: 4,
  //           crossAxisSpacing: 4,
  //           itemCount: listArg.length,
  //           itemBuilder: (context, i) {
  //             return Column(
  //               children: [
  //                 i == 1 ? SizedBox(height: 50) : SizedBox(height: 0),
  //                 widget.listTile(listArg[i]),
  //               ],
  //             );
  //           },
  //         );
  // }

/* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTile_STATES() {
    return BlocBuilder<FetchFollowingPostsBloc<T>, FetchFollowingPostsState<T>>(
      builder: (context, state) {
        if (state is FetchFollowingPostsList_Loading_State<T>) {
          return customLoadingWidget();
        } else if (state is FetchFollowingPostsList_Error_State<T>) {
          // scrollController.addListener(scrollListener);  // this is imp
          // MyComponents.errorSnackBar(context, 'Some Network error');
          return connectionErrorText(context, state.error);
        } else if (state is FetchFollowingPostsList_LoadedEmpty_State<T>) {
          scrollController.removeListener(scrollListener);
          return nothingMoreToLoad();
        }
        return const Text('');

        // loadMoreButton(context); //to use button instead of scroll controller
      },
    );
  }

  nothingMoreToLoad() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 150,
            color: Colors.grey[50],
          ),
          Text(
            'Nothing to load',
            style: TextStyle(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }

  connectionErrorText(context, error) {
    return Center(
      child: Row(
        children: [
          Text(
            'Connection error or \n Error: $error',
            style: const TextStyle(color: Colors.red),
          ),
          tryAgainButton(context)
        ],
      ),
    );
  }

  tryAgainButton(context) {
    return TextButton(
      child: const Text(
        "Try again",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<FetchFollowingPostsBloc<T>>(context).add(
            List_FetchFollowingPosts_Event<T>(
                widget.myFetchFollowingPostsFunc));
      },
    );
  }

  customLoadingWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          LoaderWidget(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  loadMoreButton(context) {
    return TextButton(
      child: const Text(
        "Load more ",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<FetchFollowingPostsBloc<T>>(context).add(
            List_FetchFollowingPosts_Event<T>(
                widget.myFetchFollowingPostsFunc));
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<FetchFollowingPostsBloc<T>>(context)
        .add(List_Refresh_Event<T>());
    BlocProvider.of<FetchFollowingPostsBloc<T>>(context).add(
        List_FetchFollowingPosts_Event<T>(widget.myFetchFollowingPostsFunc));
    scrollController.addListener(scrollListener);
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */
// you can call fetchFollowingPostsWidget, anywhere you want
  //     //# call fetchFollowingPostsWidget anywhere,
  //     //# and pass func ( to fetchFollowingPosts which api list)
  //     //# and listTile widget ( to display props)

  // sampleWidget() {
  //   return Container(

  //     child: FetchFollowingPosts_widget<Post>(
  //       myFetchFollowingPostsFunc: (myCounter) => post_api_repo.fetchFollowingPostsPosts_byProp_pUid(
  //           myCounter,
  //           '1'), // pass actual filterProp here ( p_uid, user_fk, etc)
  //       listTile: (singleObj) => Text(singleObj.toString),
  //     ),
      

    // child: FetchFollowingPosts_widget<UserAcc>(
      //   myFetchFollowingPostsFunc: (myCounter) => user_api_repo.fetchFollowingPostsAll(
      //     myCounter,
      //   ),
      //   listTile: (singleObj) => MyListTile(singleObj: singleObj),
      // ),

  //   );
  // }

/* -------------------------------------------------------------------------- */
/*                   //? in main.dart - multip BlocProvider                   */
/* -------------------------------------------------------------------------- */
//  MultiBlocProvider(
//       providers: [

//         BlocProvider<FetchFollowingPostsBloc<UserAcc>>(create: (context) => FetchFollowingPostsBloc<UserAcc>()),
//         BlocProvider<FetchFollowingPostsBloc<Post>>(create: (context) => FetchFollowingPostsBloc<Post>()),

//       ])