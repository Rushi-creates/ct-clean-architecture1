import 'package:bloc/bloc.dart';
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
      : super(FetchFollowingPostsInitial<T>(fetchFollowingPostsList: [])) {
    Songs_api_repo songs_api_repo = Songs_api_repo();
    Yt_api_repo yt_api_repo = Yt_api_repo();
    Movies_api_repo movies_api_repo = Movies_api_repo();
    Series_api_repo series_api_repo = Series_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ FetchFollowingPosts + pagination                              */
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
          emit(FetchFollowingPostsList_LoadedEmpty_State<T>(
              fetchFollowingPostsList: state.fetchFollowingPostsList));

          // adding more fetchFollowingPostsed to final list
        } else if (moreListFetchFollowingPostsed.isNotEmpty) {
/* -------------------------------------------------------------------------- */
/*                           // @ fetch single trend                          */
/* -------------------------------------------------------------------------- */
          List myfinalDisplayList = [];
          for (var i = 0; i < moreListFetchFollowingPostsed.length; i++) {
            var singleTrend;

            //! songs
            if (moreListFetchFollowingPostsed[i].trendType == 'Songs') {
              singleTrend = await songs_api_repo
                  .fetchSong_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(songResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }

            //! Youtube
            else if (moreListFetchFollowingPostsed[i].trendType == 'Youtube') {
              singleTrend = await yt_api_repo
                  .fetchYoutube_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(youtubeSingleResult: singleTrend);
              myfinalDisplayList.add(myPost);
            }

            //! Movies
            else if (moreListFetchFollowingPostsed[i].trendType == 'Movies') {
              singleTrend = await movies_api_repo
                  .fetchMovies_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(movieResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }
            //! Series
            else if (moreListFetchFollowingPostsed[i].trendType == 'Series') {
              singleTrend = await series_api_repo
                  .fetchSeries_byId(moreListFetchFollowingPostsed[i].api_id);

              MyPost myPost = moreListFetchFollowingPostsed[i]
                  .copyWith(seriesResults: singleTrend);
              myfinalDisplayList.add(myPost);
            }
          }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
          state.fetchFollowingPostsList.addAll(myfinalDisplayList);
          emit(FetchFollowingPostsList_Loaded_State<T>(
              fetchFollowingPostsList: state.fetchFollowingPostsList));
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
      state.fetchFollowingPostsList.clear();
    });
  }
}
