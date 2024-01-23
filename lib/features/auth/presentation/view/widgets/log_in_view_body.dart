import 'package:black_market/core/animations/side_slide_transition.dart';
import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/utils/text_styles.dart';
import 'package:black_market/features/auth/presentation/view/forget_password_view.dart';
import 'package:black_market/features/auth/presentation/view/widgets/blocs/log_in_bloc_consumer.dart';
import 'package:black_market/features/auth/presentation/view/widgets/buttons/continue_with_google_button.dart';
import 'package:black_market/features/auth/presentation/view/widgets/buttons/log_in_text_button.dart';
import 'package:black_market/features/auth/presentation/view/widgets/forms/log_in_form.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/no_account_row.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/or_divider_row.dart';
import 'package:black_market/features/auth/presentation/view/widgets/rows/remember_me_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  final ValueNotifier<AutovalidateMode> _autoValidateModeValueNotifier =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _autoValidateModeValueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h),
              Text(
                Tr.of(context).logInToYourAccount,
                style: TextStyles.textStyle26,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              LogInForm(
                autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
                formKey: _formKey,
              ),
              SizedBox(height: 18.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const RememberMeRow(),
                  LogInTextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        SideSlideTransition(
                          page: const ForgetPasswordView(),
                        ),
                      );
                    },
                    title: Tr.of(context).forgetPassword,
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              LogInBlocConsumer(
                autoValidateModeValueNotifier: _autoValidateModeValueNotifier,
                formKey: _formKey,
              ),
              SizedBox(height: 20.h),
              const NoAccountRow(),
              const OrDividerRow(),
              const ContinueWithGoogleButton(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
