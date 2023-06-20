part of 'MyPost_cud_bloc.dart';

abstract class MyPostCudState extends Equatable {
  const MyPostCudState();

  @override
  List<Object> get props => [];
}

class MyPostCudInitial extends MyPostCudState {}

//! create

class MyPost_create_Loading_State extends MyPostCudState {}

class MyPost_create_Loaded_State extends MyPostCudState {}

class MyPost_create_Error_State extends MyPostCudState {
  final error;
  MyPost_create_Error_State(this.error);
}

//! update

class MyPost_update_Loading_State extends MyPostCudState {}

class MyPost_update_Loaded_State extends MyPostCudState {}

class MyPost_update_Error_State extends MyPostCudState {
  final error;
  MyPost_update_Error_State(this.error);
}

//! delete
class MyPost_Delete_Loading_state extends MyPostCudState {} //loading

class MyPost_Delete_Loaded_state extends MyPostCudState {} //loaded

class MyPost_Delete_Error_State extends MyPostCudState {
  final error;
  MyPost_Delete_Error_State(this.error);
}
