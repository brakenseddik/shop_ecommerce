import 'package:flutter/material.dart';
import 'package:shoppy/pages/home.dart';
import 'package:shoppy/pages/login.dart';
import 'package:shoppy/pages/splash.dart';
import 'package:shoppy/provider/app_provider.dart';
import 'package:shoppy/provider/userProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: AppProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.amber),
        debugShowCheckedModeBanner: false,
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
        break;
      case Status.Unauthenticated:
      case Status.Unauthenticated:
        return Login();
        break;
      case Status.Authenticated:
        return HomePage();
        break;
      default:
        return Login();
    }
  }
}
