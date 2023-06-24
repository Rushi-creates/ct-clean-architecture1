import '../ROLE_CHECKER/ui/role_checker_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // callBlocs();

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const RoleCheckerScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 0, 143),
      body: design(),
    );
  }

  design() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.white, size: 100),
          ),
          const Text(
            "Current Trends",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
