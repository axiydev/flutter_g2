import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_g2/model/profile_model.dart';
import 'package:flutter_g2/page/auth/sign_up.dart';
import 'package:flutter_g2/page/home/home_view.dart';
import 'package:flutter_g2/service/prefs.dart';
/*
Created by Axmadjon Isaqov on 09:17:23 12.10.2022
© 2022 @axi_dev 
*/

/*
Mavzu:::Shared Preferences
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final scaffoldMessangerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessangerKey,
      title: 'Flutter Demo',
      routes: {
        '/home': (context) => const HomeView(),
        '/auth': (context) => const SignUpScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<String?>(
        stream: Prefs.loadDataFromLocal(key: 'data').asStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('you have an error'),
            );
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const SignUpScreen();
          }
          final ProfileModel profileModel =
              ProfileModel.fromJson(jsonDecode(snapshot.data!));
          if (profileModel.email == null) {
            return const SignUpScreen();
          }

          return const HomeView();
        },
      ),
    );
  }
}
