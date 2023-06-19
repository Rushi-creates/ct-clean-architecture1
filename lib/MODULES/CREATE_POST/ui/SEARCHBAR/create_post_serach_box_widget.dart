import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../CONSTANTS/generic_classes.dart';
import '../../logic/Movies_tab/movies_fetch_logic/movies_fetch_bloc.dart';
import '../../logic/Series_tab/series_fetch_logic/series_fetch_bloc.dart';
import '../../logic/Songs_tab/songs_fetch_logic/songs_fetch_bloc.dart';
import '../../logic/Youtube_tab/youtube_fetch_logic/youtube_fetch_bloc.dart';

class CreatePostSearchBoxWidget<T> extends StatelessWidget {
  const CreatePostSearchBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return T is GYoutube
        ? fetchYoutube_states()
        : T is GSong
            ? fetchSongs_states()
            : T is GSeries
                ? fetchSeries_states()
                : T is GMovie
                    ? fetchMovies_states()
                    : fetchMovies_states();
  }

  fetchMovies_states() {
    return BlocBuilder<MoviesFetchBloc, MoviesFetchState>(
      builder: (context, state) {
        if (state is MoviesFetch_Success_State) {
          return mySuggestionBox(state);
        } else if (state is MoviesFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is MoviesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display movies here');
      },
    );
  }

  fetchSongs_states() {
    return BlocBuilder<SongsFetchBloc, SongsFetchState>(
      builder: (context, state) {
        if (state is SongsFetch_Success_State) {
          return mySuggestionBox_forSongs(state);
        } else if (state is SongsFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is SongsFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display songs here');
      },
    );
  }

  fetchYoutube_states() {
    return BlocBuilder<YoutubeFetchBloc, YoutubeFetchState>(
      builder: (context, state) {
        if (state is YoutubeFetch_Success_State) {
          return mySuggestionBox_forYt(state);
        } else if (state is YoutubeFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is YoutubeFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display youtube videos here');
      },
    );
  }

  fetchSeries_states() {
    return BlocBuilder<SeriesFetchBloc, SeriesFetchState>(
      builder: (context, state) {
        if (state is SeriesFetch_Success_State) {
          return mySuggestionBox(state);
        } else if (state is SeriesFetch_Loading_State) {
          return const CircularProgressIndicator();
        } else if (state is SeriesFetch_Error_State) {
          return Text('state => ${state.error}');
        }
        return const Text('display series here');
      },
    );
  }

  mySuggestionBox_forSongs(state) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: state.modelObjList.results == null
          ? 0
          : state.modelObjList.results.length,
      itemBuilder: (context, i) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          // shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: NetworkImage(state
                                      .modelObjList.results[i].artworkUrl100 ??
                                  'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png'),
                              fit: BoxFit.fill)),
                    ),
                    // child: Image.network(
                    //     fit: BoxFit.cover,
                    //     height: 48,
                    //     width: 48,
                    //     // state.modelObjList.results[i].artworkUrl100 == null
                    //     //     ? 'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png'
                    //     //     :
                    //     state.modelObjList.results[i].artworkUrl100),
                  ),
                ),
                tileColor: Colors.greenAccent,
                title: Text(
                  state.modelObjList.results[i].trackName,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
                subtitle: Text(
                  state.modelObjList.results[i].artistName,
                  maxLines: 1,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 11.0,
                  ),
                ),
                // leading: CircleAvatar(
                //     child: FittedBox(
                //   child: Text(state.modelObjList.results[i].id.toString()),
                // )),
                trailing:
                    // MyToggleIconButton_widget(
                    //     onIcon: Icons.add,
                    //     on_onIconPressed: () {
                    //       print('Button turned off');

                    //       if (widget.headingText == 'Movies') {
                    //         BlocProvider.of<MyMovieCartBloc>(context)
                    //             .add(AddMovie_Event(state.modelObjList.results[i]));
                    //       } else if (widget.headingText == 'Series') {
                    //         BlocProvider.of<MySeriesCartBloc>(context).add(
                    //             AddSeries_Event(state.modelObjList.results[i]));
                    //       } else if (widget.headingText == 'Songs') {
                    //         BlocProvider.of<MySongCartBloc>(context)
                    //             .add(AddSong_Event(state.modelObjList.results[i]));
                    //       }
                    //     },
                    //     offIcon: Icons.delete,
                    //     on_offIconPressed: () {
                    //       print('Button turned on');
                    //       if (widget.headingText == 'Movies') {
                    //         BlocProvider.of<MyMovieCartBloc>(context)
                    //             .add(RemoveMovie_Event(i));
                    //       } else if (widget.headingText == 'Series') {
                    //         BlocProvider.of<MySeriesCartBloc>(context)
                    //             .add(RemoveSeries_Event(i));
                    //       } else if (widget.headingText == 'Songs') {
                    //         BlocProvider.of<MySongCartBloc>(context)
                    //             .add(RemoveSong_Event(i));
                    //       } else if (widget.headingText == 'Custom') {
                    //         BlocProvider.of<MyCustomCartBloc>(context)
                    //             .add(RemoveCustom_Event(i));
                    //       }
                    //     }),

                    //         ToggleButtons(
                    //       isSelected: [false],
                    //       onPressed: (int index){
                    //         // if(index == 0)
                    //          setState(() {
                    //           // index =! false;
                    //           //   _selections[index]=!_selections[index];
                    //     if(index==0 && false){
                    //         // Do something
                    //     } else if(index==0 && true){
                    //           // Do something
                    // }
                    //          });

                    //       },
                    //       children: [
                    //         IconButton(
                    //           icon: Icon(Icons.add),
                    //           onPressed: () {
                    //             print('test add to cart');
                    //             BlocProvider.of<MySongCartBloc>(context)
                    //                 .add(AddSong_Event(state.modelObjList.results[i]));
                    //           },
                    //         ),
                    //       ],
                    //     ),

                    IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    print('test add to cart');
                    BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                        .add(AddTrend_Event(state.modelObjList.results[i]));
                  },
                ),
              ),
              const Divider(
                height: 0,
                // color: widget.gradient1,
              )
            ],
          ),
        );
      },
    );
  }

  mySuggestionBox_forYt(state) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: state.modelObjList.items == null
          ? 0
          : state.modelObjList.items.length,
      itemBuilder: (context, i) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          // shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: NetworkImage(state.modelObjList.items[i]
                                      .snippet.thumbnails.high.url ??
                                  'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png'),
                              fit: BoxFit.fill)),
                    ),

                    //  Image.network(
                    //     fit: BoxFit.cover,
                    //     height: 48,
                    //     width: 48,
                    //     state.modelObjList.items[i].snippet.thumbnails.high
                    //                 .url ==
                    //             null
                    //         ? 'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png'
                    //         : state.modelObjList.items[i].snippet.thumbnails
                    //             .high.url),
                  ),
                ),
                tileColor: Colors.greenAccent,
                title: Text(
                  T is GMovie || T is GSong
                      ? state.modelObjList.results[i].title
                      : T is GYoutube
                          ? state.modelObjList.items[i].snippet.title
                          : state.modelObjList.results[i].title,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 8.0,
                  ),
                ),
                // leading: CircleAvatar(
                //     child: FittedBox(
                //   child: Text(state.modelObjList.results[i].id.toString()),
                // )),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    print('test add to cart');
                    BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                        .add(AddTrend_Event(state.modelObjList.items[i]));
                  },
                ),
              ),
              const Divider(
                height: 0,
                // color: widget.gradient1,
              )
            ],
          ),
        );
      },
    );
  }

  mySuggestionBox(state) {
    return ListView.builder(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: state.modelObjList.results == null
          ? 0
          : state.modelObjList.results.length,
      itemBuilder: (context, i) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        fit: BoxFit.cover,
                        height: 48,
                        width: 48,
                        state.modelObjList.results[i].poster_path == null
                            ? 'https://www.pngkey.com/png/detail/672-6722829_no-result-found.png'
                            : MovieApiLinks.imagePrefixUrl +
                                state.modelObjList.results[i].poster_path),
                  ),
                ),
                tileColor: Colors.greenAccent,
                title: Text(
                  widget.headingText == 'Series'
                      ? state.modelObjList.results[i].name
                      : state.modelObjList.results[i].title,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    // fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                  ),
                ),
                // leading: CircleAvatar(
                //     child: FittedBox(
                //   child: Text(state.modelObjList.results[i].id.toString()),
                // )),
                trailing: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    BlocProvider.of<DisplaySingleTrendBloc<T>>(context)
                        .add(AddTrend_Event(state.modelObjList.results[i]));
                  },
                ),
              ),
              const Divider(
                height: 0,
                // color: widget.gradient1,
              )
            ],
          ),
        );
      },
    );
  }
}
