import 'package:flutter/material.dart';
import 'package:mustad_test/brand/view/brand_screen.dart';
import 'package:mustad_test/common/component/layout/default_layout.dart';
import 'package:mustad_test/other_user/view/other_user_screen.dart';

class RootTab extends StatefulWidget {
  static String get routeName => 'rootTab';

  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: index,
        onTap: (int index) {
          setState(() {
            this.index = index;
            controller.animateTo(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.branding_watermark),
            label: 'Brand',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'OtherUser',
          ),
        ],
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          BrandScreen(),
          OtherUserScreen(),
        ],
      ),
    );
  }
}
