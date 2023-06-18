import 'package:ct_single_post/MODULES/CREATE_PROFILE/cubit/create_profile_cubit.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/ui/create_profile_button_widget.dart';
import 'package:ct_single_post/MODULES/CREATE_PROFILE/ui/create_profile_textfields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

/* -------------------------------------------------------------------------- */
/*                                  //! build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myHeader(context),
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Strucutre                               */
/* -------------------------------------------------------------------------- */

  myBody(context) {
    var dimVar = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: dimVar.height * 0.01),
          const SizedBox(height: 40),
          displayText(context),
          const SizedBox(height: 30),
          const CreateProfileTextFieldWidget(),
          const SizedBox(height: 5),
          const CreatProfileButtonWidget()
        ],
      ),
    ));
  }

/* -------------------------------------------------------------------------- */
/*                                 //! widgets                                */
/* -------------------------------------------------------------------------- */

  displayText(context) {
    return Text(
      BlocProvider.of<CreateProfileCubit>(context).state.isFromProfileScreen
          ? "UPDATE PROFILE"
          : "CREATE PROFILE",
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: const TextStyle(
          color: Colors.black,
          // decoration: TextDecoration.none,
          // fontStyle: FontStyle.italic,
          // fontFamily: "Rubik",
          fontWeight: FontWeight.bold,
          // fontWeight: FontWeight.w300,
          fontSize: 22),
    );
  }

  AppBar myHeader(context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,

        //# Condition if called from profile screen
        leading: BlocProvider.of<CreateProfileCubit>(context)
                .state
                .isFromProfileScreen
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
            : Container());
  }
}
