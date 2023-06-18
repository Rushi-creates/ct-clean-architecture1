part of 'chips_widget_bloc.dart';

abstract class ChipsWidgetEvent<T> extends Equatable {
  const ChipsWidgetEvent();

  @override
  List<Object> get props => [];
}

class ChipsCLickedEvent<T> extends ChipsWidgetEvent<T> {
  final int index;
  const ChipsCLickedEvent(this.index);
  @override
  List<Object> get props => [index];
}
