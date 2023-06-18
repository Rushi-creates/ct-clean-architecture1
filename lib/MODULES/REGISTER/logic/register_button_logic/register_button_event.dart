part of 'register_button_bloc.dart';

abstract class RegisterButtonEvent extends Equatable {
  const RegisterButtonEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonClickedEvent extends RegisterButtonEvent {}
