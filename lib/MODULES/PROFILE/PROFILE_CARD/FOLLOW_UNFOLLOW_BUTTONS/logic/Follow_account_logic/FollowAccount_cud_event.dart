part of 'FollowAccount_cud_bloc.dart';

abstract class FollowAccountCudEvent extends Equatable {
  const FollowAccountCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class FollowAccount_create_onButtonPressed_Event extends FollowAccountCudEvent {
  final modelObjToAdd;
  FollowAccount_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class FollowAccount_Update_onButtonPressed_Event extends FollowAccountCudEvent {
  final modelObjToAdd;
  final modelObj_id;
  FollowAccount_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class FollowAccount_Delete_onButtonPressed_Event extends FollowAccountCudEvent {
  final modelObj_id;
  FollowAccount_Delete_onButtonPressed_Event(this.modelObj_id);
}
