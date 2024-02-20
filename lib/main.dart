// import 'package:agora_rtc_engine/rtc_engine.dart';
import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:lawyer_consultant/src/controllers/logged_in_user_controller.dart';
import 'package:lawyer_consultant/src/localization/LocalizationProvider.dart';
import 'package:lawyer_consultant/src/localization/app_constants.dart';
import 'package:lawyer_consultant/src/localization/app_localization.dart';
import 'package:lawyer_consultant/src/repositories/all_settings_repo.dart';
import 'package:lawyer_consultant/src/screens/agora_call/agora_logic.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/api_services/get_service.dart';
import 'src/api_services/logic.dart';
import 'src/api_services/urls.dart';
import 'src/controllers/all_settings_controller.dart';
import 'src/controllers/general_controller.dart';
import 'src/controllers/pusher_beams_controller.dart';
import 'src/controllers/search_controller.dart';
import 'src/repositories/main_repo/main_logic.dart';
import 'src/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'private-make-agora-call', // id
    'High Importance Notifications', // title
    // 'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(ApiController());
  Get.put(GetAllSettingsController());
  Get.put(GeneralController());
  Get.put(LoggedInUserController());
  Get.put(PusherBeamsController());

  Get.put(SearchBarController());
  Get.put(MainLogic());
  Get.put(AgoraLogic());
  //-----load-configurations-from-local-json
  try {
    await GlobalConfiguration().loadFromUrl(getAllSettingUrl);
    log("Working");
  } catch (e) {
    log("Error");
    // something went wrong while fetching the config from the url ... do something
  }

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LocalizationProvider(sharedPreferences: sharedPreferences),)

        ],
        child: const MyApp()),
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              // channel.description,
              importance: Importance.high,
              priority: Priority.high,
              // color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher'),
        ),
      );
    }
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // LocalNotificationService.initialize(context);
    List<Locale> locals = [];
    for (var language in AppConstants.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }
    return Resize(
      allowtextScaling: true,
      size: const Size(375, 812),
      builder: () {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Law Advisor - Customer',
          initialBinding: BindingsBuilder(() {
            // Get All Settings
            getMethod(
                context, getAllSettingUrl, null, true, getAllSettingsRepo);
          }),
          theme: ThemeData(),
          initialRoute: PageRoutes.splashScreen,
          getPages: appRoutes(),
          locale: Provider.of<LocalizationProvider>(context).locale,
          localizationsDelegates:  [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: locals,
        );
      },
    );
  }
}
