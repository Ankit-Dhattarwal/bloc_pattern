import 'package:bloc_pattern/Bloc/Internet_Bloc/internet_bloc.dart';
import 'package:bloc_pattern/Cubits/internet_cubits.dart';
import 'package:bloc_pattern/Phone_auth_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Phone_auth_bloc/sign_in_screen.dart';
import 'Screen/home_screen.dart';

void main() async {
  // for firebse auth
  WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    // Here for the phone auth
    return BlocProvider(
      create: (content) => AuthCubit(),
      child: MaterialApp(
        title: 'Bloc Tutorial..',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SignInScreen(),
      ),
    );

    // return BlocProvider(
    //   // create: (BuildContext context) => InternetBloc(),
    //   create: (BuildContext context) => InternetCubit(),
    //   child: MaterialApp(
    //     title: 'Bloc Tutorial..',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const HomeScreen(),
    //   ),
    // );

  }
}
