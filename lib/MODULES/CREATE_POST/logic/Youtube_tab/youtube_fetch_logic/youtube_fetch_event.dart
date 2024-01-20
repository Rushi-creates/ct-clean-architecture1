part of 'youtube_fetch_bloc.dart';

abstract class YoutubeFetchEvent extends Equatable {
  const YoutubeFetchEvent();

  @override
  List<Object> get props => [];
}

class Youtube_SearchFetch_Event extends YoutubeFetchEvent {
  final customSearch;

  const Youtube_SearchFetch_Event(this.customSearch);

  @override
  List<Object> get props => [customSearch];
}
