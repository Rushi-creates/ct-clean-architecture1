import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../SERIALIZERS/models/follow_account.dart';
import '../logic/Check_if_follows_logic/CheckIfFollows_cud_bloc.dart';
import '../logic/Follow_account_logic/FollowAccount_cud_bloc.dart';

class Follow_widget extends StatefulWidget {
  final my_profileId;
  final otherProfileId;
  const Follow_widget({
    required this.my_profileId,
    required this.otherProfileId,
  });

  @override
  _Follow_widgetState createState() => _Follow_widgetState();
}

class _Follow_widgetState extends State<Follow_widget> {
// /* -------------------------------------------------------------------------- */
// /*                                  //! Init                                  */
// /* -------------------------------------------------------------------------- */

//   @override
//   void initState() {
//     super.initState();
//     FollowAccount followAccount = FollowAccount(
//         myProfile_fk: widget.my_profileId,
//         otherProfile_fk: widget.otherProfileId);
//     BlocProvider.of<CheckIfFollowsCudBloc>(context)
//         .add(CheckIfFollows_create_onButtonPressed_Event(followAccount));
//   }

/* -------------------------------------------------------------------------- */
/*                                  //! Build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return checkIfFollows_STATES();
  }

  checkIfFollows_STATES() {
    return BlocBuilder<CheckIfFollowsCudBloc, CheckIfFollowsCudState>(
      builder: (context, state) {
        if (state is CheckIfFollows_create_Loading_State) {
          return pleaseWaitLoading_Button();
        } else if (state is CheckIfFollows_create_Error_State) {
          return errorChecking_Button();
        } else if (state is CheckIfFollows_create_DoesNotFollows_State) {
          return followButton_STATES();
        }

        return Container();
      },
    );
  }

  followButton_STATES() {
    return BlocConsumer<FollowAccountCudBloc, FollowAccountCudState>(
        listener: (context, state) {
      if (state is FollowAccount_create_Loaded_State) {
        FollowAccount followAccount = FollowAccount(
            my_profile_fk: widget.my_profileId,
            other_profile_fk: widget.otherProfileId);
        BlocProvider.of<CheckIfFollowsCudBloc>(context)
            .add(CheckIfFollows_create_onButtonPressed_Event(followAccount));
      }
    }, builder: (context, state) {
      if (state is FollowAccount_create_Loading_State) {
        return pleaseWaitLoading_Button();
      } else if (state is FollowAccount_create_Error_State) {
        return followButton();
      } else if (state is FollowAccount_create_Loaded_State) {
        return Container();
      }
      return followButton();
    });
  }

  followButton() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
          onPressed: () {
            FollowAccount followAccount = FollowAccount(
                my_profile_fk: widget.my_profileId,
                other_profile_fk: widget.otherProfileId);
            BlocProvider.of<FollowAccountCudBloc>(context)
                .add(FollowAccount_create_onButtonPressed_Event(followAccount));
          },
          child: const Text(
            "Follow",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  pleaseWaitLoading_Button() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextButton(
            child: const Text(
              "Please wait ...",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey[200],
              backgroundColor: Colors.pink[600],
            ),
            onPressed: null));
  }

  errorChecking_Button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
          backgroundColor: Colors.pink[600],
        ),
        onPressed: null,
        child: const Text(
          "Error checking",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
