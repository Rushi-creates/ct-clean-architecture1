import 'package:flutter/material.dart';

class CommonCreatePostFormWidget<T> extends StatelessWidget {
  const CommonCreatePostFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return formDecoration();
  }

  formDecoration() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        color: Colors.white,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
