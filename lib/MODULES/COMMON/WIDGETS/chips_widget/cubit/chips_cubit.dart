import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chips_state.dart';

class ChipsCubit<T> extends Cubit<int?> {
  ChipsCubit(int? initialValue) : super(initialValue);
  void selectChip(int index) {
    emit(index);
  }
}
