part of 'MyPost_cud_bloc.dart';

abstract class MyPostCudEvent extends Equatable {
  const MyPostCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class MyPost_create_onButtonPressed_Event extends MyPostCudEvent {
  final modelObjToAdd;
  MyPost_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class MyPost_Update_onButtonPressed_Event extends MyPostCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  MyPost_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class MyPost_Delete_onButtonPressed_Event extends MyPostCudEvent {
  final modelObj_id;
  MyPost_Delete_onButtonPressed_Event(this.modelObj_id);
}
