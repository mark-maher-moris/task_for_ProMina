import 'package:flutter/material.dart';
import 'package:task_for_promina_agency/resources/strings_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack (children: [
        Container(),
        Column(children: [Text('My Gellary'),Container (child: Column(children: [Text(StringsManager.login)],),)],)
      ],) ,
    );
  }
}