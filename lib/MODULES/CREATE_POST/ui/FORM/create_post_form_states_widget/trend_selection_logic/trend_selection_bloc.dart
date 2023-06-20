import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trend_selection_event.dart';
part 'trend_selection_state.dart';

class TrendSelectionBloc<T>
    extends Bloc<TrendSelectionEvent<T>, TrendSelectionState<T>> {
  TrendSelectionBloc() : super(TrendRemoved_State<T>()) {
/* -------------------------------------------------------------------------- */
/*                                     //!                                    */
/* -------------------------------------------------------------------------- */
    on<AddTrend_Event<T>>(
        (event, emit) => emit(TrendAdded_State<T>(event.trend)));
    on<RemoveTrend_Event<T>>((event, emit) => emit(TrendRemoved_State<T>()));
  }
}
