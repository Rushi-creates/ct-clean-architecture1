import 'package:ct_single_post/MODULES/CREATE_PROFILE/cubit/create_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../COMMON/WIDGETS/textfield_widget.dart';

class CreateProfileTextFieldWidget extends StatelessWidget {
  const CreateProfileTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: BlocProvider.of<CreateProfileCubit>(context).state.createFormKey,
        child: Column(
          children: [
            TextFieldWidget(
              child: usernameTextField(
                  context,
                  BlocProvider.of<CreateProfileCubit>(context)
                      .state
                      .usernameController,
                  'Enter username'),
            ),
            TextFieldWidget(
              child: bioTextField(
                  context,
                  BlocProvider.of<CreateProfileCubit>(context)
                      .state
                      .bioController,
                  'Enter bio'),
            ),
          ],
        ),
      ),
    );
  }

  usernameTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      validator: (value) {
        return BlocProvider.of<CreateProfileCubit>(context)
            .state
            .usernameValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<CreateProfileCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }

  bioTextField(
      BuildContext context, TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label, //hint text here
      ),
      validator: (value) {
        return BlocProvider.of<CreateProfileCubit>(context)
            .state
            .bioValidator(value);
      },
      onChanged: (value) {
        BlocProvider.of<CreateProfileCubit>(context)
            .state
            .createFormKey
            .currentState!
            .validate();
      },
    );
  }
}
