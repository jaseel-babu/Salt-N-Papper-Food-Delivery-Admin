import 'package:admin_side/controller/loginController.dart';
import 'package:admin_side/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/log_in.dart';

Future main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(Controller());
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   final controller= Get.put(Controller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:controller.userIsAlreadyLogin!?HomePage(): LoginPage(),
    );
  }
}
