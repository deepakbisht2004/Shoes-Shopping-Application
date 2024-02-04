

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_shopping_app/AppScreen.dart';

import 'package:shoes_shopping_app/cart_provider.dart';


void main(){
  
  runApp(const ShoesApp());
}
class ShoesApp extends StatelessWidget {
  const ShoesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Cartprovider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "shopping App",

        theme:ThemeData(
          appBarTheme: AppBarTheme(

            titleTextStyle: TextStyle(
              fontSize: 25,color: Colors.black
            )
          ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow,
        primary:  Colors.yellow),
         textTheme:const  TextTheme(
           bodySmall: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20
           ),
           titleMedium: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.bold,)
         ) ,


        ),
        home: MainScreen(),
      ),
    );
    
  }
}
