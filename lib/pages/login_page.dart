import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:universidades_app/providers/login_page_provider.dart';

import 'package:universidades_app/widgets/generic_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginPageProvider controller = Provider.of<LoginPageProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GenericButton('Enter', () {
            controller.navigateToHomeScreen(context);
          }),
        ]),
      ),
    );
  }
}

