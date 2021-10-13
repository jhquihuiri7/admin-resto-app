import 'package:admin_resto_app/src/auth/local_storage.dart';
import 'package:admin_resto_app/src/pages/check_auth_page.dart';
import 'package:admin_resto_app/src/pages/login.dart';
import 'package:admin_resto_app/src/pages/main_dash.dart';
import 'package:admin_resto_app/src/providers/auth_provider.dart';
import 'package:admin_resto_app/src/providers/constraint_provider.dart';
import 'package:admin_resto_app/src/providers/login_theme_provider.dart';
import 'package:admin_resto_app/src/providers/footer_provider.dart';
import 'package:admin_resto_app/src/providers/model_provider.dart';
import 'package:admin_resto_app/src/providers/section_cuatro_provider.dart';
import 'package:admin_resto_app/src/providers/section_dos_provider.dart';
import 'package:admin_resto_app/src/providers/utils_provider.dart';
import 'package:admin_resto_app/src/providers/section_tres_provider.dart';
import 'package:admin_resto_app/src/router/route_generator.dart';
import 'package:admin_resto_app/src/validators/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
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
  String checkAuthPage = '/login';
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
        ChangeNotifierProvider(create: (_) => FooterProvider()),
        ChangeNotifierProvider(create: (_) => SectionDosProvider()),
        ChangeNotifierProvider(create: (_) => SectionTresProvider()),
        ChangeNotifierProvider(create: (_) => SectionCuatroProvider()),
        ChangeNotifierProvider(create: (_) => LoginThemeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ConstraintProvider()),
        Provider (create: (_) => LoginBloc()),
      ],

      child: Builder(
        builder: (context){
          final authProvider = Provider.of<AuthProvider>(context, listen: false);
          if (
              LocalStorage.prefs.getString('restaurantPath') != null &&
                  LocalStorage.prefs.getString('restaurantName') != null ){
            authProvider.restaurantName = LocalStorage.prefs.getString('restaurantName')!;
            authProvider.restaurantPath = LocalStorage.prefs.getString('restaurantPath')!;
            checkAuthPage = '/home';
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Administrador | Restaurantes',
            initialRoute: checkAuthPage,
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: ThemeData(
                primaryColor: Color(0xfffe6d6a),
                accentColor: Color(0xff858ef3),
                primaryColorDark: Color(0xff102689),
                primaryColorLight: Color(0xffffc37a),
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColorDark
                    ))

            ),
          );
        },
      ),
    );
  }
}
