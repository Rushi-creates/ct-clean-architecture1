import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/user_repo.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/other_api/google_auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../SERIALIZERS/models/user.dart';

part 'register_button_event.dart';
part 'register_button_state.dart';

class RegisterButtonBloc
    extends Bloc<RegisterButtonEvent, RegisterButtonState> {
  RegisterButtonBloc() : super(RegisterButtonInitial()) {
/* -------------------------------------------------------------------------- */
/*                                //! register                                */
/* -------------------------------------------------------------------------- */

    on<RegisterButtonClickedEvent>((event, emit) async {
      emit(RegisterButtonLoadingState());

      try {
        //@ Google auth api

        GoogleSignInAccount result = await GoogleAuthRepo.instance.login();
        print(result);

        //@ DRF store
        User users = User(
            gauth_id: result.id,
            name: result.displayName ?? 'empty',
            email: result.email,
            photoUrl: result.photoUrl ?? 'empty');

        //
        await UserRepo.instance
            .addUser(users)

            //on django success
            .then((value) async {
          //@ local storage (shared pref)
          await UserSpRepo.instance.setUser(value);

          emit(RegisterButtonSuccesState(value));

          // on fs failure
        }).catchError((error) async {
          //@ logout if any error
          await GoogleAuthRepo.instance.logOut();
          emit(RegisterButtonErrorState());
        });
      } catch (e) {
        emit(RegisterButtonErrorState());
      }
    });
  }
}
