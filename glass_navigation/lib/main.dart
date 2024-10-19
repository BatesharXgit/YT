import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glass_navigation/bottom_bar.dart';
import 'package:glass_navigation/homepage.dart';
import 'package:iconly/iconly.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Glass Bottom Bar Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  bool isMiniPlayerVisible = true;

  @override
  void initState() {
    // Initialize current page and TabController.
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);

    // Listener for page changes.
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();

    // Set the system UI overlay style.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF0c0c16),
      ),
    );
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  // Define colors for each tab.
  Color homeColor = const Color.fromARGB(255, 175, 202, 0);
  Color customColor = const Color(0xFF7B4294);
  Color locationColor = const Color.fromARGB(255, 59, 255, 226);
  Color favoritesColor = Colors.red;
  Color settingsColor = Colors.blue;
  Color unselectedColor = Colors.grey;

  // Get the indicator color based on the selected page.
  Color _getIndicatorColor(int page) {
    switch (page) {
      case 0:
        return homeColor;
      case 1:
        return customColor;
      case 2:
        return locationColor;
      case 3:
        return favoritesColor;
      case 4:
        return settingsColor;
      default:
        return unselectedColor;
    }
  }

  @override
  void dispose() {
    tabController
        .dispose(); // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          GlassNavigationBar(
            iconHeight: 50,
            iconWidth: 50,
            fit: StackFit.expand,
            icon: (width, height) => Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.grey,
                  size: width,
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(500),
            duration: const Duration(seconds: 1),
            curve: Curves.decelerate,
            showIcon: true,
            width: MediaQuery.of(context).size.width * 0.78,
            start: 2,
            end: 0,
            offset: 10,
            barAlignment: Alignment.bottomCenter,
            reverse: false,
            hideOnScroll: true,
            scrollOpposite: false,
            onBottomBarHidden: () {
              setState(() {
                isMiniPlayerVisible = false;
              });
            },
            onBottomBarShown: () {
              setState(() {
                isMiniPlayerVisible = true;
              });
            },
            body: (context, controller) => TabBarView(
              controller: tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // Each tab displays an InfiniteListPage.
                //Change with your own page
                StoreHomePage(controller: controller),
                StoreHomePage(controller: controller),
                StoreHomePage(controller: controller),
                StoreHomePage(controller: controller),
                StoreHomePage(controller: controller),
              ],
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
              controller: tabController,
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: _getIndicatorColor(currentPage), width: 6),
                insets: const EdgeInsets.fromLTRB(20, 0, 14, 6),
              ),
              tabs: [
                // Icons for each tab with size and color changing based on selection.
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Icon(
                      IconlyBold.home,
                      color: currentPage == 0 ? homeColor : unselectedColor,
                      size: currentPage == 0 ? 30 : 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Icon(
                      IconlyBold.search,
                      color: currentPage == 1 ? customColor : unselectedColor,
                      size: currentPage == 1 ? 30 : 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Icon(
                      IconlyBold.plus,
                      color: currentPage == 2 ? locationColor : unselectedColor,
                      size: currentPage == 2 ? 30 : 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Center(
                    child: Icon(
                      IconlyBold.heart,
                      color:
                          currentPage == 3 ? favoritesColor : unselectedColor,
                      size: currentPage == 3 ? 30 : 28,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Icon(
                      IconlyBold.setting,
                      color: currentPage == 4 ? settingsColor : unselectedColor,
                      size: currentPage == 4 ? 30 : 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
