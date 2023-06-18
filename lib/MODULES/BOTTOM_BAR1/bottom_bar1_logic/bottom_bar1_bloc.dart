import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar1_event.dart';
part 'bottom_bar1_state.dart';

class BottomBar1Bloc extends Bloc<BottomBar1Event, BottomBar1State> {
  BottomBar1Bloc() : super(const BottomBar1TileSelectedState(0)) {
    //

    on<BottomBar1CLickedEvent>(
        (event, emit) => emit(BottomBar1TileSelectedState(event.index)));
  }
}
