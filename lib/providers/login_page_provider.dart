import 'package:flutter/material.dart';

class LoginPageProvider with ChangeNotifier {
  
  LoginPageProvider();

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, 'home_screen');
  }

 
}
