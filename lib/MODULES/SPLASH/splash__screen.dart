import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../CREATE_POST/logic/Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import '../CREATE_POST/logic/Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import '../CREATE_POST/logic/Songs_tab/trending_songs_fetch_logic/trending_songs_fetch_bloc.dart';
import '../CREATE_POST/logic/Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';
import '../ROLE_CHECKER/ui/role_checker_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // callBlocs();

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const RoleCheckerScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 0, 143),
      body: design(),
    );
  }

  design() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.white, size: 100),
          ),
          const Text(
            "Current Trends",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  callBlocs() {
    BlocProvider.of<TrendingSongsFetchBloc>(context)
        .add(FetchTrendingSongs_Event());
    BlocProvider.of<TrendingYoutubeFetchBloc>(context)
        .add(FetchTrendingYoutube_Event());
    BlocProvider.of<TrendingMoviesFetchBloc>(context)
        .add(FetchTrendingMovies_Event());
    BlocProvider.of<TrendingSeriesFetchBloc>(context)
        .add(FetchTrendingSeries_Event());
  }
}
