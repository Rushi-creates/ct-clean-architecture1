import 'package:carousel_slider/carousel_slider.dart';
import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common_create_post_form_widget.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return carouselDecoration(context);
  }

/* -------------------------------------------------------------------------- */
/*                                 //! Widgets                                */
/* -------------------------------------------------------------------------- */

  carouselDecoration(context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(46, 57, 74, 0.06),
            blurRadius: 50,
            offset: Offset(0, -30))
      ]),
      child: carousel(context),
    );
  }

  carousel(context) {
    return CarouselSlider(
      // carouselController: BlocProvider.of<CreatePostCubit>(context)
      //     .state
      //     .buttonCarouselController,
      options: CarouselOptions(
        viewportFraction: 1,
        pageSnapping: true,
        height: MediaQuery.of(context).size.height * 0.75,
        aspectRatio: 16 / 9,
        enlargeCenterPage: true,
        enlargeFactor: 0.15,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,

        //
        onPageChanged: ((index, reason) {
          BlocProvider.of<ChipsCubit<GCreatePostChips>>(context)
              .selectChip(index);
        }),
      ),

//
      items: const [
        CommonCreatePostFormWidget<GSong>(),
        CommonCreatePostFormWidget<GMovie>(),
        CommonCreatePostFormWidget<GYoutube>(),
        CommonCreatePostFormWidget<GSeries>(),
      ],
    );
  }
}
