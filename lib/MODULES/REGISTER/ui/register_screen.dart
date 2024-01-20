import 'package:ct_single_post/CONSTANTS/app_colors.dart';
import 'package:ct_single_post/CONSTANTS/image_paths.dart';
import 'package:ct_single_post/MODULES/REGISTER/ui/register_button_widget.dart';
import 'package:ct_single_post/MODULES/REGISTER/ui/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

/* -------------------------------------------------------------------------- */
/*                                  //! build                                 */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      body: myBody(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Strucutre                               */
/* -------------------------------------------------------------------------- */

  myBody(context) {
    return myBg(
        child:
            //

            Flex(
      direction: Axis.vertical,
      children: [
        Flexible(flex: 5, child: peopleCardImageWidget(context)),

        //
        Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  welcomeToAppText(),
                  const SizedBox(height: 10),
                  welcomeDescriptionText(),
                  const SizedBox(height: 75),
                  const RegisterButtonWidget(),
                  const TermsAndConditionsWidget()
                ],
              ),
            ))
      ],
    ));
  }

/* -------------------------------------------------------------------------- */
/*                                 //! states                                 */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                                 //! widgets                                */
/* -------------------------------------------------------------------------- */

  myBg({required Widget child}) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.registerBg1, AppColors.registerBg2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: child);
  }

  peopleCardImageWidget(context) {
    return SizedBox(
      width: double.infinity,
      // height: dimVar.height * 0.55,
      child: Container(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
                image: AssetImage(ImagePaths.peopleCards), fit: BoxFit.fill)),
      ),
    );
  }

  welcomeToAppText() {
    return const Text(
      'Welcome\nto Trendz',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        height: 1.0,
        color: Colors.white,
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        fontFamily: "Poppins",
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w600,
        fontSize: 55.0,
      ),
    );
  }

  welcomeDescriptionText() {
    return const Text(
      'Find what your friends are upto.\n'
      'Know their weekly content consumpution.',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w600,
        fontSize: 14.0,
      ),
    );
  }
}
