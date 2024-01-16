import 'package:black_market/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationSettingSwitchButton extends StatefulWidget {
  const NotificationSettingSwitchButton({super.key});

  @override
  State<NotificationSettingSwitchButton> createState() =>
      _NotificationSettingSwitchButtonState();
}

class _NotificationSettingSwitchButtonState
    extends State<NotificationSettingSwitchButton> {
  final ValueNotifier<bool> _isTurnOn = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _isTurnOn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Transform.scale(
          scale: 1.5,
          child: ValueListenableBuilder(
            valueListenable: _isTurnOn,
            builder: (context, isTurnOn, child) => Switch(
              activeTrackColor: AppColors.lightGreen,
              inactiveTrackColor: AppColors.grey,
              inactiveThumbColor: AppColors.white,
              trackOutlineWidth: const MaterialStatePropertyAll(0),
              thumbIcon: MaterialStatePropertyAll(
                Icon(
                  Icons.circle,
                  color: AppColors.white,
                ),
              ),
              value: isTurnOn,
              onChanged: (value) {
                _isTurnOn.value = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
