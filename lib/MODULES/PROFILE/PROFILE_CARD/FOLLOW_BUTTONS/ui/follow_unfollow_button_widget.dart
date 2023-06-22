import 'package:ct_single_post/MODULES/PROFILE/PROFILE_CARD/FOLLOW_BUTTONS/follow_unfollow_logic/follow_unfollow_bloc.dart';
import 'package:ct_single_post/MODULES/PROFILE/profile_screen_singleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../SERIALIZERS/models/follow_account.dart';
import '../../../../../SERIALIZERS/repositories/drf_api/profile_repo.dart';

class FollowUnfollowButtonWidget extends StatelessWidget {
  const FollowUnfollowButtonWidget({super.key});

/* -------------------------------------------------------------------------- */
/*                                  //@ build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return states();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  states() {
    return BlocBuilder<FollowUnfollowBloc, FollowUnfollowState>(
      builder: (context, state) {
        //
        if (state is FollowUnfollowLoadingState) {
          return disabledButton(context, 'Please wait ...');
        } else if (state is FollowUnfollowErrorState) {
          return disabledButton(context, '     Error     ');

          //
        } else if (state is CheckedFollowsState) {
          return unfollowButton(context);
        } else if (state is CheckedDoesntFollowsState) {
          return followButton(context);
        }

        //
        else if (state is FollowSuccessState) {
          return unfollowButton(context);
        } else if (state is UnfollowSuccessState) {
          return followButton(context);
        }

        //
        return Container();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */

  followButton(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.blue[300]),
          onPressed: () {
            //
            FollowAccount followAccount = FollowAccount(
                my_profile_fk: ProfileSpRepo.instance.getProfile()!.p_uid!,
                other_profile_fk:
                    ProfileScreenSingleton.instance.profileObj.p_uid!);

            //
            BlocProvider.of<FollowUnfollowBloc>(context)
                .add(FollowAccountEvent(followAccount));
          },
          child: const Text(
            "Follow",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */

  unfollowButton(context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          onPressed: () {
            BlocProvider.of<FollowUnfollowBloc>(context).add(
                UnfollowAccountEvent(
                    ProfileSpRepo.instance.getProfile()!.p_uid!,
                    ProfileScreenSingleton.instance.profileObj.p_uid!));
          },
          child: Text(
            "Unfollow",
            style: TextStyle(color: Colors.blue[600]),
          ),
        ));
  }

/* -------------------------------------------------------------------------- */
/*                                     //@                                    */
/* -------------------------------------------------------------------------- */
  disabledButton(context, String text) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextButton(
            style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey[200],
              backgroundColor: Colors.pink[600],
            ),
            onPressed: null,
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            )));
  }
}
