import 'package:flutter/material.dart';
import 'package:second_app/home/main_page_body.dart';
import 'package:second_app/utils/colors.dart';
import 'package:second_app/widgets/custom_text_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Users',
          color: AppColors.whiteColor,
        ),
      ),
      body: const MainPageBody(),
    );
  }
}
