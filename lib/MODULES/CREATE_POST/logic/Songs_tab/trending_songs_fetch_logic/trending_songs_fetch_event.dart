part of 'trending_songs_fetch_bloc.dart';

abstract class TrendingSongsFetchEvent extends Equatable {
  const TrendingSongsFetchEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingSongs_Event extends TrendingSongsFetchEvent {}
