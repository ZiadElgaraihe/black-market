import 'package:black_market/core/presentation/view/app_bars/default_app_bar.dart';
import 'package:black_market/features/profile/presentation/view/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: 'البروفيل',
        canPop: false,
      ),
      body: ProfileViewBody(),
    );
  }
}
