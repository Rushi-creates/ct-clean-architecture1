part of 'CheckIfFollows_cud_bloc.dart';

abstract class CheckIfFollowsCudState extends Equatable {
  const CheckIfFollowsCudState();

  @override
  List<Object> get props => [];
}

class CheckIfFollowsCudInitial extends CheckIfFollowsCudState {}

//! create

class CheckIfFollows_create_Loading_State extends CheckIfFollowsCudState {}

class CheckIfFollows_create_Follows_State extends CheckIfFollowsCudState {
  final id;

  CheckIfFollows_create_Follows_State(this.id);

  @override
  List<Object> get props => [id];
}

class CheckIfFollows_create_DoesNotFollows_State
    extends CheckIfFollowsCudState {}

class CheckIfFollows_create_Error_State extends CheckIfFollowsCudState {
  final error;
  CheckIfFollows_create_Error_State(this.error);
}

// //! update

// class CheckIfFollows_update_Loading_State extends CheckIfFollowsCudState {}

// class CheckIfFollows_update_Loaded_State extends CheckIfFollowsCudState {}

// class CheckIfFollows_update_Error_State extends CheckIfFollowsCudState {
//   final error;
//   CheckIfFollows_update_Error_State(this.error);
// }

// //! delete
// class CheckIfFollows_Delete_Loading_state extends CheckIfFollowsCudState {} //loading

// class CheckIfFollows_Delete_Loaded_state extends CheckIfFollowsCudState {} //loaded

// class CheckIfFollows_Delete_Error_State extends CheckIfFollowsCudState {
//   final error;
//   CheckIfFollows_Delete_Error_State(this.error);
// }
