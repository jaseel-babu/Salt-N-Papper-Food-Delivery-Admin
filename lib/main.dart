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
 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {final controller= Get.put(Controller());
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return GetBuilder<Controller>(
     
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: controller.userIsAlreadyLogin == true ? HomePage() : LoginPage(),
        );
      },
    );
  }
}
