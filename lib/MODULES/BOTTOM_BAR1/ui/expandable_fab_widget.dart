import 'package:ct_single_post/MODULES/BOTTOM_BAR1/bottom_bar1_logic/bottom_bar1_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/create_profile_chips/chips/create_post_chip_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

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
          BlocProvider.of<BottomBar1Bloc>(context)
              .add(const BottomBar1CLickedEvent(3));
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

        children: const [
          CreatePostSongChipWidget(),
          CreatePostMovieChipWidget(),
          CreatePostSeriesChipWidget(),
          CreatePostYoutubeChipWidget()
        ],
      ),
    );
  }
}
