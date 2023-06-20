import 'package:ct_single_post/CONSTANTS/api_endpoints/tmdb_movie_endpoints.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/SEARCHBAR/create_post_search_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../CONSTANTS/generic_classes.dart';
import '../../logic/Movies_tab/movies_fetch_logic/movies_fetch_bloc.dart';
import '../../logic/Series_tab/series_fetch_logic/series_fetch_bloc.dart';
import '../../logic/Songs_tab/songs_fetch_logic/songs_fetch_bloc.dart';
import '../../logic/Youtube_tab/youtube_fetch_logic/youtube_fetch_bloc.dart';

class CreatePostSearchListViewWidget<T> extends StatelessWidget {
  const CreatePostSearchListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return T == GYoutube
        ? fetchYoutubeStates()
        : T == GSong
            ? fetchSongsStates()
            : T == GSeries
                ? fetchSeriesStates()
                : T == GMovie
                    ? fetchMoviesStates()
                    : fetchMoviesStates();
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  fetchMoviesStates() {
    return BlocBuilder<MoviesFetchBloc, MoviesFetchState>(
      builder: (context, state) {
        if (state is MoviesFetch_Success_State) {
          return listView(context, list: state.modelObjList.results);
        } else if (state is MoviesFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is MoviesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display movies here');
      },
    );
  }

  fetchSongsStates() {
    return BlocBuilder<SongsFetchBloc, SongsFetchState>(
      builder: (context, state) {
        if (state is SongsFetch_Success_State) {
          return listView(context, list: state.modelObjList.results);
        } else if (state is SongsFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is SongsFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display songs here');
      },
    );
  }

  fetchYoutubeStates() {
    return BlocBuilder<YoutubeFetchBloc, YoutubeFetchState>(
      builder: (context, state) {
        if (state is YoutubeFetch_Success_State) {
          return listView(context, list: state.modelObjList.items);
        } else if (state is YoutubeFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is YoutubeFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display youtube videos here');
      },
    );
  }

  fetchSeriesStates() {
    return BlocBuilder<SeriesFetchBloc, SeriesFetchState>(
      builder: (context, state) {
        if (state is SeriesFetch_Success_State) {
          return listView(context, list: state.modelObjList.results);
        } else if (state is SeriesFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is SeriesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display series here');
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  listView(
    context, {
    required List list,
  }) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, i) {
        //@

        var singleObj = list[i];

//@
        String image() {
          String noResultImage =
              'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png';

          if (T == GYoutube) {
            return singleObj.snippet.thumbnails.high.url ?? noResultImage;
          } else if (T == GSong) {
            return singleObj.artworkUrl100 ?? noResultImage;
          } else if (T == GMovie || T == GSeries) {
            return singleObj.poster_path == null
                ? noResultImage
                : MovieEndpoints.imagePrefixUrl + singleObj.poster_path;
          }
          return noResultImage;
        }

//@
        String title() {
          if (T == GSong) {
            return singleObj.trackName;
          } else if (T == GMovie) {
            return singleObj.title;
          } else if (T == GSeries) {
            return singleObj.name;
          } else if (T == GYoutube) {
            return singleObj.snippet.title;
          }
          return ' ';
        }

//@

        String? subTitle() {
          if (T == GSong) {
            return singleObj.artistName;
          }
          return null;
        }

//@
        return CreatePostSearchTileWidget<T>(
          singleObj: singleObj,
          title: title(),
          image: image(),
          subTitle: subTitle(),
        );
      },
    );
  }
}
