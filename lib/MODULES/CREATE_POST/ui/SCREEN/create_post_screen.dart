import 'package:ct_single_post/MODULES/CREATE_POST/ui/SCREEN/create_post_states_widget.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/four_chips_row_widget.dart';
import 'package:flutter/material.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(context),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                //! Structure                               */
/* -------------------------------------------------------------------------- */

  myBody(context) {
    return GestureDetector(
      onTap: () {
        print('focus shifted');
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const FourChipsRowWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const CreatePostStatesWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
          ],
        ),
      )),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! widget                                 */
/* -------------------------------------------------------------------------- */

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: const Column(
        children: [
          Text(
            'Create Your Trend', //give here appBar title
            style: TextStyle(
              color: Color(0xff342E44),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          // headerDescription()
        ],
      ),
    );
  }
}
