import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_c7_mon/shared/styles/my_theme.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:todo_c7_mon/moudles/settings/settings.dart';
import 'package:todo_c7_mon/provider/Prov.dart';
import 'layout/home_layout.dart';

var theme = MyThemeData.lightTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(create: (context) => Provcl(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        'Settings': (context) => SettingsTab(),
      },
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
