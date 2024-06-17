import 'package:examenodoo/screens/calificaciones_screen.dart';
import 'package:examenodoo/screens/home_screen.dart';
import 'package:examenodoo/screens/trimestre2.dart';
import 'package:examenodoo/services/permissions_service.dart';
import 'package:examenodoo/services/push_notifications_service.dart';
import 'package:examenodoo/utilities/notification_helper.dart';
import 'package:flutter/material.dart';

import 'screens/evento_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationsService.initializeApp();
  await NotificationHelper.initialize();
  PermissionsService().requestNotificationPermission(); // Agregar esta línea
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    //Context
    PushNotificationsService.messagesStream.listen((message) {
      // ignore: avoid_print
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Global Education',
      initialRoute: 'home',
      routes: {
        'home': (_) => const MyHomePage(),
        'agenda': (_) => const AgendaScreen(),
        'calificaciones': (_) => const MenuTrimestre(),
        'trimestre2': (_) => const Trimestre2Screen(),
        'trimestre3': (_) => const Trimestre2Screen(),
        'trimestre1': (_) => const Trimestre2Screen(),
      },
      theme: ThemeData.light()
          .copyWith(appBarTheme: const AppBarTheme(color: Colors.indigo)),
    );
  }
}
