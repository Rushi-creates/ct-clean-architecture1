part of 'role_checker_bloc.dart';

abstract class RoleCheckerEvent extends Equatable {
  const RoleCheckerEvent();

  @override
  List<Object> get props => [];
}

class CheckRoleEvent extends RoleCheckerEvent {}
