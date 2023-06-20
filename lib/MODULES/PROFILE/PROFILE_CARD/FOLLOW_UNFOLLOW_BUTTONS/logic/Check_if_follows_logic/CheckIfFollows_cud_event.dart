part of 'CheckIfFollows_cud_bloc.dart';

abstract class CheckIfFollowsCudEvent extends Equatable {
  const CheckIfFollowsCudEvent();

  @override
  List<Object> get props => [];
}

//! create

class CheckIfFollows_create_onButtonPressed_Event
    extends CheckIfFollowsCudEvent {
  final modelObjToAdd;
  CheckIfFollows_create_onButtonPressed_Event(this.modelObjToAdd);
}

// //!  update
// class CheckIfFollows_Update_onButtonPressed_Event extends CheckIfFollowsCudEvent {
//   final modelObjToAdd;
//   final modelObj_id;
//   CheckIfFollows_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
// }

// //!  delete
// class CheckIfFollows_Delete_onButtonPressed_Event extends CheckIfFollowsCudEvent {
//   final modelObj_id;
//   CheckIfFollows_Delete_onButtonPressed_Event(this.modelObj_id);
// }
