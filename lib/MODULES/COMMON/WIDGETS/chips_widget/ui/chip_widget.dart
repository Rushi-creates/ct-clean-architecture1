import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chips_cubit.dart';

class ChipWidget<T> extends StatelessWidget {
  final int index;
  final Widget? activeWidget;
  final Widget nonActiveWidget;

  const ChipWidget({
    super.key,
    required this.index,
    this.activeWidget,
    required this.nonActiveWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChipsCubit<T>, int?>(
      builder: (context, selectedIndex) {
        final isSelected = index == selectedIndex;
        return GestureDetector(
          onTap: () {
            if (!isSelected) {
              BlocProvider.of<ChipsCubit<T>>(context).selectChip(index);
            }
          },
          child:
              //
              activeWidget == null
                  ? nonActiveWidget
                  :
                  //
                  isSelected
                      ? activeWidget
                      : nonActiveWidget,
        );
      },
    );
  }
}
