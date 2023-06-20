part of 'FollowAccount_cud_bloc.dart';

abstract class FollowAccountCudState extends Equatable {
  const FollowAccountCudState();

  @override
  List<Object> get props => [];
}

class FollowAccountCudInitial extends FollowAccountCudState {}

//! create

class FollowAccount_create_Loading_State extends FollowAccountCudState {}

class FollowAccount_create_Loaded_State extends FollowAccountCudState {}

class FollowAccount_create_Error_State extends FollowAccountCudState {
  final error;
  FollowAccount_create_Error_State(this.error);
}

// //! update

// class FollowAccount_update_Loading_State extends FollowAccountCudState {}

// class FollowAccount_update_Loaded_State extends FollowAccountCudState {}

// class FollowAccount_update_Error_State extends FollowAccountCudState {
//   final error;
//   FollowAccount_update_Error_State(this.error);
// }

//! delete
class FollowAccount_Delete_Loading_state
    extends FollowAccountCudState {} //loading

class FollowAccount_Delete_Loaded_state
    extends FollowAccountCudState {} //loaded

class FollowAccount_Delete_Error_State extends FollowAccountCudState {
  final error;
  FollowAccount_Delete_Error_State(this.error);
}
