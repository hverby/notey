import 'package:flutter/material.dart';
import 'package:note/providers/NoteProvider.dart';
import 'package:note/screens/auth/authPage.dart';
import 'package:note/screens/home/homePage.dart';
import 'package:note/shared/widgets/colors.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NoteProvider>(create: (_) => NoteProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/auth',

        routes: {
          AuthPage.routeName: (context) => AuthPage(),
          MyHomePage.routeName: (context) => MyHomePage(),
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
      )
    );
  }
}
