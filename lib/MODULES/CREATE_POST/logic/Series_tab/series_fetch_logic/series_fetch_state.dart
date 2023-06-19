part of 'series_fetch_bloc.dart';

abstract class SeriesFetchState extends Equatable {
  const SeriesFetchState();

  @override
  List<Object> get props => [];
}

class SeriesFetchInitial extends SeriesFetchState {}

class SeriesFetch_Success_State extends SeriesFetchState {
  final modelObjList;
  SeriesFetch_Success_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class SeriesFetch_Error_State extends SeriesFetchState {
  final error;

  SeriesFetch_Error_State(this.error);
  @override
  List<Object> get props => [error];
}

class SeriesFetch_Loading_State extends SeriesFetchState {}
