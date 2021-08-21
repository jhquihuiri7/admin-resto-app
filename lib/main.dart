import 'package:admin_resto_app/src/pages/main_dash.dart';
import 'package:admin_resto_app/src/providers/model_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());


}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }
  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(_error) {
      print("error");
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      print("loading");
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UtilsProvider()),
        ChangeNotifierProvider(create: (_) => ModelProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainDash(),
        theme: ThemeData(
          primaryColor: Color(0xfffe6d6a),
          accentColor: Color(0xff858ef3),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff102689)
              ))

        ),
      ),
    );
  }
}