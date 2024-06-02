import 'package:flutter/material.dart';

class Routes { 
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
}

class RouteGenerator {
static Route<dynamic> getRoute(RouteSettings settings){
  switch(settings.name){
    case Routes.loginRoute: return MaterialPageRoute(builder: (_)=> const LoginView());

    case Routes.homeRoute: return MaterialPageRoute(builder: (_)=> const HomeView());

    defult : return MaterialPageRoute(builder: (_)=> const UndefinedScreen());
  } 
}
}


class UndefinedScreen extends StatelessWidget {
  const UndefinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Undefined Screen'),),
    );
  }
}