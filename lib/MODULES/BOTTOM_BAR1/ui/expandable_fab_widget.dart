import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/ui/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../CONSTANTS/image_paths.dart';

class ExpandableFabWidget extends StatelessWidget {
  const ExpandableFabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return fab(context);
  }

  fab(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, bottom: 10),
      child: ExpandableFab(
        // childrenOffset: Offset(4, 12),
        backgroundColor: Colors.black,
        collapsedFabSize: ExpandableFabSize.regular,
        expandedFabSize: ExpandableFabSize.regular,
        // key: key,
        // duration: const Duration(seconds: 1),
        distance: 180.0,
        type: ExpandableFabType.fan,
        onOpen: () {
          BlocProvider.of<ChipsCubit<GBottomBar>>(context).selectChip(2);
        },
        fanAngle: 90,
        child: const Icon(Icons.add),
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.green,
        closeButtonStyle: const ExpandableFabCloseButtonStyle(
          child: Icon(Icons.close),
          // foregroundColor: Colors.deepOrangeAccent,
          backgroundColor: Colors.black,
        ),
        overlayStyle: ExpandableFabOverlayStyle(
          // color: Colors.black.withOpacity(0.5),
          blur: 1,
        ),

        children: [
          //@
          ChipWidget<GCreatePostChips>(
              index: 0,
              activeWidget: CommonCircleChipChildWidget(
                  index: 0,
                  label: 'Song',
                  color1: const Color(0xffFE8DAF),
                  color2: const Color(0xffF6608D),
                  boxShadowColor: const Color(0xffFE8DAF).withOpacity(0.4),
                  iconPath: ImagePaths.songChipIcon),

              //
              nonActiveWidget: const CommonCircleChipChildWidget(
                  index: 0,
                  label: 'Song',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Color.fromARGB(255, 192, 192, 192),
                  iconPath: ImagePaths.songChipIconBlack)),

          //@
          ChipWidget<GCreatePostChips>(
            index: 1,
            activeWidget: CommonCircleChipChildWidget(
                index: 1,
                label: 'Movie',
                color1: const Color(0xff8FE5FC),
                color2: const Color(0xff47C7EB),
                boxShadowColor: const Color(0xff8FE5FC).withOpacity(0.4),
                iconPath: ImagePaths.movieChipIcon),
            nonActiveWidget: const CommonCircleChipChildWidget(
                index: 1,
                label: 'Movie',
                color1: Colors.white,
                color2: Colors.white,
                boxShadowColor: Color.fromARGB(255, 192, 192, 192),
                iconPath: ImagePaths.movieChipIconBlack),
          ),

          //
          const ChipWidget<GCreatePostChips>(
            index: 2,
            activeWidget: CommonCircleChipChildWidget(
                index: 2,
                label: 'Youtube',
                color1: Color(0xffFFD199),
                color2: Color(0xffFEB25A),
                boxShadowColor: Color.fromRGBO(255, 190, 113, 0.7),
                iconPath: ImagePaths.seriesChipIcon),
            nonActiveWidget: CommonCircleChipChildWidget(
                index: 2,
                label: 'Youtube',
                color1: Colors.white,
                color2: Colors.white,
                boxShadowColor: Color.fromARGB(255, 192, 192, 192),
                iconPath: ImagePaths.seriesChipIconBlack),
          ),

          //
          ChipWidget<GCreatePostChips>(
            index: 3,
            activeWidget: CommonCircleChipChildWidget(
                index: 3,
                label: 'Series',
                color1: const Color(0xff5FF8D5),
                color2: const Color(0xff33DCB4),
                boxShadowColor: const Color(0xff5FF8D5).withOpacity(0.4),
                iconPath: ImagePaths.youtubeChipIcon),
            nonActiveWidget: const CommonCircleChipChildWidget(
                index: 3,
                label: 'Series',
                color1: Colors.white,
                color2: Colors.white,
                boxShadowColor: Color.fromARGB(255, 192, 192, 192),
                iconPath: ImagePaths.youtubeChipIconBlack),
          ),
        ],
      ),
    );
  }
}

class CommonCircleChipChildWidget extends StatelessWidget {
  final int index;
  final String label;
  final Color color1;
  final Color color2;
  final Color boxShadowColor;
  final String iconPath;
  const CommonCircleChipChildWidget(
      {super.key,
      required this.index,
      required this.label,
      required this.color1,
      required this.color2,
      required this.boxShadowColor,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return singleChip(context);
  }

  singleChip(context) {
    return GestureDetector(
        onTap: () {
          BlocProvider.of<ChipsCubit<GCreatePostChips>>(context)
              .selectChip(index);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: boxShadowColor,
                blurRadius: 30,
                spreadRadius: 2,
                // offset: Offset(0, 20)
              ),
            ],
            gradient: LinearGradient(
              colors: [color1, color2],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(iconPath), fit: BoxFit.fill)),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(color: Colors.grey, fontSize: 8),
              ),
            ],
          ),
        ));
  }
}
