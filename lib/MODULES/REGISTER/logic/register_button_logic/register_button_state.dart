part of 'register_button_bloc.dart';

abstract class RegisterButtonState extends Equatable {
  const RegisterButtonState();

  @override
  List<Object> get props => [];
}

class RegisterButtonInitial extends RegisterButtonState {}

class RegisterButtonSuccesState extends RegisterButtonState {
  final user;
  const RegisterButtonSuccesState(this.user);
  @override
  List<Object> get props => [user];
}

class RegisterButtonLoadingState extends RegisterButtonState {}

class RegisterButtonErrorState extends RegisterButtonState {}
