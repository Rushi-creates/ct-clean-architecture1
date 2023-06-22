import 'package:ct_single_post/MODULES/COMMON/WIDGETS/loader_widget.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/create_profile_singleton.dart';
import 'package:ct_single_post/MODULES/ROLE_CHECKER/ui/role_checker_screen.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../SERIALIZERS/models/Profile.dart';
import '../create_profile_button_logic/create_profile_button_bloc.dart';

class CreatProfileButtonWidget extends StatelessWidget {
  const CreatProfileButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return buttonStates();
  }

  buttonStates() {
    return BlocConsumer<CreateProfileButtonBloc, CreateProfileButtonState>(
      listener: (context, state) async {
        //
        if (state is CreateProfileButtonSuccessState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RoleCheckerScreen();
          }));
        }
      },

      //
      builder: (context, state) {
        //

        if (state is CreateProfileButtonLoadingState) {
          return const LoaderWidget();

          //
        } else if (state is CreateProfileButtonErrorState) {
          return Column(
            children: [
              buttonUi(context),
              const SizedBox(height: 5),
              Text('${state.error}')
            ],
          );
        }

        //

        return buttonUi(context);
      },
    );
  }

  buttonUi(context) {
    var dimVar = MediaQuery.of(context).size;

    return SizedBox(
        width: dimVar.width * 0.85,
        height: dimVar.height * 0.065,
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          onPressed: () {
            if (CreateProfileSingleton.instance.createFormKey.currentState!
                .validate()) {
              Profile profileObj = Profile(
                p_uid: UserSpRepo.instance.getUser()!.id!,
                username:
                    CreateProfileSingleton.instance.usernameController.text,
                bio: CreateProfileSingleton.instance.bioController.text,
              );

              CreateProfileSingleton.instance.isFromProfileScreen
                  ? BlocProvider.of<CreateProfileButtonBloc>(context).add(
                      CreateProfileButtonClickedEvent(
                          isProfileUpdateEvent: true,
                          modelObjToAdd: profileObj))
                  : BlocProvider.of<CreateProfileButtonBloc>(context).add(
                      CreateProfileButtonClickedEvent(
                          isProfileUpdateEvent: false,
                          modelObjToAdd: profileObj));
            }
          },
          child: Text(
            CreateProfileSingleton.instance.isFromProfileScreen
                ? "UPDATE PROFILE"
                : "CONTINUE TO APP",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
