import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/models/follow_account.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/follow_account_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../API_HELPER/exceptions/exceptions.dart';

part 'CheckIfFollows_cud_event.dart';
part 'CheckIfFollows_cud_state.dart';

class CheckIfFollowsCudBloc
    extends Bloc<CheckIfFollowsCudEvent, CheckIfFollowsCudState> {
  CheckIfFollowsCudBloc() : super(CheckIfFollowsCudInitial()) {
/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<CheckIfFollows_create_onButtonPressed_Event>((event, emit) async {
      emit(CheckIfFollows_create_Loading_State());

      try {
        //# from api repo
        var response = await FollowAccountRepo.instance
            .checkIfFollows(event.modelObjToAdd);

        if (response == false) {
          emit(CheckIfFollows_create_DoesNotFollows_State());
        } else {
          FollowAccount followAccount = FollowAccount.fromMap(response);
          emit(CheckIfFollows_create_Follows_State(followAccount.id));
        }

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(CheckIfFollows_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
//     on<CheckIfFollows_Update_onButtonPressed_Event>((event, emit) async {
//       emit(CheckIfFollows_update_Loading_State());

//       try {
//         //# from api repo
//         var response =
//             await CheckIfFollows_api_repo.update(event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(CheckIfFollows_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(CheckIfFollows_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<CheckIfFollows_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(CheckIfFollows_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await CheckIfFollows_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(CheckIfFollows_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(CheckIfFollows_Delete_Error_State(storeErr));
//       }
//     });
  }
}
