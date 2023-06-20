import 'package:flutter/material.dart';

class ProfileFollowersCountWidget extends StatelessWidget {
  final String count;
  final String label;
  final double fontSize;
  final Color fontColor;
  const ProfileFollowersCountWidget({
    super.key,
    required this.count,
    required this.label,
    this.fontSize = 13.0,
    this.fontColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return displayFollowingCount();
  }

  displayFollowingCount() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            count,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: fontColor,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: fontSize,
            ),
          ),
          Text(
            label,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: fontColor,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              // fontSize: 20.0,
              fontSize: fontSize,
            ),
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
