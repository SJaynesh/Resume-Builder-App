import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/utils/routes.dart';
import 'package:resume_builder_app/view/screens/build_option_page.dart';
import 'package:resume_builder_app/view/screens/buttons_page.dart';
import 'package:resume_builder_app/view/screens/contact_info.dart';
import 'package:resume_builder_app/view/screens/declartion_page.dart';
import 'package:resume_builder_app/view/screens/pdf_page.dart';
import 'package:resume_builder_app/view/screens/personal_detail.dart';
import 'package:resume_builder_app/view/screens/splash_screen.dart';
import 'package:resume_builder_app/view/screens/technical_skill_page.dart';

import 'view/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xff6054C1),
      systemNavigationBarColor: Colors.white,
      // statusBarBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.green,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    const ResumeApp(),
  );
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        Routes.splash_screen: (context) => const SplashScreen(),
        Routes.home_page: (context) => const HomePage(),
        Routes.build_page: (context) => const BuildOptionPage(),
        Routes.contactInfo: (context) => const ContactInfoPage(),
        Routes.personalDetail: (context) => const PersonalDetailPage(),
        Routes.declaration: (context) => const DeclarationPage(),
        Routes.skills: (context) => const TechnicalSkillPage(),
        Routes.buttonPage: (context) => const ButtonPage(),
        Routes.pdfPage: (context) => const PDFPage(),
      },
    );
  }
}
