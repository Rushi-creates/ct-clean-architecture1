import 'package:bloc/bloc.dart';
import 'package:ct_single_post/SERIALIZERS/repositories/drf_api/profile_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../API_HELPER/exceptions/exceptions.dart';
import '../../../SERIALIZERS/models/Profile.dart';

part 'create_profile_button_event.dart';
part 'create_profile_button_state.dart';

class CreateProfileButtonBloc
    extends Bloc<CreateProfileButtonEvent, CreateProfileButtonState> {
  CreateProfileButtonBloc() : super(CreateProfileButtonInitial()) {
    on<CreateProfileButtonClickedEvent>((event, emit) async {
      emit(CreateProfileButtonLoadingState());

      try {
        //# from api repo
        Profile response = event.isProfileUpdateEvent
            ? await ProfileRepo.instance
                .update(event.modelObjToAdd, event.modelObjToAdd.p_uid)
            : await ProfileRepo.instance.create(event.modelObjToAdd);

        //@ store profile in sp
        await ProfileSpRepo.instance.setProfile(response);

        emit(CreateProfileButtonSuccessState());

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(CreateProfileButtonErrorState(storeErr));
      }
    });
  }
}
