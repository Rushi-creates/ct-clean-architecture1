import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chips_widget_event.dart';
part 'chips_widget_state.dart';

class ChipsWidgetBloc<T>
    extends Bloc<ChipsWidgetEvent<T>, ChipsWidgetState<T>> {
  ChipsWidgetBloc() : super(ChipSelectedState<T>(0)) {
    //

    // @override
    // bool? buildWhen(previous, current) {
    //   return current.counter % 5 == 0;
    // }

    on<ChipsCLickedEvent<T>>((event, emit) {
      // emit(ChipUiResetState<T>());
      emit(ChipSelectedState<T>(event.index));
    });
  }
}
