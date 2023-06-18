import 'package:ct_single_post/CONSTANTS/image_paths.dart';
import 'package:ct_single_post/MODULES/ROLE_CHECKER/ui/role_checker_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/register_button_logic/register_button_bloc.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        button(context),
        buttonStates(),
      ],
    );
  }

  buttonStates() {
    return BlocConsumer<RegisterButtonBloc, RegisterButtonState>(
      listener: (context, state) {
        if (state is RegisterButtonSuccesState) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const RoleCheckerScreen();
          }));
        }
      },
      builder: (context, state) {
        //

        if (state is RegisterButtonLoadingState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('please wait..',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          );

          //
        } else if (state is RegisterButtonErrorState) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Some Error Try again',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          );
        }

        //
        return const Text('');
      },
    );
  }

  button(context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<RegisterButtonBloc>(context)
            .add(RegisterButtonClickedEvent());
      },
      child: Container(
        height: 65,
        width: 380,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo

            SizedBox(
              height: 20,
              width: 20,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                        image: AssetImage(ImagePaths.googleLogo),
                        fit: BoxFit.fill)),
              ),
            ),

            //

            const SizedBox(width: 10),

            // text
            const Text(
              "Continue with google",
              style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xff1A1665),
                  fontWeight: FontWeight.w800),
            ),
          ],
        )),
      ),
    );
  }
}
