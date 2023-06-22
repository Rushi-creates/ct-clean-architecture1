import 'package:ct_single_post/SERIALIZERS/models/Profile.dart';

import '../../SERIALIZERS/repositories/drf_api/profile_repo.dart';

class ProfileScreenSingleton {
/* -------------------------------------------------------------------------- */
/*                           //! making it singleton                          */
/* -------------------------------------------------------------------------- */

  ProfileScreenSingleton._();
  static final instance = ProfileScreenSingleton._();

/* -------------------------------------------------------------------------- */
/*                               //! State vars                               */
/* -------------------------------------------------------------------------- */

  bool isFromSearchScreen = false;
  void setIsFromProfileScreen(bool value) => isFromSearchScreen = value;

  Profile profileObj = ProfileSpRepo.instance.getProfile()!; //initial value
  void setProfileObj(Profile value) => profileObj = value; // later value

/* -------------------------------------------------------------------------- */
/*                               //! static vars                              */
/* -------------------------------------------------------------------------- */

  // Profile myProfile = ProfileSpRepo.instance.getProfile()!;
}
