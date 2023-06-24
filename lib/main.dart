import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/Crud_stub/fetch_stub/fetch_bloc.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/logic/Movies_tab/movies_fetch_logic/movies_fetch_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/logic/Series_tab/series_fetch_logic/series_fetch_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/logic/Songs_tab/songs_fetch_logic/songs_fetch_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/logic/Songs_tab/trending_songs_fetch_logic/trending_songs_fetch_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/logic/Youtube_tab/youtube_fetch_logic/youtube_fetch_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/create_profile_button_logic/create_profile_button_bloc.dart';
import 'package:ct_single_post/MODULES/HOME/logic/fetchFollowingPosts_stub/fetchFollowingPosts_bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/My_POSTS/fetchPosts_stub/fetchPosts_bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/FOLLOW_BUTTONS/follow_unfollow_logic/follow_unfollow_bloc.dart';
import 'package:ct_single_post/MODULES/REGISTER/logic/register_button_logic/register_button_bloc.dart';
import 'package:ct_single_post/MODULES/ROLE_CHECKER/logic/role_checker_logic/role_checker_bloc.dart';
import 'package:ct_single_post/MODULES/SETTINGS/UserLod_logic/user_lod_bloc.dart';
import 'package:ct_single_post/MODULES/SPLASH/splash__screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'API_HELPER/api_services/shared_preferences_helper.dart';
import 'MODULES/CREATE_POST/logic/Movies_tab/trending_movies_fetch_logic/trending_movies_fetch_bloc.dart';
import 'MODULES/CREATE_POST/logic/Series_tab/trending_series_fetch_logic/trending_series_fetch_bloc.dart';
import 'MODULES/CREATE_POST/logic/Youtube_tab/trending_youtube_fetch_logic/trending_youtube_fetch_bloc.dart';
import 'MODULES/CREATE_POST/ui/FORM/create_post_button_widget/MyPost_cud_logic/MyPost_cud_bloc.dart';
import 'MODULES/CREATE_POST/ui/FORM/create_post_form_states_widget/trend_selection_logic/trend_selection_bloc.dart';
// import 'package:ct_single_post/MODULES/PROFILE/profile_screen.dart';
// import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
// import 'SERIALIZERS/repositories/drf_api/profile_repo.dart';
// import 'SERIALIZERS/repositories/drf_api/user_repo.dart';
// import 'SERIALIZERS/repositories/other_api/google_auth_repo.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';

/* -------------------------------------------------------------------------- */
/*                                  //! main                                  */
/* -------------------------------------------------------------------------- */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  // UserSpRepo.instance.removeUser();
  // ProfileSpRepo.instance.removeProfile();
  // await GoogleAuthRepo.instance.logOut();

  runApp(const MyApp());
}

/* -------------------------------------------------------------------------- */
/*                            //! Root widget                                 */
/* -------------------------------------------------------------------------- */

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                             //! Bloc Providers                             */
/* -------------------------------------------------------------------------- */

    return MultiBlocProvider(
      providers: [
        // //@ CUBITS
        // BlocProvider<CreateProfileCubit>(
        //     create: (context) => CreateProfileCubit()),

        BlocProvider<ChipsCubit<GBottomBar>>(
            create: (context) => ChipsCubit<GBottomBar>(0)),
        BlocProvider<ChipsCubit<GCreatePostChips>>(
            create: (context) => ChipsCubit<GCreatePostChips>(0)),
        BlocProvider<ChipsCubit<GMyPostsChips>>(
            create: (context) => ChipsCubit<GMyPostsChips>(2)),

        //@ BLOCS
        BlocProvider<RoleCheckerBloc>(create: (context) => RoleCheckerBloc()),
        BlocProvider<RegisterButtonBloc>(
            create: (context) => RegisterButtonBloc()),

        BlocProvider<UserLodBloc>(create: (context) => UserLodBloc()),
        BlocProvider<CreateProfileButtonBloc>(
            create: (context) => CreateProfileButtonBloc()),

        BlocProvider<TrendSelectionBloc<GSong>>(
            create: (context) => TrendSelectionBloc<GSong>()),
        BlocProvider<TrendSelectionBloc<GMovie>>(
            create: (context) => TrendSelectionBloc<GMovie>()),
        BlocProvider<TrendSelectionBloc<GYoutube>>(
            create: (context) => TrendSelectionBloc<GYoutube>()),
        BlocProvider<TrendSelectionBloc<GSeries>>(
            create: (context) => TrendSelectionBloc<GSeries>()),

        BlocProvider<SongsFetchBloc>(create: (context) => SongsFetchBloc()),
        BlocProvider<MoviesFetchBloc>(create: (context) => MoviesFetchBloc()),
        BlocProvider<YoutubeFetchBloc>(create: (context) => YoutubeFetchBloc()),
        BlocProvider<SeriesFetchBloc>(create: (context) => SeriesFetchBloc()),

        BlocProvider<TrendingSongsFetchBloc>(
            create: (context) => TrendingSongsFetchBloc()),
        BlocProvider<TrendingMoviesFetchBloc>(
            create: (context) => TrendingMoviesFetchBloc()),
        BlocProvider<TrendingYoutubeFetchBloc>(
            create: (context) => TrendingYoutubeFetchBloc()),
        BlocProvider<TrendingSeriesFetchBloc>(
            create: (context) => TrendingSeriesFetchBloc()),

        BlocProvider<FollowUnfollowBloc>(
            create: (context) => FollowUnfollowBloc()),

        BlocProvider<MyPostCudBloc>(create: (context) => MyPostCudBloc()),
        BlocProvider<FetchPostsBloc<GMyPosts>>(
            create: (context) => FetchPostsBloc<GMyPosts>()),

        BlocProvider<FetchBloc<GFollowing>>(
            create: (context) => FetchBloc<GFollowing>()),
        BlocProvider<FetchFollowingPostsBloc<GFollowingPosts>>(
            create: (context) => FetchFollowingPostsBloc<GFollowingPosts>()),
        BlocProvider<FetchBloc<GSearchUsers>>(
            create: (context) => FetchBloc<GSearchUsers>()),
      ],

/* -------------------------------------------------------------------------- */
/*                              //@ Material app                              */
/* -------------------------------------------------------------------------- */

      child: MaterialApp(
          title: 'CT mvp one',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen()
          // home: ProfileScreen(
          //     isFromSearchScreen: false,
          //     profileObj: ProfileSpRepo.instance.getProfile()!),
          ),
    );
  }
}
