import 'package:flutter/material.dart';
import 'package:second_app/home/main_page.dart';
import 'package:second_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.mainColor,
        ),
      ),
      home: const MainPage(),
    );
  }
}
