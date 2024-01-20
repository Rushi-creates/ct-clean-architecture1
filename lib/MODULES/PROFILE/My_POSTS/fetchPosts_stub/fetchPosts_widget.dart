import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/my_posts_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../SERIALIZERS/models/my_post.dart';
import '../../../COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'fetchPosts_bloc.dart';

class FetchPosts_widget<T> extends StatefulWidget {
  final Function(dynamic) listTile;
  final Future<dynamic> Function(int counter) myFetchPostsFunc;
  final bool fetchAutomatically;
  final isFromSearchScreen;

  const FetchPosts_widget({
    Key? key,
    required this.listTile,
    required this.myFetchPostsFunc,
    required this.isFromSearchScreen,
    this.fetchAutomatically = true,
  }) : super(key: key);

  @override
  _FetchPosts_widgetState<T> createState() => _FetchPosts_widgetState<T>();
}

class _FetchPosts_widgetState<T> extends State<FetchPosts_widget<T>> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);

    // widget.isFromSearchScreen ? onRefreshFunc() : null;
    // print('common fetchPosts init called');
    // BlocProvider.of<FetchPostsBloc<T>>(context)
    //     .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
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
        BlocProvider.of<FetchPostsBloc<T>>(context)
            .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
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
              fetchPostsListStates(),
              belowLastTile_STATES(),
              const SizedBox(height: 60)
            ],
          )),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) {
      //         return FetchPostsScreen<Post>();
      //       }));
      //     }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: const Text(
        'Home', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                BlocProvider.of<FetchPostsBloc<T>>(context)
                    .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: () {
                BlocProvider.of<FetchPostsBloc<T>>(context)
                    .add(List_Refresh_Event<T>());
                BlocProvider.of<FetchPostsBloc<T>>(context)
                    .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
              )),
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //@ fetchPosts list states                            */
/* -------------------------------------------------------------------------- */

  fetchPostsListStates() {
    return BlocBuilder<FetchPostsBloc<T>, FetchPostsState<T>>(
        builder: (context, state) {
      print(state);
      return
          // (state.fetchPostsList.first is YoutubeModel)
          //     ? buildFetchPostsList_ForYT(state.fetchPostsList)
          //     :
          // chipsState(state.fetchPostsList);
          chipsState();
    });
  }

  // buildFetchPostsList_ForYT(List listArg) {
  //   return listArg.isEmpty
  //       ? Text('empty')
  //       : ListView.builder(
  //           padding: EdgeInsets.zero,
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           scrollDirection: Axis.vertical,
  //           itemCount: listArg.length,
  //           itemBuilder: (context, i) {
  //             return widget.listTile(listArg[i]);
  //           },
  //         );
  // }

  chipsState() {
    return BlocBuilder<ChipsCubit<GMyPostsChips>, int?>(
        builder: (context, state) {
      if (state == 0) {
        return buildFetchPostsList(MyPostSingleton.instance.myPostsList, 'All');
      } else if (state == 1) {
        return buildFetchPostsList(
            MyPostSingleton.instance.myPostsSongsList, 'Songs');
      } else if (state == 2) {
        return buildFetchPostsList(
            MyPostSingleton.instance.myPostsMoviesList, 'Movies');
      } else if (state == 3) {
        return buildFetchPostsList(
            MyPostSingleton.instance.myPostsYoutubeList, 'Youtube');
      } else if (state == 4) {
        return buildFetchPostsList(
            MyPostSingleton.instance.myPostsSeriesList, 'Series');
      }
      return buildFetchPostsList(MyPostSingleton.instance.myPostsList, 'All');
    });
  }

  buildFetchPostsList(List listArg, String sorting) {
    print(listArg.toString());

    return listArg.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Click on + icon to add first post',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : MasonryGridView.count(
            // padding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              //    var indexState =
              //     BlocProvider.of<ChipsCubit<GMyPostsChips>>(context).state;
              // print('8888888888888888 = $indexState');

              // String sorting = indexState == 0
              //     ? 'All'
              //     : indexState == 1
              //         ? 'Songs'
              //         : indexState == 2
              //             ? 'Movies'
              //             : indexState == 3
              //                 ? 'Youtube'
              //                 : indexState == 4
              //                     ? 'Series'
              //                     : '';
              MyPost sortedObj;

              if (listArg[i].trendType == sorting) {
                sortedObj = listArg[i];

                return Column(
                  children: [
                    widget.listTile(sortedObj),
                    i == 1
                        ? const SizedBox(height: 0)
                        : const SizedBox(height: 0),
                  ],
                );
              } else if (sorting == 'All') {
                return Column(
                  children: [
                    widget.listTile(listArg[i]),
                    i == 1
                        ? const SizedBox(height: 0)
                        : const SizedBox(height: 0),
                  ],
                );
              }

              return Container();
            },
          );
  }

/* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTile_STATES() {
    return BlocBuilder<FetchPostsBloc<T>, FetchPostsState<T>>(
      builder: (context, state) {
        if (state is FetchPostsList_Loading_State<T>) {
          return customLoadingWidget();
        } else if (state is FetchPostsList_Error_State<T>) {
          // scrollController.addListener(scrollListener);  // this is imp
          // MyComponents.errorSnackBar(context, 'Some Network error');
          return connectionErrorText(context, state.error);
        } else if (state is FetchPostsList_LoadedEmpty_State<T>) {
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
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<FetchPostsBloc<T>>(context)
            .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
      },
      child: const Text(
        "Try again",
        style: TextStyle(color: Colors.white),
      ),
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
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        BlocProvider.of<FetchPostsBloc<T>>(context)
            .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
      },
      child: const Text(
        "Load more ",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<FetchPostsBloc<T>>(context).add(List_Refresh_Event<T>());
    BlocProvider.of<FetchPostsBloc<T>>(context)
        .add(List_FetchPosts_Event<T>(widget.myFetchPostsFunc));
    scrollController.addListener(scrollListener);
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */
// you can call fetchPostsWidget, anywhere you want
  //     //# call fetchPostsWidget anywhere,
  //     //# and pass func ( to fetchPosts which api list)
  //     //# and listTile widget ( to display props)

  // sampleWidget() {
  //   return Container(

  //     child: FetchPosts_widget<Post>(
  //       myFetchPostsFunc: (myCounter) => post_api_repo.fetchPostsPosts_byProp_pUid(
  //           myCounter,
  //           '1'), // pass actual filterProp here ( p_uid, user_fk, etc)
  //       listTile: (singleObj) => Text(singleObj.toString),
  //     ),
      

    // child: FetchPosts_widget<UserAcc>(
      //   myFetchPostsFunc: (myCounter) => user_api_repo.fetchPostsAll(
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

//         BlocProvider<FetchPostsBloc<UserAcc>>(create: (context) => FetchPostsBloc<UserAcc>()),
//         BlocProvider<FetchPostsBloc<Post>>(create: (context) => FetchPostsBloc<Post>()),

//       ])