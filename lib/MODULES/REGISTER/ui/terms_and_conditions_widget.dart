import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return termsAndCondition();
  }

  termsAndCondition() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tncText(),
        Row(
          children: [
            tncLink(),
            tncAndText(),
            privacyPolicyLink(),
          ],
        )
      ],
    );
  }

  tncText() {
    return const Text(
      'By creating an account, you agree to our',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        fontWeight: FontWeight.w500,
        // fontWeight: FontWeight.w300,
        fontSize: 14.0,
      ),
    );
  }

  tncAndText() {
    return const Text(
      ' and ',
      // maxLines: 2,
      // overflow: TextOverflow.ellipsis,
      // textAlign: TextAlign.center,
      style: TextStyle(
        color: Color.fromARGB(255, 158, 149, 204),
        // decoration: TextDecoration.none,
        // fontStyle: FontStyle.italic,
        // fontFamily: "FontNameHere" ,
        // fontWeight: FontWeight.bold,
        fontWeight: FontWeight.w500,
        fontSize: 14.0,
      ),
    );
  }

  tncLink() {
    return InkWell(
      onTap: () => launchUrl(Uri.parse('https://www.google.com')),
      child: const Text('Terms of Use',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromARGB(255, 158, 149, 204),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  privacyPolicyLink() {
    return InkWell(
      onTap: () => launchUrl(Uri.parse('https://www.google.com')),
      child: const Text('Privacy Policy',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color.fromARGB(255, 158, 149, 204),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          )),
    );
  }
}
