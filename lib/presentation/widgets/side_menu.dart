import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.04,
            hasNotch ? size.height * 0.02 : size.height * 0.06,
            size.width * 0.04,
            size.height * 0.04,
          ),
          child: const Text('Main'),
        ),
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        Padding(
          padding: EdgeInsets.fromLTRB(size.width * 0.04, size.height * 0.03,
              size.width * 0.04, size.height * 0.02),
          child: const Divider(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            size.width * 0.04,
            hasNotch ? size.height * 0.02 : size.height * 0.06,
            size.width * 0.04,
            size.height * 0.04,
          ),
          child: const Text('More Options'),
        ),
        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
      ],
    );
  }
}
