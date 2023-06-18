part of 'bottom_bar1_bloc.dart';

abstract class BottomBar1Event extends Equatable {
  const BottomBar1Event();

  @override
  List<Object> get props => [];
}

class BottomBar1CLickedEvent extends BottomBar1Event {
  final int index;
  const BottomBar1CLickedEvent(this.index);
  @override
  List<Object> get props => [index];
}
