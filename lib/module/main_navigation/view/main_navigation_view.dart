import 'package:flutter/material.dart';
import 'package:example/core.dart';

class MainNavigationView extends StatefulWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  Widget build(context, MainNavigationController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: const [
            DashboardView(),
            PointHistoryView(),
            ChatView(),
            ProfileView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) {
            controller.selectedIndex = newIndex;
            controller.setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.viewDashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.viewList),
              label: "Point",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.chatQuestion),
              label: "CS",
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.ninja),
              label: "Me",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<MainNavigationView> createState() => MainNavigationController();
}
