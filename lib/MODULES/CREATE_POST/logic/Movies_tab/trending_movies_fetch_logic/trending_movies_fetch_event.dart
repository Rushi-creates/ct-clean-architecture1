part of 'trending_movies_fetch_bloc.dart';

abstract class TrendingMoviesFetchEvent extends Equatable {
  const TrendingMoviesFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingMovies_Event extends TrendingMoviesFetchEvent {}
