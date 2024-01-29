import 'package:black_market/core/localization/generated/l10n.dart';
import 'package:black_market/core/presentation/view/containers/default_tab_bar_container.dart';
import 'package:black_market/core/presentation/view/page_views/default_tab_bar_page_view_builder.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/sections/articles_section.dart';
import 'package:black_market/features/notifications/presentation/view/widgets/sections/notifications_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsViewBody extends StatefulWidget {
  const NotificationsViewBody({super.key});

  @override
  State<NotificationsViewBody> createState() => _NotificationsViewBodyState();
}

class _NotificationsViewBodyState extends State<NotificationsViewBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabBarContainer(
          pageController: _pageController,
          tabBarTitles: <String>[
            Tr.of(context).notifications,
            Tr.of(context).articles,
          ],
          width: 138.w,
        ),
        DefaultTabBarPageViewBuilder(
          pageController: _pageController,
          pages: const <Widget>[
            NotificationsSection(),
            ArticlesSection(),
          ],
        ),
      ],
    );
  }
}
