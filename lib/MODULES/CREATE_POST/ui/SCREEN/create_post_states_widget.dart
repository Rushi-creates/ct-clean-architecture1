import 'package:ct_single_post/CONSTANTS/generic_classes.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/create_post_trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../COMMON/WIDGETS/chips_widget/cubit/chips_cubit.dart';
import '../FORM/create_post_form_states_widget.dart';
import '../SEARCHBAR/create_post_searchbar_widget.dart';

class CreatePostStatesWidget extends StatelessWidget {
  const CreatePostStatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return formStates();
  }

//

  formStates() {
    return BlocBuilder<ChipsCubit<GCreatePostChips>, int?>(
        builder: (context, state) {
      if (state == 0) {
        return const CreatePostStatesDecorationWidget<GSong>();
      } else if (state == 1) {
        return const CreatePostStatesDecorationWidget<GMovie>();
      } else if (state == 2) {
        return const CreatePostStatesDecorationWidget<GYoutube>();
      } else if (state == 3) {
        return const CreatePostStatesDecorationWidget<GSeries>();
      }
      return const CreatePostStatesDecorationWidget<GSong>();
    });
  }
}

/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */

class CreatePostStatesDecorationWidget<T> extends StatelessWidget {
  const CreatePostStatesDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return formDecoration();
  }

  formDecoration() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(46, 57, 74, 0.06),
              blurRadius: 50,
              offset: Offset(0, -30))
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 10),

            //

            CreatePostSearchBarWidget<T>(),

            //

            CreatePostTrendingWidget<T>(),

            //
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                height: 30,
                color: Color.fromARGB(255, 230, 230, 230),
              ),
            ),

            //

            CreatePostFormStatesWidget<T>(),
          ],
        ),
      ),
    );
  }
}
