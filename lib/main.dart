import 'package:flutter/material.dart';
import 'package:note/screens/auth/authPage.dart';
import 'package:note/shared/widgets/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/auth',

      routes: {
        '/auth': (context) => AuthPage(),
        //DetailPage.routeName: (context) => DetailPage(),
        //CartPage.routeName: (context) => CartPage(),
      },
      theme: ThemeData(
        fontFamily: 'ceraRegular',
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: darkBlue,
          secondary: lightBlue,
        ),
      ),
    );
  }
}
