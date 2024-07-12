import 'package:fastfood/models/home_model.dart';
import 'package:fastfood/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/globalCart.dart';

void main() {
  runApp(
     MultiProvider(
         providers: [
           ChangeNotifierProvider(create: (_) => HomeModel()),
           ChangeNotifierProvider(create: (_) => Cart()),
         ],
       child: const MyApp(),
     )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner:false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: RBottomNavigationBar(),
    );
  }
}


