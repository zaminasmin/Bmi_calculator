import 'package:bmicalculator/Provider/Bmiprovider.dart';
import 'package:bmicalculator/screens/calculator_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>BmiProvider(),
      child: MaterialApp(

        home: CalculatorScreen(),
      ),
    );
  }
}
