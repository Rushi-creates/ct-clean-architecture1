import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/user_repo.dart';
import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                              //@ delcarations                              */
/* -------------------------------------------------------------------------- */
    Size screenSize = MediaQuery.of(context).size;
    String noPfp =
        'https://icon-library.com/images/no-image-icon/no-image-icon-25.jpg';
    // 'https://icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-14.jpg';
    // 'https://icon-library.com/images/no-profile-picture-icon/no-profile-picture-icon-27.jpg';

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: CircleAvatar(
        backgroundColor: Colors.blue[200],
        radius: screenSize.width * 0.15,
        child: CircleAvatar(
          radius: screenSize.width * 0.14,
          backgroundColor: Colors.grey,
          backgroundImage: UserSpRepo.instance.getUser()?.photoUrl == "empty"
              ? NetworkImage(noPfp)
              : NetworkImage(UserSpRepo.instance.getUser()!.photoUrl!),
          // radius: 35.0,
        ),
      ),
    );
  }
}
