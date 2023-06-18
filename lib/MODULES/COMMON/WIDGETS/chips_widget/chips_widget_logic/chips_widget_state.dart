part of 'chips_widget_bloc.dart';

abstract class ChipsWidgetState<T> extends Equatable {
  const ChipsWidgetState();

  @override
  List<Object> get props => [];
}

// class ChipUiResetState<T> extends ChipsWidgetState<T> {}

class ChipSelectedState<T> extends ChipsWidgetState<T> {
  final int index;
  const ChipSelectedState(this.index);
  @override
  List<Object> get props => [index];
}
