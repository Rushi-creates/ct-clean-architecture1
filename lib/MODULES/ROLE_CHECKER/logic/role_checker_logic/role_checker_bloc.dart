import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/user_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../SERIALIZERS/models/Profile.dart';

part 'role_checker_event.dart';
part 'role_checker_state.dart';

class RoleCheckerBloc extends Bloc<RoleCheckerEvent, RoleCheckerState> {
  RoleCheckerBloc() : super(RoleCheckerInitial()) {
    /* -------------------------------------------------------------------------- */
/*                       //! Check role in splash screen                      */
/* -------------------------------------------------------------------------- */
    on<CheckRoleEvent>((event, emit) async {
      emit(RoleLoadingState());

      try {
/* -------------------------------------------------------------------------- */
/*                                  //! Vars                                  */
/* -------------------------------------------------------------------------- */

        //@ checking sp for user drf account
        int? id = UserSpRepo.instance.getUser()?.id;
        print('from splash bloc=> this is id = $id');

        //@ checking sp for stage 2 : is profile created in drf
        Profile? profileSpObj = ProfileSpRepo.instance.getProfile();
        print('from splash bloc=> this is profile sp obj = $profileSpObj');

/* -------------------------------------------------------------------------- */
/*                                //! USER ROLE                               */
/* -------------------------------------------------------------------------- */
        if (id != null
            //* && email != null && name != null && photoUrl != null
            &&
            profileSpObj != null) {
          print('user role');
          emit(UserRoleState());
        }

/* -------------------------------------------------------------------------- */
/*                           //! Create Profile Role                          */
/* -------------------------------------------------------------------------- */

        else if (id != null && profileSpObj == null) {
          //@ profile created in sp is false, since device might be changed
          //@ but profile created might be true in remote api
          print('inside checking does prop exists');

          //check in fs table of userName & bio ( if doc exists or not)
          var result = await ProfileRepo.instance.doesProfileExists(id);
          //
          if (result is Profile) {
            await ProfileSpRepo.instance.setProfile(result);
            print('profile stored in sp, from fs and now user role');
            emit(UserRoleState());

            //
          } else if (result == false) {
            print('Profile not created role');
            emit(NoProfileRoleState());
          }
        }

/* -------------------------------------------------------------------------- */
/*                            //! Auth screen Role                            */
/* -------------------------------------------------------------------------- */
        else {
          emit(AuthRoleState());
        }

/* -------------------------------------------------------------------------- */
/*                                  //! error                                 */
/* -------------------------------------------------------------------------- */
      } catch (e) {
        print('role error state $e');
        emit(RoleErrorState());
      }
    });
  }
}
