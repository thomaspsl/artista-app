import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/footer_bar.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Controller extends StatelessWidget {
  // Global function to create toast
  static void toast(String message, Color backgroundColor) async {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 15,
    );
  }

  // Global function to connect user Api
  static Future<void> connect(BuildContext context, String email, String password) async {
    var userManager = Provider.of<UserManager>(context, listen: false);
    var data = await Api.postData(context, "/connect?e=${email}&p=${password}");

    userManager.update_auth_user(data);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('mail', email);
    await prefs.setString('password', password);
  }

  // Global function to login
  static void login(BuildContext context, String email, String password) async {
    try {
      await connect(context, email, password);
      GoRouter.of(context).goNamed('home');
    } catch (e) {}
  }

  // Global function to register
  static void register(BuildContext context, String pseudo, String identifiant, String email,
      String password) async {
    try {
      var userManager = Provider.of<UserManager>(context, listen: false);
      var data = await Api.postData(
          context, "/adduser?i=${identifiant}&ps=${pseudo}&p=${password}&m=${email}");

      userManager.update_auth_user(data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('mail', email);
      await prefs.setString('password', password);
    } catch (e) {}
  }

  // Global function to autoLogin
  static void autoLogin(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('mail');
      String? password = prefs.getString('password');

      if (email != null && email.isNotEmpty && password != null && password.isNotEmpty) {
        GoRouter.of(context).goNamed('home');
        await connect(context, email, password);
      }
    } catch (e) {}
  }

  // Global function to autoLogin
  static void autoLoginOnRegister(BuildContext context, String pseudo, String identifiant,
      String email, String password) async {
    try {
      register(context, pseudo, identifiant, email, password);
      await connect(context, email, password);
      GoRouter.of(context).goNamed('home');
    } catch (e) {}
  }

  // Global function to logout
  static void logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('mail');
    prefs.remove('password');
    GoRouter.of(context).goNamed('on-boarding');
  }

  // Global function to modify the profile
  static void modifyProfile(
      BuildContext context, String pseudo, String email, String biographie, String mobile) async {
    var userManager = Provider.of<UserManager>(context, listen: false);
    try {
      String uuid = userManager.auth_user['user']['uuid'];
      await Api.putData(
          context, '/modifyuser/${uuid}?ps=${pseudo}&e=${email}&b=${biographie}&m=${mobile}');

      var user = await Api.getData(context, "/user/" + uuid);
      userManager.update_auth_user(user);

      if (email != "") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('mail', email);
      }

      GoRouter.of(context).pop();
    } catch (e) {}
  }

  static void modifyPassword(BuildContext context, String old_password, String new_password,
      String confirm_password) async {
    var userManager = Provider.of<UserManager>(context, listen: false);
    try {
      String uuid = userManager.auth_user['user']['uuid'];
      await Api.putData(context,
          '/modifypw/${uuid}?op=${old_password}&np1=${new_password}&np2=${confirm_password}');
      var user = await Api.getData(context, "/user/" + uuid);
      userManager.update_auth_user(user);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('password', new_password);

      GoRouter.of(context).pop();
    } catch (e) {}
  }

  // Global function to trigger the collection button on doubletap
  static void clickFavorite(BuildContext context, dynamic btn) async {
    RenderBox renderbox = btn.currentContext!.findRenderObject() as RenderBox;
    Offset position = renderbox.localToGlobal(Offset.zero);
    double x = position.dx;
    double y = position.dy;
    double marge = 30;

    if (y > kToolbarHeight + marge &&
        y < MediaQuery.of(context).size.height - kBottomNavigationBarHeight - marge) {
      GestureBinding.instance.handlePointerEvent(PointerDownEvent(
        position: Offset(x, y),
      ));
      await Future.delayed(Duration(milliseconds: 100));
      GestureBinding.instance.handlePointerEvent(PointerUpEvent(
        position: Offset(x, y),
      ));
    }
  }

  // Global function to format all numbers on profile
  static String formatNumber(int number) {
    if (number >= 1000000000) {
      double billions = number / 1000000000;
      return billions.toStringAsFixed(billions.truncateToDouble() == billions ? 0 : 1) + 'md';
    }
    if (number >= 1000000) {
      double millions = number / 1000000;
      return millions.toStringAsFixed(millions.truncateToDouble() == millions ? 0 : 1) + 'm';
    }
    if (number >= 1000) {
      double thousands = number / 1000;
      return thousands.toStringAsFixed(thousands.truncateToDouble() == thousands ? 0 : 1) + 'k';
    }
    return number.toString();
  }

  static String getFormattedTime(String dateTimeString) {
    final parts = dateTimeString.split(' ')[1].split(':');
    final hour = parts[0];
    final minute = parts[1];
    final formattedTime = '$hour:$minute';
    return formattedTime;
  }

  static String getFormattedCurrentTime(String dateTimeString) {
    DateTime date = DateTime.parse(dateTimeString);
    DateTime now = DateTime.now();

    Duration difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return "A l'instant";
    } else if (difference.inMinutes < 60) {
      return "Il y a ${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      return "Il y a ${difference.inHours} h";
    } else if (difference.inDays < 7) {
      return "Il y a ${difference.inDays} j";
    } else {
      int weeks = (difference.inDays / 7).floor();
      return "Il y a $weeks sem";
    }
  }

  // Global function to get the best fit height for the phone
  static Widget getAppContent(BuildContext context, Widget content) {
    return (!GoRouter.of(context).location.contains("/search") &&
            !GoRouter.of(context).location.contains("/conversation"))
        ? ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Container(
                height: Controller.getBestHeight(context),
                child: content,
              ),
            ),
          )
        : Container(
            child: content,
          );
  }

  static double getBestHeight(BuildContext context) {
    late double bestHeight;
    (!GoRouter.of(context).location.contains("/on-boarding") &&
            !GoRouter.of(context).location.contains("/conversation/"))
        ? bestHeight = MediaQuery.of(context).size.height - 159
        : bestHeight = MediaQuery.of(context).size.height - 94;
    return bestHeight;
  }

  // Global function to get the route of item in bottombar
  static int locationToTabIndex(String location, List<ScaffoldWithNavBarTabItem> tabs) {
    return (location.contains("/me") || location.contains("/search"))
        ? -1
        : tabs.indexWhere((t) => location.contains("/${t.initialName}"));
  }

  // Global transition animation swipe effects
  static Widget slideTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child, double x, double y) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(x, y),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
      )),
      child: child,
    );
  }

  // Global transition animation instagram effect
  static Widget bookTransition(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child, Widget exit, double x) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(-x, 0),
          ).animate(animation),
          child: exit,
        ),
        SlideTransition(
          position: new Tween<Offset>(
            begin: Offset(x, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        )
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
