part of 'trending_songs_fetch_bloc.dart';

abstract class TrendingSongsFetchState extends Equatable {
  const TrendingSongsFetchState();

  @override
  List<Object> get props => [];
}

class TrendingSongsFetchInitial extends TrendingSongsFetchState {}

class TrendingSongsFetch_Success_State extends TrendingSongsFetchState {
  final trendSongsList;

  TrendingSongsFetch_Success_State(this.trendSongsList);

  @override
  List<Object> get props => [trendSongsList];
}

class TrendingSongsFetch_Error_State extends TrendingSongsFetchState {
  final error;

  TrendingSongsFetch_Error_State(this.error);

  @override
  List<Object> get props => [error];
}

class TrendingSongsFetch_Loading_State extends TrendingSongsFetchState {}
