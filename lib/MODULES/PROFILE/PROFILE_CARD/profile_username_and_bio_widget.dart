import 'package:flutter/material.dart';

import '../profile_screen_singleton.dart';

class ProfileUsernameAndBioWidget extends StatelessWidget {
  const ProfileUsernameAndBioWidget({super.key});

  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
/* -------------------------------------------------------------------------- */
/*                                //@ username                                */
/* -------------------------------------------------------------------------- */

          Text(
            // '@' +
            '${ProfileScreenSingleton.instance.profileObj.username}',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff2E394A),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 18.0,
            ),
          ),

          //
          const SizedBox(height: 2),

/* -------------------------------------------------------------------------- */
/*                                   //@ bio                                  */
/* -------------------------------------------------------------------------- */
          Text(
            '${ProfileScreenSingleton.instance.profileObj.bio}',
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff2E394A),
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
