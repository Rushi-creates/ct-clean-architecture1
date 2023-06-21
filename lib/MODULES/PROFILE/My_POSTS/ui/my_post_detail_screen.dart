import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//to change class name = right click on className> Rename symbol
class MyPostDetailScreen extends StatefulWidget {
  final imageUrl;
  final title;
  final description;
  const MyPostDetailScreen({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  _MyPostDetailScreenState createState() => _MyPostDetailScreenState();
}

class _MyPostDetailScreenState extends State<MyPostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody(),
    );
  }

  myBody() {
    return SafeArea(child: alertDialogBody());
  }

  alertDialogBody() {
    return SizedBox(
      // height: dimVar.height * 0.54,
      // width: dimVar.width * 0.8,
      // child: SingleChildScrollView(
      //   physics: ClampingScrollPhysics(),
      child: Column(
        // direction: Axis.vertical,
        // mainAxisSize: MainAxisSize.min,
        children: [
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SizedBox(
              // height: MyComponents.screenSize(context).height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  // color: Colors.grey,
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 0.24),
            child: Text(
              widget.title,
              style: TextStyle(
                color: Color(0xff2E394A),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              // overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 10, bottom: 0.24),
            child: Text(
              widget.description,
              style: TextStyle(
                color: Color.fromARGB(255, 82, 89, 100),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
              // overflow: TextOverflow.fade,
              maxLines: 2,
            ),
          ),
          // displaySelected_custom(),
        ],
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'About', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // ],
    );
  }
}
