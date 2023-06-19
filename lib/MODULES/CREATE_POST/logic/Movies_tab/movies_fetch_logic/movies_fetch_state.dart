part of 'movies_fetch_bloc.dart';

abstract class MoviesFetchState extends Equatable {
  const MoviesFetchState();

  @override
  List<Object> get props => [];
}

class MoviesFetchInitial extends MoviesFetchState {}

class MoviesFetch_Success_State extends MoviesFetchState {
  final modelObjList;
  MoviesFetch_Success_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class MoviesFetch_Error_State extends MoviesFetchState {
  final error;

  MoviesFetch_Error_State(this.error);
  @override
  List<Object> get props => [error];
}

class MoviesFetch_Loading_State extends MoviesFetchState {}
