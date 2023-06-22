import 'package:ct_single_post/MODULES/CREATE_PROFILE/create_profile_singleton.dart';
import 'package:flutter/material.dart';
import '../../COMMON/WIDGETS/textfield_widget.dart';

class CreateProfileTextFieldWidget extends StatelessWidget {
  const CreateProfileTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: CreateProfileSingleton.instance.createFormKey,
        child: Column(
          children: [
            TextFieldWidget(
              child: usernameTextField(
                  context,
                  CreateProfileSingleton.instance.usernameController,
                  'Enter username'),
            ),
            TextFieldWidget(
              child: bioTextField(context,
                  CreateProfileSingleton.instance.bioController, 'Enter bio'),
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
        return CreateProfileSingleton.instance.usernameValidator(value);
      },
      onChanged: (value) {
        CreateProfileSingleton.instance.createFormKey.currentState!.validate();
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
        return CreateProfileSingleton.instance.bioValidator(value);
      },
      onChanged: (value) {
        CreateProfileSingleton.instance.createFormKey.currentState!.validate();
      },
    );
  }
}
