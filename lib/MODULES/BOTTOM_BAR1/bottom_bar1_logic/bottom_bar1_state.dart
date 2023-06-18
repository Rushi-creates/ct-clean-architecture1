part of 'bottom_bar1_bloc.dart';

abstract class BottomBar1State extends Equatable {
  const BottomBar1State();

  @override
  List<Object> get props => [];
}

class BottomBar1TileSelectedState extends BottomBar1State {
  final int index;
  const BottomBar1TileSelectedState(this.index);
  @override
  List<Object> get props => [index];
}
