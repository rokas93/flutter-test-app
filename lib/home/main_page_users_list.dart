import 'package:flutter/material.dart';
import 'package:second_app/home/main_page_user_card.dart';
import 'package:second_app/home/user_page.dart';
import 'package:second_app/services/HTTPRequest.dart';
import 'package:second_app/utils/colors.dart';
import 'package:second_app/widgets/custom_text_widget.dart';

class MainPageUsers extends StatelessWidget {
  MainPageUsers({Key? key}) : super(key: key);

  final Future<List<Map>> _futureUsers =
      HTTPRequest().getUsers('https://jsonplaceholder.typicode.com/users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map>>(
        future: _futureUsers,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //  Show error
          if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const CustomText(
                    text: 'Error 404:',
                    size: 40.0,
                    color: AppColors.mainColor,
                  ),
                  CustomText(
                    text: '${snapshot.error}',
                    align: TextAlign.center,
                    size: 20.0,
                  ),
                ],
              ),
            );
          }

          //  Show data
          if (snapshot.hasData) {
            List<Map> users = snapshot.data;

            return Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                bottom: 20.0,
              ),
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20.0,
                  );
                },
                itemCount: users.length,
                itemBuilder: (context, index) {
                  Map thisUser = users[index];
                  return MainPageUserCard(
                    userName: thisUser['name'],
                    userEmail: thisUser['email'],
                    userPhone: thisUser['phone'],
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserPage(
                            thisUser['id'],
                            thisUser['name'],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          }

          //  Loader
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
