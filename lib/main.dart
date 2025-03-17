import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/app.dart';
import 'package:t_store/navigation_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ تسجيل NavigationController هنا لتجنب إعادة إنشائه عدة مرات
  Get.put(NavigationController());
  runApp(const App());
}
