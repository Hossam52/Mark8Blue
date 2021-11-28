import 'package:clean_app/general_commponent/colors.dart';
import 'package:clean_app/presentation/resourses/theme_manager.dart';
import 'package:clean_app/screens/advertisement/advertisement_screen.dart';
import 'package:clean_app/screens/conditions/conditions_screen.dart';
import 'package:clean_app/screens/home/home_screen.dart';
import 'package:clean_app/screens/notifications/notification_screen.dart';
import 'package:clean_app/screens/orders_management/orders_management.dart';
import 'package:clean_app/screens/orders_management/prepare_orders/prepare_orders.dart';
import 'package:clean_app/screens/product_details/product_details.dart';
import 'package:clean_app/screens/settings/settings_screen.dart';
import 'package:clean_app/screens/splash_screen/splashScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => EasyLocalization(
        path: 'asset/locales',
        supportedLocales: [Locale('ar', 'SA'), Locale('en', 'UK')],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: Locale('en'),
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),

          // ThemeData(
          //   fontFamily: 'jalia',
          //   primaryColor: Colors.green,
          //   scaffoldBackgroundColor: Colors.white,
          //   // textTheme: TextTheme(bodyText2: TextStyle(fontSize: 20)),
          // ),
          home: SplashScreen()),
    );
  }
}
