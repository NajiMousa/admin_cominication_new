
import 'package:admin_cominication/FirebaseController/fb_notifications.dart';
import 'package:admin_cominication/Pref/shared_pref_controller.dart';
import 'package:admin_cominication/Screens/CourcersScreen/add_coures_screen.dart';
import 'package:admin_cominication/Screens/CourcersScreen/course_list_screen.dart';
import 'package:admin_cominication/Screens/JobScreen/add_job_screen.dart';
import 'package:admin_cominication/Screens/JobScreen/job_list_screen.dart';
import 'package:admin_cominication/Screens/RequstScreen/requst_payMent_screen.dart';
import 'package:admin_cominication/Screens/RequstScreen/requst_translat_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/BlokedUserScreen/user_view_bloked_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/TranslatorBlokeScreen/transaltor_bloked_view_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/TranslatorScreen/transaltor_view_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/UserBasedScreen/user_detalis_screen.dart';
import 'package:admin_cominication/Screens/UserScreen/UserBasedScreen/user_view_screen.dart';
// import 'package:admin_cominication/Screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'L10n/app_localizations.dart';
import 'Screens/home_screen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FbNotifications.initNotifications();
  // initialPositon = await getPosition();
  await SharedPrefController().initPref();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child)  {
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale("ar"),
          routes: {
            '/home_screen': (context) =>  HomeScreen(),
            '/requst_translat_screen': (context) =>  RequstTranslatScreen(),
            '/requst_payMent_screen': (context) =>  RequstPaymentScreen(),
            '/transaltor_view_screen': (context) =>  TranslatorViewScreen(),
            '/user_view_screen': (context) =>  UserViewScreen(),
            '/user_view_bloked_screen': (context) =>  UserBlokedViewScreen(),
            '/transaltor_bloked_view_screen': (context) =>  TranslatorBlokedViewScreen(),
            '/course_list_screen': (context) =>  CoursesListScreen(),
            '/add_coures_screen': (context) =>  AddCoursesScreen(),
            '/job_list_screen': (context) =>  JobListScreen(),
            '/add_job_screen': (context) =>  AddJobScreen(),

          },
        );

      },
    );
  }
}

