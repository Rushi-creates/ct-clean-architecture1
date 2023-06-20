import 'package:cached_network_image/cached_network_image.dart';
import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../COMMON/WIDGETS/loader_widget.dart';
import '../logic/Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import '../logic/Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import '../logic/Songs_tab/trending_songs_fetch_logic/trending_songs_fetch_bloc.dart';
import '../logic/Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';
import 'FORM/create_post_form_states_widget/trend_selection_logic/trend_selection_bloc.dart';

class CreatePostTrendingWidget<T> extends StatelessWidget {
  const CreatePostTrendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return T == GYoutube
        ? fetchTrendingYoutubeStates()
        : T == GSong
            ? fetchTrendingSongsStates()
            : T == GSeries
                ? fetchTrendingSeriesStates()
                : T == GMovie
                    ? fetchTrendingMoviesStates()
                    : fetchTrendingMoviesStates();
  }

/* -------------------------------------------------------------------------- */
/*                             //! trending states                            */
/* -------------------------------------------------------------------------- */

  fetchTrendingSongsStates() {
    return BlocBuilder<TrendingSongsFetchBloc, TrendingSongsFetchState>(
      builder: (context, state) {
        if (state is TrendingSongsFetch_Success_State) {
          return trendingListView(state.trendSongsList.results);
        } else if (state is TrendingSongsFetch_Loading_State) {
          return const LoaderWidget();
        } else if (state is TrendingSongsFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text(
            'Some Problem loading trending songs,\nPlease restart the app');
      },
    );
  }

  fetchTrendingMoviesStates() {
    return BlocBuilder<TrendingMoviesFetchBloc, TrendingMoviesFetchState>(
      builder: (context, state) {
        if (state is TrendingMoviesFetch_Success_State) {
          return trendingListView(state.trendMovieList.results);
        } else if (state is TrendingMoviesFetch_Loading_State) {
          return const LoaderWidget();
        } else if (state is TrendingMoviesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text(
            'Some Problem loading trending movies,\nPlease restart the app');
      },
    );
  }

  fetchTrendingSeriesStates() {
    return BlocBuilder<TrendingSeriesFetchBloc, TrendingSeriesFetchState>(
      builder: (context, state) {
        if (state is TrendingSeriesFetch_Success_State) {
          return trendingListView(state.trendSeriesList.results);
        } else if (state is TrendingSeriesFetch_Loading_State) {
          return const LoaderWidget();
        } else if (state is TrendingSeriesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text(
            'Some Problem loading trending series,\nPlease restart the app');
      },
    );
  }

  fetchTrendingYoutubeStates() {
    return BlocBuilder<TrendingYoutubeFetchBloc, TrendingYoutubeFetchState>(
      builder: (context, state) {
        if (state is TrendingYoutubeFetch_Success_State) {
          return trendingListView(state.trendYoutubeList.items);
        } else if (state is TrendingYoutubeFetch_Loading_State) {
          return const LoaderWidget();
        } else if (state is TrendingYoutubeFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text(
            'Some Problem loading trending Youtube,\nPlease restart the app');
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Listview                                */
/* -------------------------------------------------------------------------- */

  trendingListView(list) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3,
        ),
        scrollDirection: Axis.vertical,
        itemCount: list.take(4).length,
        itemBuilder: (context, i) {
          var singleObj = list[i];
          return
              //! single
              CreatePostTrendingTileWidget<T>(
                  index: i,

                  //@ icon
                  icon: T == GSong
                      ? singleObj.artworkUrl100
                      : T == GMovie || T == GSeries
                          ? MovieEndpoints.imagePrefixUrl +
                              singleObj.poster_path
                          : singleObj.snippet.thumbnails.high.url,

                  //@ title
                  title: T == GMovie
                      ? singleObj.title
                      : T == GSeries
                          ? singleObj.name
                          : T == GYoutube
                              ? singleObj.snippet.title
                              : T == GSong
                                  ? singleObj.trackName
                                  : singleObj.title,

                  //@ singleObj
                  singleObj: singleObj);
        },
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               //! Tile widget                              */
/* -------------------------------------------------------------------------- */

class CreatePostTrendingTileWidget<T> extends StatelessWidget {
  final index;
  final singleObj;
  final title;
  final icon;
  const CreatePostTrendingTileWidget({
    super.key,
    required this.index,
    required this.singleObj,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return tile(context);
  }

  tile(context) {
    return SizedBox(
      // height: 20,
      // width: dimVar.width * 0.4,
      child: Container(
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(234, 233, 241, 0.8),
              blurRadius: 50,
              offset: Offset(0, 35)),
        ]),
        child: Card(
          elevation: 0,
          // shadowColor: Colors.grey.withOpacity(0.8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(children: [
                SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        height: 48,
                        width: 48,
                        imageUrl: icon),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      // softWrap: false,
                      style: const TextStyle(
                        color: Color(0xff2E394A),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 9,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  child: IconButton(
                    color: Colors.grey,
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      print('icon pressed');

                      // BlocProvider.of<MyToggleIconButtonBloc>(context)
                      //     .add(Toggle_turnOff_Event());

                      //@ Bloc provider event call

                      if (T == GMovie) {
                        BlocProvider.of<TrendSelectionBloc<T>>(context)
                            .add(AddTrend_Event<T>(singleObj));
                      } else if (T == GYoutube) {
                        BlocProvider.of<TrendSelectionBloc<T>>(context)
                            .add(AddTrend_Event<T>(singleObj));
                      } else if (T == GSong) {
                        BlocProvider.of<TrendSelectionBloc<T>>(context)
                            .add(AddTrend_Event<T>(singleObj));
                      } else if (T == GSeries) {
                        BlocProvider.of<TrendSelectionBloc<T>>(context)
                            .add(AddTrend_Event<T>(singleObj));
                      }
                    },
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
