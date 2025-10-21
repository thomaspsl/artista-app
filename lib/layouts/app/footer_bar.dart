import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterBar extends StatefulWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  State<FooterBar> createState() => _FooterBarState();
}

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem({
    required this.initialName,
    required Widget icon,
    required Widget activeIcon,
    String? label,
  }) : super(icon: icon, activeIcon: activeIcon, label: label);

  final String initialName;
}

class _FooterBarState extends State<FooterBar> {
  @override
  Widget build(BuildContext context) {
    List<ScaffoldWithNavBarTabItem> tabs = [
      const ScaffoldWithNavBarTabItem(
        initialName: 'home',
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
      ),
      const ScaffoldWithNavBarTabItem(
        initialName: 'notifications',
        icon: Icon(Icons.notifications_outlined),
        activeIcon: Icon(Icons.notifications),
        label: 'Notifications',
      ),
      ScaffoldWithNavBarTabItem(
        initialName: 'add-post',
        icon: Container(
          decoration: const BoxDecoration(
            color: AppColors.orangeJuice,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_rounded,
            size: 35,
            color: Theme.of(context).backgroundColor,
          ),
        ),
        activeIcon: Container(
          decoration: const BoxDecoration(
            color: AppColors.orangeJuice,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add_rounded,
            size: 35,
            color: (!GoRouter.of(context).location.contains("/add-post"))
                ? Theme.of(context).backgroundColor
                : Theme.of(context).primaryColor,
          ),
        ),
        label: 'AddPost',
      ),
      const ScaffoldWithNavBarTabItem(
        initialName: 'collections',
        icon: Icon(Icons.bookmark_outline),
        activeIcon: Icon(Icons.bookmark),
        label: 'Collections',
      ),
      const ScaffoldWithNavBarTabItem(
        initialName: 'conversations',
        icon: Icon(Icons.question_answer_outlined),
        activeIcon: Icon(Icons.question_answer),
        label: 'Conversations',
      ),
    ];
    int currentIndex = Controller.locationToTabIndex(GoRouter.of(context).location, tabs);

    return SizedBox(
      height: (!GoRouter.of(context).location.contains("/on-boarding") &&
              !GoRouter.of(context).location.contains("/conversation/"))
          ? 65
          : 0,
      child: BottomNavigationBar(
        iconSize: 30,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: (currentIndex != -1) ? currentIndex : 2,
        onTap: (index) => {
          if (index != currentIndex) context.goNamed(tabs[index].initialName),
        },
        items: tabs,
      ),
    );
  }
}
