part of 'trending_movies_fetch_bloc.dart';

abstract class TrendingMoviesFetchState extends Equatable {
  const TrendingMoviesFetchState();

  @override
  List<Object> get props => [];
}

class TrendingMoviesFetchInitial extends TrendingMoviesFetchState {}

class TrendingMoviesFetch_Success_State extends TrendingMoviesFetchState {
  final trendMovieList;

  TrendingMoviesFetch_Success_State(this.trendMovieList);

  @override
  List<Object> get props => [trendMovieList];
}

class TrendingMoviesFetch_Error_State extends TrendingMoviesFetchState {
  final error;

  TrendingMoviesFetch_Error_State(this.error);

  @override
  List<Object> get props => [error];
}

class TrendingMoviesFetch_Loading_State extends TrendingMoviesFetchState {}
