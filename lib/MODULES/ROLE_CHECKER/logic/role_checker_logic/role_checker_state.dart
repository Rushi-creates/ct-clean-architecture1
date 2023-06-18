part of 'role_checker_bloc.dart';

abstract class RoleCheckerState extends Equatable {
  const RoleCheckerState();

  @override
  List<Object> get props => [];
}

class RoleCheckerInitial extends RoleCheckerState {}

//
class RolesInitial extends RoleCheckerState {}

class RoleLoadingState extends RoleCheckerState {}

class RoleErrorState extends RoleCheckerState {}

//
class UserRoleState extends RoleCheckerState {}

class AuthRoleState extends RoleCheckerState {}

//
class NoProfileRoleState extends RoleCheckerState {}
