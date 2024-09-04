import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:todo_app_clean_bloc_test/domain/entity/product_model.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_bloc.dart';
import 'package:todo_app_clean_bloc_test/presentation/current_weather/bloc/bloc_state.dart';

class CurrentWeatherScreen extends StatefulWidget {
  const CurrentWeatherScreen({super.key});

  @override
  _CurrentWeatherScreenState createState() => _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends State<CurrentWeatherScreen> {
  CurrentWeatherModel? currentModel;
  final _appLink = AppLinks();
  String hello = '';

  @override
  void initState() {
    super.initState();
    _disableScreenshot();
  }

  void _handleIncomingLinks() {
    _appLink.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        // Handle the deep link here
        hello = uri.pathSegments.toString();
        print('Received deep link: $uri');
        // You can navigate to different screens based on the URI
        if (uri.path == '/path') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      }
    }, onError: (Object err) {
      // Handle error
      print('Failed to receive deep link: $err');
    });
  }

  static const androidChannel = MethodChannel('com.clean_code');

  Future<void> _invokeKotlinFunction() async {
    try {
      final String result = await androidChannel.invokeMethod('onInvoke');
      print('Result from Kotlin: $result');
    } on PlatformException catch (e) {
      print('Failed to invoke Kotlin function: ${e.message}');
    }
  }

  static const isoChannel = MethodChannel('com.clean_code/channel');
  Future<void> _disableScreenshot() async {
    try {
      await isoChannel.invokeMethod('disableScreenshot');
      print('Screenshot disabled');
    } on PlatformException catch (e) {
      print('Failed to disable screenshot: ${e.message}');
    }
  }

  void disable() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    print("screen is disable");
  }

  bool isLoaing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<WeatherBloc, WeattherState>(
        listener: (context, state) {
          if (state is WeatherInitState) {
            isLoaing = true;
          }
          if (state is CurrentState) {
            setState(() {
              currentModel = state.currentWeatherModel;
              debugPrint("Current Model: $currentModel");
            });
            Future.delayed(const Duration(seconds: 1), () {
              setState(() {
                isLoaing = false;
              });
            });
          }
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sky.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      child: Center(
                        child: Icon(
                          Icons.location_on_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    currentModel?.location?.region ?? "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    currentModel?.current?.lastUpdated?.substring(0,
                            currentModel!.current!.lastUpdated!.length - 5) ??
                        "",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      if (Platform.isAndroid) {
                        _invokeKotlinFunction();
                      } else {
                        _disableScreenshot();
                      }
                    },
                    child: const Icon(
                      Icons.sunny,
                      size: 50,
                      color: Colors.yellow,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      '${currentModel?.current?.tempC} ^C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        _showCustomBottomSheet(
                          context,
                          wid: _buildWeatherTem(
                              tem: "12", val: "32", icon: Icons.abc),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          color: Colors.blue,
                        ),
                        child: const Center(
                          child: Text("View Details"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (isLoaing)
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

void _showCustomBottomSheet(BuildContext context, {required Widget wid}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ClipPath(
        clipper: BottomClipper(),
        child: Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.white,
            child: wid),
      );
    },
  );
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

Widget _buildWeatherTem(
    {required String tem, required String val, required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      children: [
        Text(
          tem,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            icon,
            color: Colors.blue,
            size: 28,
          ),
        ),
        Text(
          val,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
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
