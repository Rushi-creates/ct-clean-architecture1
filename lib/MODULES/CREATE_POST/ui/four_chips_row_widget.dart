import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/ui/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../CONSTANTS/generic_classes.dart';
import '../../../CONSTANTS/image_paths.dart';

class FourChipsRowWidget extends StatelessWidget {
  const FourChipsRowWidget({super.key});

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
            ChipWidget<GCreatePostChips>(
                index: 0,
                activeWidget: singleButton(context,
                    index: 0,
                    label: 'Song',
                    color1: const Color(0xffFE8DAF),
                    color2: const Color(0xffF6608D),
                    boxShadowColor: const Color(0xffFE8DAF).withOpacity(0.4),
                    iconPath: ImagePaths.songChipIcon),

                //
                nonActiveWidget: singleButton(context,
                    index: 0,
                    label: 'Song',
                    color1: Colors.white,
                    color2: Colors.white,
                    boxShadowColor: Colors.transparent,
                    iconPath: ImagePaths.songChipIconBlack)),

            //@
            ChipWidget<GCreatePostChips>(
              index: 1,
              activeWidget: singleButton(context,
                  index: 1,
                  label: 'Movie',
                  color1: const Color(0xff8FE5FC),
                  color2: const Color(0xff47C7EB),
                  boxShadowColor: const Color(0xff8FE5FC).withOpacity(0.4),
                  iconPath: ImagePaths.movieChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 1,
                  label: 'Movie',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Colors.transparent,
                  iconPath: ImagePaths.movieChipIconBlack),
            ),

            //
            ChipWidget<GCreatePostChips>(
              index: 2,
              activeWidget: singleButton(context,
                  index: 2,
                  label: 'Series',
                  color1: Color(0xffFFD199),
                  color2: Color(0xffFEB25A),
                  boxShadowColor: Color.fromRGBO(255, 190, 113, 0.7),
                  iconPath: ImagePaths.seriesChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 2,
                  label: 'Series',
                  color1: Colors.white,
                  color2: Colors.white,
                  boxShadowColor: Colors.transparent,
                  iconPath: ImagePaths.seriesChipIconBlack),
            ),

            //
            ChipWidget<GCreatePostChips>(
              index: 3,
              activeWidget: singleButton(context,
                  index: 3,
                  label: 'Youtube',
                  color1: const Color(0xff5FF8D5),
                  color2: const Color(0xff33DCB4),
                  boxShadowColor: const Color(0xff5FF8D5).withOpacity(0.4),
                  iconPath: ImagePaths.youtubeChipIcon),
              nonActiveWidget: singleButton(context,
                  index: 3,
                  label: 'Youtube',
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
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        // widget.buttonCarouselController.jumpToPage(index);

        BlocProvider.of<ChipsCubit<GCreatePostChips>>(context)
            .selectChip(index);
      },
      child: CircleAvatar(
        radius: dimVar.width * 0.08,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: boxShadowColor,
                  blurRadius: 60,
                  offset: const Offset(0, 20)),
            ],
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(iconPath)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color1,
                color2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
