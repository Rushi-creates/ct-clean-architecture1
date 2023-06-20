part of 'trend_selection_bloc.dart';

abstract class TrendSelectionEvent<T> extends Equatable {
  const TrendSelectionEvent();

  @override
  List<Object> get props => [];
}

class AddTrend_Event<T> extends TrendSelectionEvent<T> {
  final trend;

  AddTrend_Event(this.trend);
  @override
  List<Object> get props => [trend];
}

class RemoveTrend_Event<T> extends TrendSelectionEvent<T> {}
