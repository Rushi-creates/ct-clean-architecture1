part of 'create_profile_button_bloc.dart';

abstract class CreateProfileButtonState extends Equatable {
  const CreateProfileButtonState();

  @override
  List<Object> get props => [];
}

class CreateProfileButtonInitial extends CreateProfileButtonState {}

class CreateProfileButtonLoadingState extends CreateProfileButtonState {}

class CreateProfileButtonSuccessState extends CreateProfileButtonState {}

class CreateProfileButtonErrorState extends CreateProfileButtonState {
  final error;
  const CreateProfileButtonErrorState(this.error);
  @override
  List<Object> get props => [error];
}
