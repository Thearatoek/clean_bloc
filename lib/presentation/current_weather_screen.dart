import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
import 'package:todo_app_clean_bloc_test/domain/usecase/firebase/firebase_messaging.dart';
import 'package:todo_app_clean_bloc_test/presentation/scan/qr_scan_screen.dart';

enum FloatButtonType { home, scan, profile }

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  CurrentWeatherModel? currentModel;
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  final pushToken = FirebaseMessaging;
  @override
  void initState() {
    super.initState();
    FirebaseNotificationHandler.setupFirebaseMessaging();
    _getPushToken();
  }

  String? token = '';
  Future<void> _getPushToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    token = await messaging.getToken();
    debugPrint("Message token: $token");
  }

  int pageViewIndex = 0;

  bool isLoaing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          pageViewIndex = value;
        },
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
          ),
          const QRScreen(),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.green,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 70,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buidBottomBarWidget(
                          title: "Home",
                          type: FloatButtonType.home,
                          image: "assets/images/home.png"),
                      buidBottomBarWidget(
                          title: "Scan",
                          type: FloatButtonType.scan,
                          image: "assets/images/qr-code.png"),
                      buidBottomBarWidget(
                          title: "Profile",
                          type: FloatButtonType.profile,
                          image: "assets/images/user.png"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buidBottomBarWidget(
      {required String title,
      required FloatButtonType type,
      required String image}) {
    bool isActive = FloatButtonType.values[pageViewIndex] == type;
    return GestureDetector(
      onTap: () {
        switch (type) {
          case FloatButtonType.home:
            if (pageViewIndex != 0) {
              pageViewIndex = 0;
              setState(() {});
              pageController.jumpToPage(0);
            }
          case FloatButtonType.scan:
            pageViewIndex = 1;
            setState(() {});
            pageController.jumpToPage(1);

          case FloatButtonType.profile:
            pageViewIndex = 2;
            setState(() {});
            pageController.jumpToPage(2);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: isActive ? 22 : 20,
            height: isActive ? 22 : 20,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: isActive ? 13 : 12,
                color: isActive ? Colors.black : Colors.white.withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}

// design clippath widget with height 300 width full and position bottom
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 70);
    path.quadraticBezierTo(size.width / 2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
    );
  }
}
