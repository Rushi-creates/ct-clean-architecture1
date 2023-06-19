part of 'trending_series_fetch_bloc.dart';

abstract class TrendingSeriesFetchEvent extends Equatable {
  const TrendingSeriesFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingSeries_Event extends TrendingSeriesFetchEvent {}
