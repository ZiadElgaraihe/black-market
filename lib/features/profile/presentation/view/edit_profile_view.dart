import 'package:black_market/features/profile/presentation/view/widgets/edit_profile_view_app_bar.dart';
import 'package:black_market/features/profile/presentation/view/widgets/edit_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final ValueNotifier<bool> _canEdit = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _canEdit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: EditProfileViewAppBar(
          title: 'تعديل الملف الشخصي',
          onEditTapped: () {
            _canEdit.value = !_canEdit.value;
          },
        ),
        body: EditProfileViewBody(
          canEditValueNotifier: _canEdit,
        ),
      ),
    );
  }
}
