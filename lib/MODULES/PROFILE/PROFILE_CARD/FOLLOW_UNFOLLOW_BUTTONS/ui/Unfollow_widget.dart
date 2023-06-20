import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../SERIALIZERS/models/follow_account.dart';
import '../logic/Check_if_follows_logic/CheckIfFollows_cud_bloc.dart';
import '../logic/Follow_account_logic/FollowAccount_cud_bloc.dart';

class Unfollow_widget extends StatefulWidget {
  final my_profileId;
  final otherProfileId;
  const Unfollow_widget({
    required this.my_profileId,
    required this.otherProfileId,
  });

  @override
  _Unfollow_widgetState createState() => _Unfollow_widgetState();
}

class _Unfollow_widgetState extends State<Unfollow_widget> {
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
        print(state);
        if (state is CheckIfFollows_create_Loading_State) {
          return pleaseWaitLoading_Button();
        } else if (state is CheckIfFollows_create_Error_State) {
          return errorChecking_Button();
        } else if (state is CheckIfFollows_create_Follows_State) {
          return unFollowButton_STATES(state.id);
        }

        return Container();
      },
    );
  }

  unFollowButton_STATES(id) {
    return BlocConsumer<FollowAccountCudBloc, FollowAccountCudState>(
      listener: (context, state) {
        if (state is FollowAccount_Delete_Loaded_state) {
          FollowAccount followAccount = FollowAccount(
              my_profile_fk: widget.my_profileId,
              other_profile_fk: widget.otherProfileId);
          BlocProvider.of<CheckIfFollowsCudBloc>(context)
              .add(CheckIfFollows_create_onButtonPressed_Event(followAccount));
        }
      },
      builder: (context, state) {
        if (state is FollowAccount_Delete_Loading_state) {
          return pleaseWaitLoading_Button();
        } else if (state is FollowAccount_Delete_Error_State) {
          return UNfollowButton(id);
        } else if (state is FollowAccount_Delete_Loaded_state) {
          return Container();
        }
        return UNfollowButton(id);
      },
    );
  }

  UNfollowButton(modelObj_id) {
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
            BlocProvider.of<FollowAccountCudBloc>(context)
                .add(FollowAccount_Delete_onButtonPressed_Event(modelObj_id));
          },
          child: Text(
            "Unfollow",
            style: TextStyle(color: Colors.blue[600]),
          ),
        ));
  }

  pleaseWaitLoading_Button() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: TextButton(
            style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey[200],
              backgroundColor: Colors.pink[600],
            ),
            onPressed: null,
            child: const Text(
              "Please wait ...",
              style: TextStyle(color: Colors.white),
            )));
  }

  errorChecking_Button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: TextButton(
        style: TextButton.styleFrom(
          disabledBackgroundColor: Colors.grey[200],
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
