import 'package:firebase_core/firebase_core.dart';
import 'package:firecars/services/authentification.dart';
import 'package:firecars/services/dbServices.dart';
import 'package:firecars/views/detail/carDetail.dart';
import 'package:firecars/views/login/login.dart';
import 'package:firecars/views/profile/profile.dart';
import 'package:firecars/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model/carModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(providers: [
      StreamProvider.value(
          initialData: null,
          value: AuthService().user,
      ),
      StreamProvider<List<Car>>.value(
        initialData: [],
        value: DatabaseService().cars,

      )
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firecars',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        appBarTheme: AppBarTheme (backgroundColor: Colors.white)
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Wrapper(),
        '/profile' : (context) => Profile(),
        '/detail' : (context) => CarDetail(),
      }
    );
  }
}


