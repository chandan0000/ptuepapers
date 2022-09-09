import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptuepapers/config/routes/routes.dart';
import 'package:ptuepapers/config/themes/themes.dart';
import 'package:ptuepapers/controller/utilscontroller.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UtilsController(),
        )
      ],
      child: Consumer<UtilsController>(
        builder: ((context, value, child) => MaterialApp.router(
              routeInformationProvider:
                  RouteConfig.router.routeInformationProvider,
              routeInformationParser: RouteConfig.router.routeInformationParser,
              routerDelegate: RouteConfig.router.routerDelegate,
              theme: ThemesConfig.lightTheme,
              darkTheme: ThemesConfig.darkTheme,
              themeMode: value.tDark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
            )),
      ),
    );
  }
}






































  // home: const BottomNavBar(),
              // home: const LoginScreen(),
              //routes
              // routes: {
              //   '/': (context) => study(),
              //   MyRoutes.study: (context) => study(),
              //   MyRoutes.books: (context) => books(),
              //   MyRoutes.videos: (context) => videos(),
              // },