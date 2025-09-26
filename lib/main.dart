//sets up the main app widget, themes, and the global state management provider.

//Import Other screens info as .dart packages
import 'package:provider/provider.dart';
import 'package:donut_app/providers/cart_provider.dart'; 
import 'package:donut_app/Screens/home_page.dart';
import 'package:flutter/material.dart';
//Main fucntion, opens the application
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Makes the cart function available
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        //// App configurations like theme and home screen.
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.brown,
        ),
        //Dark theme for the app
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.brown,
          scaffoldBackgroundColor: const Color.fromARGB(255, 204, 136, 168),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 240, 155, 197),
            elevation: 0,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}