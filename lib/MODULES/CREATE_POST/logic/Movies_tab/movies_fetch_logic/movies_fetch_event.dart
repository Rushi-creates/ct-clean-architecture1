part of 'movies_fetch_bloc.dart';

abstract class MoviesFetchEvent extends Equatable {
  const MoviesFetchEvent();

  @override
  List<Object> get props => [];
}

class Movies_SearchFetch_Event extends MoviesFetchEvent {
  final customSearch;

  Movies_SearchFetch_Event(this.customSearch);

  @override
  List<Object> get props => [customSearch];
}
