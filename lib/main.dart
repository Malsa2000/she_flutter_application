import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:she_flutter_application/DataBase/data_base_controller.dart';
import 'package:she_flutter_application/faqs.dart';
import 'package:she_flutter_application/favorit_list.dart';
import 'package:she_flutter_application/languge_provider.dart';
import 'package:she_flutter_application/pref/shared_pref_controller.dart';
import 'but_screen.dart';
import 'calclator.dart';
import 'faqs_test.dart';
import 'home.dart';
import 'login.dart';
import 'lunch_screen.dart';
import 'onbording.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferanceController().initSharedPref();
  await  DataBaseController().initDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(320, 813),
        minTextAdapt: true,
        builder: (context, child) {
          return ChangeNotifierProvider<LangugesProvider>(
              create: (context) => LangugesProvider(),
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          iconTheme: IconThemeData(color: Colors.black),
                          titleTextStyle: GoogleFonts.cairo(
                            fontSize: 15,
                            color: Colors.black,
                          ))),
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  supportedLocales: [Locale('ar'), Locale('en')],
                  locale: Locale('ar'),
                  debugShowCheckedModeBanner: !true,
                  home: Home(),
                  initialRoute: '/Home',
                  routes: {
                    '/Home': (context) => const Home(),
                    '/bot': (context) => const ButtonNavogationBar(),
                    '/onbording': (context) => OnBording(),
                    '/faqs': (context) => Faqs(),
                    '/faqsTest': (context) => FaqsTest(),
                    '/favorit': (context) => FavoritList(),
                    '/login': (context) => Login(),
                    '/lunchScreen': (context) => LunchScreen(),
                    '/calculator': (context) => Calclator(),
                    '/calculator': (context) => Calclator(),
                  },
                );
              });
        });
  }
}
