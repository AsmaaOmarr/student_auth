import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/features/splash_screen/presentation/views/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Constant.kPink),
        useMaterial3: true,
        bottomSheetTheme: const BottomSheetThemeData(
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const SplashView(),
    );
  }
}
