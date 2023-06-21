import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/ui/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../CONSTANTS/image_paths.dart';

class MyPostsChipsRowWidget extends StatelessWidget {
  const MyPostsChipsRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return rowButton(context);
  }

  rowButton(context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //@
            ChipWidget<GMyPostsChips>(
                index: 0,
                activeWidget: singleButton(context,
                    index: 0,
                    label: 'All',
                    color1: const Color(0xFF777777),
                    color2: const Color(0xFF292929),
                    boxShadowColor:
                        Color.fromARGB(255, 129, 129, 129).withOpacity(0.4),
                    iconPath: ImagePaths.seriesChipIcon),

                //
                nonActiveWidget: singleButton(context,
                    index: 0,
                    label: 'All',
                    color1: Colors.white,
                    color2: Colors.white,
                    boxShadowColor: Colors.transparent,
                    iconPath: ImagePaths.seriesChipIconBlack)),

            //@
            ChipWidget<GMyPostsChips>(
                index: 1,
                activeWidget: singleButton(context,
                    index: 1,
                    label: 'Song',
                    color1: const Color(0xffFE8DAF),
                    color2: const Color(0xffF6608D),
                    boxShadowColor: const Color(0xffFE8DAF).withOpacity(0.4),
                    iconPath: ImagePaths.songChipIcon),

                //
                nonActiveWidget: singleButton(context,
                    index: 1,
                    label: 'Song',
                    color1: Colors.white,
                    color2: Colors.white,
                    boxShadowColor: Colors.transparent,
                    iconPath: ImagePaths.songChipIconBlack)),

            //@
            ChipWidget<GMyPostsChips>(
              index: 2,
              activeWidget: singleButton(context,
                  index: 2,
                  label: 'Movie',
                  color1: const Color(0xff8FE5FC),
                  color2: const Color(0xff47C7EB),
                  boxShadowColor: const Color(0xff8FE5FC).withOpacity(0.4),
                  iconPath: ImagePaths.movieChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 2,
                  label: 'Movie',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Colors.transparent,
                  iconPath: ImagePaths.movieChipIconBlack),
            ),

            //
            ChipWidget<GMyPostsChips>(
              index: 3,
              activeWidget: singleButton(context,
                  index: 3,
                  label: 'Youtube',
                  color1: const Color(0xffFFD199),
                  color2: const Color(0xffFEB25A),
                  boxShadowColor: const Color.fromRGBO(255, 190, 113, 0.7),
                  iconPath: ImagePaths.seriesChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 3,
                  label: 'Youtube',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Colors.transparent,
                  iconPath: ImagePaths.seriesChipIconBlack),
            ),

            //
            ChipWidget<GMyPostsChips>(
              index: 4,
              activeWidget: singleButton(context,
                  index: 4,
                  label: 'Series',
                  color1: const Color(0xff5FF8D5),
                  color2: const Color(0xff33DCB4),
                  boxShadowColor: const Color(0xff5FF8D5).withOpacity(0.4),
                  iconPath: ImagePaths.youtubeChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 4,
                  label: 'Series',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Colors.transparent,
                  iconPath: ImagePaths.youtubeChipIconBlack),
            ),
          ],
        ));
  }

  singleButton(
    context, {
    required int index,
    required String label,
    required Color color1,
    required Color color2,
    required Color boxShadowColor,
    required String iconPath,
    // MyChips2Event eventArg,
  }) {
    // var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () {
          // widget.buttonCarouselController.jumpToPage(index);

          BlocProvider.of<ChipsCubit<GMyPostsChips>>(context).selectChip(index);
        },
        child: SizedBox(
          width: 60,
          height: 30,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: boxShadowColor,
                    blurRadius: 60,
                    offset: const Offset(0, 20)),
              ],
              // shape: BoxShape.rectangle,
              // image: DecorationImage(image: AssetImage(icon)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color1,
                  color2,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FittedBox(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: SizedBox(
                //       // height: dimVar.height * 0.3,
                //       // width: dimVar.width * 0.05,
                //       child: Container(
                //         decoration: BoxDecoration(
                //             shape: BoxShape.rectangle,
                //             image: DecorationImage(
                //                 image: AssetImage(icon), fit: BoxFit.fill)),
                //       ),
                //     ),
                //   ),
                // ),
                Text(
                  label,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ));

    //    CircleAvatar(
    //     radius: dimVar.width * 0.08,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         boxShadow: [
    //           BoxShadow(
    //               color: boxShadowColor,
    //               blurRadius: 60,
    //               offset: const Offset(0, 20)),
    //         ],
    //         shape: BoxShape.circle,
    //         image: DecorationImage(image: AssetImage(iconPath)),
    //         gradient: LinearGradient(
    //           begin: Alignment.topCenter,
    //           end: Alignment.bottomCenter,
    //           colors: [
    //             color1,
    //             color2,
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),

    // );
  }
}
