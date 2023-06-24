import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Messaging')),
    );
  }

//   design(context) {
//     return SizedBox(
//         height: MediaQuery.of(context).size.height * 0.07,
//         child: Container(
//           decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 7,
//                   offset: const Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(8),
//               gradient: const LinearGradient(
//                   colors: [Colors.white, Colors.white],
//                   end: Alignment.topCenter,
//                   begin: Alignment.bottomCenter)),
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //

//                 const VerticalDivider(width: 40, color: Colors.white),

// //
//                 ChipWidget<GBottomBar>(
//                     index: 0,
//                     activeWidget: activeWidget(ImagePaths.home_on_icon, 'Home'),
//                     nonActiveWidget: nonActiveWidget(ImagePaths.home_off_icon)),
//                 const VerticalDivider(color: Colors.white, width: 40),

// //

//                 ChipWidget<GBottomBar>(
//                     index: 1,
//                     activeWidget:
//                         activeWidget(ImagePaths.profile_on_icon, 'Profile'),
//                     nonActiveWidget:
//                         nonActiveWidget(ImagePaths.profile_off_icon)),
//                 const VerticalDivider(color: Colors.white, width: 40),

// //

//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Icon(Icons.home, color: Colors.transparent),
//                 )
//               ]),
//         ));
//   }

//   Widget nonActiveWidget(String imagePath) {
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//         image: AssetImage(imagePath),
//       )),
//     );
//   }

//   Widget activeWidget(String imagePath, String label) {
//     return Row(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               image: DecorationImage(
//             image: AssetImage(imagePath),
//           )),
//         ),
//         Text(label),
//       ],
//     );
//   }
}
