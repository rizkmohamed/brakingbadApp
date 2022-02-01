import 'package:breaking_bad/helper/constants/colors.dart';
import 'package:breaking_bad/helper/route.dart' as route;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  final AppRouter appRouter ;

//   const MyApp({Key? key, required this.appRouter}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyColors.primeColor,
        accentColor: MyColors.secondColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.AppRouter().generateRoute,
    );
  }
}
