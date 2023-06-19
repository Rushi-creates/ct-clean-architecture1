part of 'trending_youtube_fetch_bloc.dart';

abstract class TrendingYoutubeFetchState extends Equatable {
  const TrendingYoutubeFetchState();

  @override
  List<Object> get props => [];
}

class TrendingYoutubeFetchInitial extends TrendingYoutubeFetchState {}

class TrendingYoutubeFetch_Success_State extends TrendingYoutubeFetchState {
  final trendYoutubeList;

  TrendingYoutubeFetch_Success_State(this.trendYoutubeList);

  @override
  List<Object> get props => [trendYoutubeList];
}

class TrendingYoutubeFetch_Error_State extends TrendingYoutubeFetchState {
  final error;

  TrendingYoutubeFetch_Error_State(this.error);

  @override
  List<Object> get props => [error];
}

class TrendingYoutubeFetch_Loading_State extends TrendingYoutubeFetchState {}
