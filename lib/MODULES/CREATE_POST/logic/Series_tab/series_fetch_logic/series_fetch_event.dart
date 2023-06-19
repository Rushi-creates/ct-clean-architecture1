part of 'series_fetch_bloc.dart';

abstract class SeriesFetchEvent extends Equatable {
  const SeriesFetchEvent();

  @override
  List<Object> get props => [];
}

class Series_SearchFetch_Event extends SeriesFetchEvent {
  final customSearch;

  Series_SearchFetch_Event(this.customSearch);

  @override
  List<Object> get props => [customSearch];
}
