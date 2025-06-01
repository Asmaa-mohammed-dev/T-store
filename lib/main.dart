import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories.authentication/authentication_repository.dart';
import 'package:t_store/firebase_options.dart';
import 'package:t_store/navigation_menu.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Getx local storage
  await GetStorage.init();
  // Await Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Await Native Splash
  // Initialize Firebase & Authentication Repository

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ تسجيل NavigationController هنا لتجنب إعادة إنشائه عدة مرات
  Get.put(NavigationController());
  runApp(const App());
}
