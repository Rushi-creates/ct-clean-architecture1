part of 'create_profile_button_bloc.dart';

abstract class CreateProfileButtonEvent extends Equatable {
  const CreateProfileButtonEvent();

  @override
  List<Object> get props => [];
}

class CreateProfileButtonClickedEvent extends CreateProfileButtonEvent {
  final modelObjToAdd;
  final bool isProfileUpdateEvent;

  const CreateProfileButtonClickedEvent(
      {required this.modelObjToAdd, required this.isProfileUpdateEvent});

  @override
  List<Object> get props => [modelObjToAdd, isProfileUpdateEvent];
}
