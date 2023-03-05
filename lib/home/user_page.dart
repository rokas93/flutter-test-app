import 'package:flutter/material.dart';
import 'package:second_app/services/HTTPRequest.dart';
import 'package:second_app/utils/colors.dart';
import 'package:second_app/widgets/custom_text_widget.dart';

class UserPage extends StatelessWidget {
  final int userId;
  final String userName;
  late Future<Map> _futureUser;

  UserPage(this.userId, this.userName, {Key? key}) : super(key: key) {
    _futureUser = HTTPRequest()
        .getUser('https://jsonplaceholder.typicode.com/users/$userId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Name',
          color: AppColors.whiteColor,
        ),
      ),
      body: FutureBuilder<Map>(
        future: _futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              children: [
                const CustomText(text: 'Error 404'),
                CustomText(text: '${snapshot.error}'),
              ],
            );
          }

          if (snapshot.hasData) {
            Map user = snapshot.data!;

            return Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: '${user['name']}',
                          size: 24.0,
                        ),
                        CustomText(
                          text: '${user['email']}',
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: '${user['address']['street']}'),
                      CustomText(text: '${user['address']['suite']}'),
                      CustomText(text: '${user['address']['city']}'),
                      CustomText(text: '${user['address']['zipcode']}'),
                    ],
                  )
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
