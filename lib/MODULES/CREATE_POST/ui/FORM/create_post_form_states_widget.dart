import 'package:ct_single_post/MODULES/CREATE_POST/logic/trend_selection_logic/trend_selection_bloc.dart';
import 'package:ct_single_post/MODULES/CREATE_POST/ui/FORM/create_post_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../CONSTANTS/generic_classes.dart';

class CreatePostFormStatesWidget<T> extends StatelessWidget {
  const CreatePostFormStatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return displayTrendStates();
  }

/* -------------------------------------------------------------------------- */
/*                                 //! States                                 */
/* -------------------------------------------------------------------------- */

  displayTrendStates() {
    return BlocBuilder<TrendSelectionBloc<T>, TrendSelectionState<T>>(
      builder: (context, state) {
        if (state is TrendAdded_State<T>) {
          return CreatePostFormWidget<T>(trend: state.trend);
        } else if (state is TrendRemoved_State<T>) {
          return nothingSelectedYetImage();
        }
        return nothingSelectedYetImage();
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //! widgets                                */
/* -------------------------------------------------------------------------- */

  nothingSelectedYetImage() {
    final String trendName = (T == GSong)
        ? 'song'
        : (T == GMovie)
            ? 'movie'
            : (T == GYoutube)
                ? 'youtube video'
                : (T == GSeries)
                    ? 'series'
                    : 'song';

    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Icon(
            Icons.photo_size_select_actual_rounded,
            size: 220,
            color: Colors.grey[200],
          ),
          Text(
            'No $trendName selected yet',
            style: TextStyle(color: Colors.grey[200], fontSize: 15),
          ),
        ],
      ),
    );
  }
}
