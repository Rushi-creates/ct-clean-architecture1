import 'package:bloc/bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/my_posts_singleton.dart';
import 'package:ct_single_post/NETWORK_CACHE/my_posts_cache.dart';

import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../SERIALIZERS/models/my_post.dart';
import '../../../../SERIALIZERS/repositories/other_api/movies_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/series_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/songs_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/youtube_repo.dart';

part 'fetchPosts_event.dart';
part 'fetchPosts_state.dart';

class FetchPostsBloc<T> extends Bloc<FetchPostsEvent<T>, FetchPostsState<T>> {
  int counter = 0;

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

  FetchPostsBloc() : super(FetchPostsInitial<T>(fetchPostsList: const [])) {
    Songs_api_repo songsApiRepo = Songs_api_repo();
    Yt_api_repo ytApiRepo = Yt_api_repo();
    Movies_api_repo moviesApiRepo = Movies_api_repo();
    Series_api_repo seriesApiRepo = Series_api_repo();

    //@ dummy MyPost ( for each trend)

/* -------------------------------------------------------------------------- */
/*                        //@ FetchPosts + pagination                         */
/* -------------------------------------------------------------------------- */

    on<List_FetchPosts_Event<T>>((event, emit) async {
      print('list fetchPosts event called');
      print(state.fetchPostsList);

      try {
        emit(FetchPostsList_Loading_State<T>(
            fetchPostsList: state.fetchPostsList));

        counter++; //incr counter
        print(counter);

        final List<MyPost> moreListFetchPostsed =
            await event.myFetchPostsFunc(counter);

        print('******* more list fetechtd $moreListFetchPostsed');

        // if nothing more is to fetchPosts
        if (moreListFetchPostsed.isEmpty) {
          emit(FetchPostsList_LoadedEmpty_State<T>(
              fetchPostsList: state.fetchPostsList));
          print('******** lsit empty');

          // adding more fetchPostsed to final list
        } else if (moreListFetchPostsed.isNotEmpty) {
          print('*************************** 88 => llist not empty');

/* -------------------------------------------------------------------------- */
/*                           // @ fetch single trend                          */
/* -------------------------------------------------------------------------- */
          var myfinalDisplayList = [];

          for (var i = 0; i < moreListFetchPostsed.length; i++) {
            var singleTrend;

            //! songs
            if (moreListFetchPostsed[i].trendType == 'Songs') {
              singleTrend = await songsApiRepo
                  .fetchSong_byId(moreListFetchPostsed[i].api_id);
              print(singleTrend);

              // if (singleTrend != false) {
              MyPost myPost =
                  moreListFetchPostsed[i].copyWith(songResults: singleTrend);

              print(myPost);
              myfinalDisplayList.add(myPost);
              print(
                  '*************************** song list => $myfinalDisplayList');
              // }
            }

            //! Youtube
            else if (moreListFetchPostsed[i].trendType == 'Youtube') {
              singleTrend = await ytApiRepo
                  .fetchYoutube_byId(moreListFetchPostsed[i].api_id);

              MyPost myPost = moreListFetchPostsed[i]
                  .copyWith(youtubeSingleResult: singleTrend);
              myfinalDisplayList.add(myPost);
            }

            //! Movies
            else if (moreListFetchPostsed[i].trendType == 'Movies') {
              singleTrend = await moviesApiRepo
                  .fetchMovies_byId(moreListFetchPostsed[i].api_id);

              MyPost myPost =
                  moreListFetchPostsed[i].copyWith(movieResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }
            //! Series
            else if (moreListFetchPostsed[i].trendType == 'Series') {
              singleTrend = await seriesApiRepo
                  .fetchSeries_byId(moreListFetchPostsed[i].api_id);

              MyPost myPost =
                  moreListFetchPostsed[i].copyWith(seriesResults: singleTrend);

              myfinalDisplayList.add(myPost);
            }
          }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

          state.fetchPostsList.toList().addAll(myfinalDisplayList);
          print(
              '*************************** final display list => $myfinalDisplayList');

          MyPostSingleton.instance.setMyPostsList(myfinalDisplayList); //@
          MyPostsCache.o.setMyPostsList(myfinalDisplayList); //@

          emit(FetchPostsList_Loaded_State<T>(
              fetchPostsList: state.fetchPostsList));
        }

        // catch error
      } catch (e) {
        print('inside error bloc');
        print(e);
        // print(e.runtimeType);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FetchPostsList_Error_State<T>(
            error: storeErr, fetchPostsList: state.fetchPostsList));
      }
    });

/* -------------------------------------------------------------------------- */
/*                               //@ Refresh                                  */
/* -------------------------------------------------------------------------- */

    on<List_Refresh_Event<T>>((event, emit) async {
      counter = 0;
      state.fetchPostsList.toList().clear();
    });
  }
}




/* -------------------------------------------------------------------------- */
/*                                   //@ new                                  */
/* -------------------------------------------------------------------------- */


// import 'package:bloc/bloc.dart';
// import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/my_posts_singleton.dart';
// import 'package:ct_single_post/NETWORK_CACHE/my_posts_cache.dart';

// import 'package:equatable/equatable.dart';

// import '../../../../API_HELPER/exceptions/exceptions.dart';
// import '../../../../SERIALIZERS/models/my_post.dart';
// import '../../../../SERIALIZERS/repositories/other_api/movies_repo.dart';
// import '../../../../SERIALIZERS/repositories/other_api/series_repo.dart';
// import '../../../../SERIALIZERS/repositories/other_api/songs_repo.dart';
// import '../../../../SERIALIZERS/repositories/other_api/youtube_repo.dart';

// part 'fetchPosts_event.dart';
// part 'fetchPosts_state.dart';

// class FetchPostsBloc<T> extends Bloc<FetchPostsEvent<T>, FetchPostsState<T>> {
//   int counter = 0;

// /* -------------------------------------------------------------------------- */
// /*                                     //!                                    */
// /* -------------------------------------------------------------------------- */

//   FetchPostsBloc() : super(FetchPostsInitial<T>(fetchPostsList: const [])) {
//     Songs_api_repo songsApiRepo = Songs_api_repo();
//     Yt_api_repo ytApiRepo = Yt_api_repo();
//     Movies_api_repo moviesApiRepo = Movies_api_repo();
//     Series_api_repo seriesApiRepo = Series_api_repo();

//     //@ dummy MyPost ( for each trend)

// /* -------------------------------------------------------------------------- */
// /*                        //@ FetchPosts + pagination                         */
// /* -------------------------------------------------------------------------- */

//     on<List_FetchPosts_Event<T>>((event, emit) async {
//       print('list fetchPosts event called');
//       print(state.fetchPostsList);

//       try {
//         emit(FetchPostsList_Loading_State<T>(
//             fetchPostsList: state.fetchPostsList));

//         counter++; //incr counter
//         print(counter);

//         final List<MyPost> moreListFetchPostsed =
//             await event.myFetchPostsFunc(counter);

//         print('******* more list fetechtd $moreListFetchPostsed');

//         // if nothing more is to fetchPosts
//         if (moreListFetchPostsed.isEmpty) {
//           emit(FetchPostsList_LoadedEmpty_State<T>(
//               fetchPostsList: state.fetchPostsList));
//           print('******** lsit empty');

//           // adding more fetchPostsed to final list
//         } else if (moreListFetchPostsed.isNotEmpty) {
//           print('*************************** 88 => llist not empty');

// /* -------------------------------------------------------------------------- */
// /*                           // @ fetch single trend                          */
// /* -------------------------------------------------------------------------- */
//           List myfinalDisplayList = [];
//           for (var i = 0; i < moreListFetchPostsed.length; i++) {
//             var singleTrend;

//             //! songs
//             if (moreListFetchPostsed[i].trendType == 'Songs') {
//               singleTrend = await songsApiRepo
//                   .fetchSong_byId(moreListFetchPostsed[i].api_id);
//               print(singleTrend);

//               // if (singleTrend != false) {
//               MyPost myPost =
//                   moreListFetchPostsed[i].copyWith(songResults: singleTrend);
//               print(myPost);
//               myfinalDisplayList.add(myPost);
//               print(
//                   '*************************** song list => $myfinalDisplayList');
//               // }
//             }

//             //! Youtube
//             else if (moreListFetchPostsed[i].trendType == 'Youtube') {
//               singleTrend = await ytApiRepo
//                   .fetchYoutube_byId(moreListFetchPostsed[i].api_id);

//               MyPost myPost = moreListFetchPostsed[i]
//                   .copyWith(youtubeSingleResult: singleTrend);
//               myfinalDisplayList.add(myPost);
//             }

//             //! Movies
//             else if (moreListFetchPostsed[i].trendType == 'Movies') {
//               singleTrend = await moviesApiRepo
//                   .fetchMovies_byId(moreListFetchPostsed[i].api_id);

//               MyPost myPost =
//                   moreListFetchPostsed[i].copyWith(movieResults: singleTrend);
//               myfinalDisplayList.add(myPost);
//             }
//             //! Series
//             else if (moreListFetchPostsed[i].trendType == 'Series') {
//               singleTrend = await seriesApiRepo
//                   .fetchSeries_byId(moreListFetchPostsed[i].api_id);

//               MyPost myPost =
//                   moreListFetchPostsed[i].copyWith(seriesResults: singleTrend);
//               myfinalDisplayList.add(myPost);
//             }
//           }

// /* -------------------------------------------------------------------------- */
// /*                                     //@                                    */
// /* -------------------------------------------------------------------------- */
//           state.fetchPostsList.addAll(myfinalDisplayList);
//           print(
//               '*************************** final display list => $myfinalDisplayList');

//           MyPostSingleton.instance.setMyPostsList(state.fetchPostsList); //@
//           MyPostsCache.o.setMyPostsList(state.fetchPostsList); //@

//           emit(FetchPostsList_Loaded_State<T>(
//               fetchPostsList: state.fetchPostsList));
//         }

//         // catch error
//       } catch (e) {
//         print('inside error bloc');
//         print(e);
//         // print(e.runtimeType);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(FetchPostsList_Error_State<T>(
//             error: storeErr, fetchPostsList: state.fetchPostsList));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                               //@ Refresh                                  */
// /* -------------------------------------------------------------------------- */

//     on<List_Refresh_Event<T>>((event, emit) async {
//       counter = 0;
//       state.fetchPostsList.clear();
//     });
//   }
// }

