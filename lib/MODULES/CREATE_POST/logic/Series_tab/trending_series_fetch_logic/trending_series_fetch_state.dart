part of 'trending_series_fetch_bloc.dart';

abstract class TrendingSeriesFetchState extends Equatable {
  const TrendingSeriesFetchState();

  @override
  List<Object> get props => [];
}

class TrendingSeriesFetchInitial extends TrendingSeriesFetchState {}

class TrendingSeriesFetch_Success_State extends TrendingSeriesFetchState {
  final trendSeriesList;

  const TrendingSeriesFetch_Success_State(this.trendSeriesList);

  @override
  List<Object> get props => [trendSeriesList];
}

class TrendingSeriesFetch_Error_State extends TrendingSeriesFetchState {
  final error;

  const TrendingSeriesFetch_Error_State(this.error);

  @override
  List<Object> get props => [error];
}

class TrendingSeriesFetch_Loading_State extends TrendingSeriesFetchState {}
