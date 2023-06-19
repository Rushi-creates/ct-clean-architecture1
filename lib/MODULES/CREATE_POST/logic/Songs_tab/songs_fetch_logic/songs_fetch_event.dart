part of 'songs_fetch_bloc.dart';

abstract class SongsFetchEvent extends Equatable {
  const SongsFetchEvent();

  @override
  List<Object> get props => [];
}

class Songs_SearchFetch_Event extends SongsFetchEvent {
  final customSearch;

  Songs_SearchFetch_Event(this.customSearch);

  @override
  List<Object> get props => [customSearch];
}
