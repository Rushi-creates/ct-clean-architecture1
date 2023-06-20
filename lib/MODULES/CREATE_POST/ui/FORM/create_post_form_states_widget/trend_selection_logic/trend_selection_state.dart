part of 'trend_selection_bloc.dart';

abstract class TrendSelectionState<T> extends Equatable {
  const TrendSelectionState();

  @override
  List<Object> get props => [];
}

class TrendAdded_State<T> extends TrendSelectionState<T> {
  final trend;

  TrendAdded_State(this.trend);
  @override
  List<Object> get props => [trend];
}

class TrendRemoved_State<T> extends TrendSelectionState<T> {}
