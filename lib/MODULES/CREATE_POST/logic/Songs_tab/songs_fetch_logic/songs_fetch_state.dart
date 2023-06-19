part of 'songs_fetch_bloc.dart';

abstract class SongsFetchState extends Equatable {
  const SongsFetchState();

  @override
  List<Object> get props => [];
}

class SongsFetchInitial extends SongsFetchState {}

class SongsFetch_Success_State extends SongsFetchState {
  final modelObjList;
  SongsFetch_Success_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class SongsFetch_Error_State extends SongsFetchState {
  final error;

  SongsFetch_Error_State(this.error);
  @override
  List<Object> get props => [error];
}

class SongsFetch_Loading_State extends SongsFetchState {}
