import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/create_profile_button_logic/create_profile_button_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/cubit/create_profile_cubit.dart';
import 'package:ct_single_post/MODULES/REGISTER/logic/register_button_logic/register_button_bloc.dart';
import 'package:ct_single_post/MODULES/ROLE_CHECKER/logic/role_checker_logic/role_checker_bloc.dart';
import 'package:ct_single_post/MODULES/SPLASH/splash__screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'API_HELPER/api_services/shared_preferences_helper.dart';
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
        BlocProvider<CreateProfileCubit>(
            create: (context) => CreateProfileCubit()),

        BlocProvider<ChipsCubit<GBottomBar>>(
            create: (context) => ChipsCubit<GBottomBar>(0)),
        BlocProvider<ChipsCubit<GCreatePostChips>>(
            create: (context) => ChipsCubit<GCreatePostChips>(0)),

        //@ BLOCS
        BlocProvider<RoleCheckerBloc>(create: (context) => RoleCheckerBloc()),
        BlocProvider<RegisterButtonBloc>(
            create: (context) => RegisterButtonBloc()),
        BlocProvider<CreateProfileButtonBloc>(
            create: (context) => CreateProfileButtonBloc()),
      ],

/* -------------------------------------------------------------------------- */
/*                              //@ Material app                              */
/* -------------------------------------------------------------------------- */

      child: MaterialApp(
        title: 'Flutter app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
