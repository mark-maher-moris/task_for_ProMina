import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_for_promina_agency/resources/routes_manager.dart';

import 'presentation/home/viewmodel/home_gellary_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
        providers: [
              ChangeNotifierProvider(create: (_) => HomeGellaryViewmodel()),

        ],
        child: 
        MaterialApp(
          title: 'Gellary -Mark Maher',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          initialRoute: Routes.loginRoute,
        )
        );
  }
}
