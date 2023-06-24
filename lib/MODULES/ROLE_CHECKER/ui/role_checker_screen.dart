import 'package:ct_single_post/MODULES/BOTTOM_BAR1/bottom_bar1_widget.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/ui/create_profile_screen.dart';
import 'package:ct_single_post/MODULES/REGISTER/ui/register_screen.dart';
import 'package:ct_single_post/MODULES/ROLE_CHECKER/logic/role_checker_logic/role_checker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/HOME/logic/fetchFollowingPosts_stub/fetchFollowingPosts_bloc.dart'
    as fetchFollowingPostsStub;
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/following_posts_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/my_post_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';

import '../../CREATE_POST/logic/Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import '../../CREATE_POST/logic/Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import '../../CREATE_POST/logic/Songs_tab/trending_songs_fetch_logic/trending_songs_fetch_bloc.dart';
import '../../CREATE_POST/logic/Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';
import '../../PROFILE/My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart';

class RoleCheckerScreen extends StatefulWidget {
  const RoleCheckerScreen({super.key});

  @override
  State<RoleCheckerScreen> createState() => _RoleCheckerScreenState();
}

class _RoleCheckerScreenState extends State<RoleCheckerScreen> {
/* -------------------------------------------------------------------------- */
/*                                //! lifecycle                               */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RoleCheckerBloc>(context).add(CheckRoleEvent());

    // Future.delayed(const Duration(milliseconds: 0), () {
    // });
  }

/* -------------------------------------------------------------------------- */
/*                                  //! build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: myStates(),
    );
  }

  myStates() {
    return BlocListener<RoleCheckerBloc, RoleCheckerState>(
      listener: (context, state) {
        if (state is RoleErrorState) {
          debugPrint('error while loading sp');
        } else if (state is UserRoleState) {
          //!
          // resetBlocs();
          // initializeBlocs();
          callBlocs();

          //!
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const Bottombar1Widget();
          }));
        } else if (state is NoProfileRoleState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const CreateProfileScreen();
          }));
        } else if (state is AuthRoleState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RegisterScreen();
          }));
        }
      },
      child: design(),
    );
  }

  design() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.bouncingBall(color: Colors.grey, size: 100),
          const Text(
            "---",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
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

/* -------------------------------------------------------------------------- */
/*                          //@ Initialize all blocs                          */
/* -------------------------------------------------------------------------- */

  // resetBlocs() {}

  callBlocs() {
    //!trending
    BlocProvider.of<TrendingSongsFetchBloc>(context)
        .add(FetchTrendingSongs_Event());
    BlocProvider.of<TrendingYoutubeFetchBloc>(context)
        .add(FetchTrendingYoutube_Event());
    BlocProvider.of<TrendingMoviesFetchBloc>(context)
        .add(FetchTrendingMovies_Event());
    BlocProvider.of<TrendingSeriesFetchBloc>(context)
        .add(FetchTrendingSeries_Event());

    //! posts made by me

    BlocProvider.of<FetchPostsBloc<GMyPosts>>(context)
        .add(List_Refresh_Event<GMyPosts>());

    BlocProvider.of<FetchPostsBloc<GMyPosts>>(context).add(
        List_FetchPosts_Event<GMyPosts>((counter) => MyPostRepo.instance
            .fetchProp(counter,
                ProfileSpRepo.instance.getProfile()!.p_uid.toString())));

    //! posts of following on home
    BlocProvider.of<
            fetchFollowingPostsStub
                .FetchFollowingPostsBloc<GFollowingPosts>>(context)
        .add(fetchFollowingPostsStub.List_FetchFollowingPosts_Event<
                GFollowingPosts>(
            (counter) => FollowingPostsRepo.instance.fetchHomePosts(counter)));
  }
}
