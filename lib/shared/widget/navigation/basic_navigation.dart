import 'package:flutter/material.dart';

class ExBasicNavigation extends StatefulWidget {
  final List<Widget> children;
  final List<BottomNavigationBarItem> bottomNavigationBarItems;

  const ExBasicNavigation({
    Key? key,
    required this.children,
    required this.bottomNavigationBarItems,
  }) : super(key: key);

  @override
  State<ExBasicNavigation> createState() => _ExBasicNavigationState();
}

class _ExBasicNavigationState extends State<ExBasicNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.children.length,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: widget.children,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          selectedItemColor: Colors.grey[700],
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: widget.bottomNavigationBarItems,
        ),
      ),
    );
  }
}
