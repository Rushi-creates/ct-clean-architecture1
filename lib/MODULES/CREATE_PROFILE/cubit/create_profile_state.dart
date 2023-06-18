part of 'create_profile_cubit.dart';

abstract class CreateProfileState extends Equatable {
  CreateProfileState();

  @override
  List<Object> get props => [
        createFormKey,
        usernameController,
        bioController,
        isFromProfileScreen,
      ];

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

  final createFormKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final bool isFromProfileScreen = false;

/* -------------------------------------------------------------------------- */
/*                                     //                                     */
/* -------------------------------------------------------------------------- */

  usernameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Username connot be empty';
    }
    return null;
  }

  bioValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Bio cannot be empty';
    }
    return null;
  }
}

class CreateProfileInitial extends CreateProfileState {}
