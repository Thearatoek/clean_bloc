import 'package:flutter/material.dart';

BuildContext? appContext;

class LoadingScreen extends StatelessWidget {
  final Color? backgroundColor;
  const LoadingScreen({super.key, this.backgroundColor});
  final double padding = 16.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.black12,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SizedBox(
          height: padding * 2,
          width: padding * 2,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.7,
          ),
        ),
      ),
    );
  }
}

class LoadingHandler {
  static DialogRoute? loadingRoute;

  static void showLoading() {
    if (loadingRoute == null || loadingRoute?.isActive == false) {
      loadingRoute = DialogRoute(
        barrierDismissible: false,
        context: appContext!,
        barrierColor: Colors.black12,
        useSafeArea: false,
        builder: (context) => const LoadingScreen(),
      );

      /// push the dialog route
      Navigator.of(appContext!).push(loadingRoute!);
    }
  }

  static void hideLoading() {
    if (loadingRoute != null && loadingRoute?.isActive == true) {
      Navigator.of(appContext!).removeRoute(loadingRoute!);
      loadingRoute = null;
    }
  }
}
