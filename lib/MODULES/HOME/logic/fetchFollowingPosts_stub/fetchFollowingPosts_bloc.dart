import 'package:bloc/bloc.dart';
import 'package:ct_single_post/NETWORK_CACHE/friends_posts_cache.dart';
import 'package:equatable/equatable.dart';

import '../../../../API_HELPER/exceptions/exceptions.dart';
import '../../../../SERIALIZERS/models/my_post.dart';
import '../../../../SERIALIZERS/repositories/other_api/movies_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/series_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/songs_repo.dart';
import '../../../../SERIALIZERS/repositories/other_api/youtube_repo.dart';

part 'fetchFollowingPosts_event.dart';
part 'fetchFollowingPosts_state.dart';

class FetchFollowingPostsBloc<T>
    extends Bloc<FetchFollowingPostsEvent<T>, FetchFollowingPostsState<T>> {
  int counter = 0;

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

  FetchFollowingPostsBloc()
      : super(
            FetchFollowingPostsInitial<T>(fetchFollowingPostsList: const [])) {
    Songs_api_repo songsApiRepo = Songs_api_repo();
    Yt_api_repo ytApiRepo = Yt_api_repo();
    Movies_api_repo moviesApiRepo = Movies_api_repo();
    Series_api_repo seriesApiRepo = Series_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ FetchFollowingPosts + pagination                */
/* -------------------------------------------------------------------------- */

    on<List_FetchFollowingPosts_Event<T>>((event, emit) async {
      print('list fetchFollowingPosts event called');
      print(state.fetchFollowingPostsList);
      try {
        emit(FetchFollowingPostsList_Loading_State<T>(
            fetchFollowingPostsList: state.fetchFollowingPostsList));

        counter++; //incr counter
        print(counter);

        final List<MyPost> moreListFetchFollowingPostsed =
            await event.myFetchFollowingPostsFunc(counter);

        // if nothing more is to fetchFollowingPosts
        if (moreListFetchFollowingPostsed.isEmpty) {
          print('list is empty');
          emit(FetchFollowingPostsList_LoadedEmpty_State<T>(
              fetchFollowingPostsList: state.fetchFollowingPostsList));

          // adding more fetchFollowingPostsed to final list
        } else if (moreListFetchFollowingPostsed.isNotEmpty) {
          print('list is not empty');
/* -------------------------------------------------------------------------- */
/*                           // @ fetch single trend                          */
/* -------------------------------------------------------------------------- */
          List myfinalDisplayList = [];
          for (var i = 0; i < moreListFetchFollowingPostsed.length; i++) {
            var singleTrend;

            //! songs
            if (moreListFetchFollowingPostsed[i].trendType == 'Songs') {
              singleTrend = await songsApiRepo
                  .fetchSong_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(songResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }

            //! Youtube
            else if (moreListFetchFollowingPostsed[i].trendType == 'Youtube') {
              singleTrend = await ytApiRepo
                  .fetchYoutube_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(youtubeSingleResult: singleTrend);
              myfinalDisplayList.add(myPost);
            }

            //! Movies
            else if (moreListFetchFollowingPostsed[i].trendType == 'Movies') {
              singleTrend = await moviesApiRepo
                  .fetchMovies_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(movieResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }
            //! Series
            else if (moreListFetchFollowingPostsed[i].trendType == 'Series') {
              singleTrend = await seriesApiRepo
                  .fetchSeries_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(seriesResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }
          }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
          state.fetchFollowingPostsList.toList().addAll(myfinalDisplayList);

          FriendsPostsCache.o.setPosts(myfinalDisplayList); //@

          emit(FetchFollowingPostsList_Loaded_State<T>(
              fetchFollowingPostsList: myfinalDisplayList));
        }

        // catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(FetchFollowingPostsList_Error_State<T>(
            error: storeErr,
            fetchFollowingPostsList: state.fetchFollowingPostsList));
      }
    });

/* -------------------------------------------------------------------------- */
/*                               //@ Refresh                                  */
/* -------------------------------------------------------------------------- */

    on<List_Refresh_Event<T>>((event, emit) async {
      counter = 0;
      state.fetchFollowingPostsList.toList().clear();
    });
  }
}
