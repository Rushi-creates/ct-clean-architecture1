part of 'youtube_fetch_bloc.dart';

abstract class YoutubeFetchState extends Equatable {
  const YoutubeFetchState();

  @override
  List<Object> get props => [];
}

class YoutubeFetchInitial extends YoutubeFetchState {}

class YoutubeFetch_Success_State extends YoutubeFetchState {
  final modelObjList;
  YoutubeFetch_Success_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class YoutubeFetch_Error_State extends YoutubeFetchState {
  final error;

  YoutubeFetch_Error_State(this.error);
  @override
  List<Object> get props => [error];
}

class YoutubeFetch_Loading_State extends YoutubeFetchState {}
