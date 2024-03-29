import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../WIDGETS/loader_widget.dart';
import 'fetch_bloc.dart';

class Fetch_widget<T> extends StatefulWidget {
  final Function(dynamic)? listTile;
  final Function(dynamic)? customBuilder;
  final Future<dynamic> Function(int counter) myFetchFunc;
  final bool fetchAutomatically;
  final bool scrollVertical;

  const Fetch_widget(
      {Key? key,
      this.customBuilder,
      this.listTile,
      required this.myFetchFunc,
      this.scrollVertical = true,
      this.fetchAutomatically = true})
      : super(key: key);

  @override
  _Fetch_widgetState<T> createState() => _Fetch_widgetState<T>();
}

class _Fetch_widgetState<T> extends State<Fetch_widget<T>> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    widget.fetchAutomatically
        ? BlocProvider.of<FetchBloc<T>>(context)
            .add(List_Fetch_Event<T>(widget.myFetchFunc))
        : null;
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
        BlocProvider.of<FetchBloc<T>>(context)
            .add(List_Fetch_Event<T>(widget.myFetchFunc));
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
          scrollDirection:
              widget.scrollVertical ? Axis.vertical : Axis.horizontal,
          controller: scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              fetchListStates(),
              belowLastTile_STATES(),
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
      //         return FetchScreen<Post>();
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
                BlocProvider.of<FetchBloc<T>>(context)
                    .add(List_Fetch_Event<T>(widget.myFetchFunc));
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
                BlocProvider.of<FetchBloc<T>>(context)
                    .add(List_Refresh_Event<T>());
                BlocProvider.of<FetchBloc<T>>(context)
                    .add(List_Fetch_Event<T>(widget.myFetchFunc));
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
/*                           //@ fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<FetchBloc<T>, FetchState<T>>(builder: (context, state) {
      print(state);
      return buildFetchList(state.fetchList);
    });
  }

  buildFetchList(List listArg) {
    return listArg.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Icon(
                  Icons.hourglass_bottom,
                  size: 80,
                  color: Colors.grey[200],
                ),
                const Text(
                  'No results',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        : widget.customBuilder == null
            ? ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: listArg.length,
                itemBuilder: (context, i) {
                  return widget.listTile == null
                      ? deafultListTile()
                      : widget.listTile!(listArg[i]);
                },
              )
            : widget.customBuilder!(listArg);
  }

  deafultListTile() {
    return ListTile(
      title: const Text("Title"),
      subtitle: const Text("SubTitle"),
      onTap: () {
        return;
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*               //! display error,loading states widgets                     */
/* -------------------------------------------------------------------------- */

  belowLastTile_STATES() {
    return BlocBuilder<FetchBloc<T>, FetchState<T>>(
      builder: (context, state) {
        if (state is FetchList_Loading_State<T>) {
          return customLoadingWidget();
        } else if (state is FetchList_Error_State<T>) {
          // scrollController.addListener(scrollListener);  // this is imp
          // MyComponents.errorSnackBar(context, 'Some Network error');
          return connectionErrorText(context, state.error);
        } else if (state is FetchList_LoadedEmpty_State<T>) {
          scrollController.removeListener(scrollListener);
          return nothingMoreToLoad();
        }
        return Container();

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
        BlocProvider.of<FetchBloc<T>>(context)
            .add(List_Fetch_Event<T>(widget.myFetchFunc));
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
        BlocProvider.of<FetchBloc<T>>(context)
            .add(List_Fetch_Event<T>(widget.myFetchFunc));
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
    BlocProvider.of<FetchBloc<T>>(context).add(List_Refresh_Event<T>());
    BlocProvider.of<FetchBloc<T>>(context)
        .add(List_Fetch_Event<T>(widget.myFetchFunc));
    scrollController.addListener(scrollListener);
  }
}


/* -------------------------------------------------------------------------- */
/*                                //? TUTORIAL                                */
/* -------------------------------------------------------------------------- */
// you can call fetchWidget, anywhere you want
  //     //# call fetchWidget anywhere,
  //     //# and pass func ( to fetch which api list)
  //     //# and listTile widget ( to display props)

  // sampleWidget() {
  //   return Container(

  //     child: Fetch_widget<Post>(
  //       myFetchFunc: (myCounter) => post_api_repo.fetchPosts_byProp_pUid(
  //           myCounter,
  //           '1'), // pass actual filterProp here ( p_uid, user_fk, etc)
  //       listTile: (singleObj) => Text(singleObj.toString),
  //     ),
      

    // child: Fetch_widget<UserAcc>(
      //   myFetchFunc: (myCounter) => user_api_repo.fetchAll(
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

//         BlocProvider<FetchBloc<UserAcc>>(create: (context) => FetchBloc<UserAcc>()),
//         BlocProvider<FetchBloc<Post>>(create: (context) => FetchBloc<Post>()),

//       ])