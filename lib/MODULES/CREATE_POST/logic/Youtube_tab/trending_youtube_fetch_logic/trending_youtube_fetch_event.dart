part of 'trending_youtube_fetch_bloc.dart';

abstract class TrendingYoutubeFetchEvent extends Equatable {
  const TrendingYoutubeFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingYoutube_Event extends TrendingYoutubeFetchEvent {}
