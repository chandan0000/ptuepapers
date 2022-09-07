import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ptuepapers/controller/utilscontroller.dart';
import 'package:ptuepapers/screens/authscreens/loginScreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UtilsController(),
        )
      ],
      child: Consumer<UtilsController>(
        builder: ((context, value, child) => MaterialApp(
              theme: FlexThemeData.light(
                colors: const FlexSchemeColor(
                  primary: Color(0xff004881),
                  primaryContainer: Color(0xffd0e4ff),
                  secondary: Color(0xffac3306),
                  secondaryContainer: Color(0xffffdbcf),
                  tertiary: Color(0xff006875),
                  tertiaryContainer: Color(0xff95f0ff),
                  appBarColor: Color(0xffffdbcf),
                  error: Color(0xffb00020),
                ),
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                blendLevel: 20,
                appBarOpacity: 0.95,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 20,
                  blendOnColors: false,
                  bottomNavigationBarElevation: 5.5,
                  navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
                  navigationBarUnselectedLabelSchemeColor:
                      SchemeColor.surfaceTint,
                  navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
                  navigationBarUnselectedIconSchemeColor:
                      SchemeColor.surfaceTint,
                  navigationBarIndicatorOpacity: 0.39,
                  navigationBarOpacity: 0.10,
                  navigationBarLabelBehavior:
                      NavigationDestinationLabelBehavior.alwaysHide,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                // To use the playground font, add GoogleFonts package and uncomment
                // fontFamily: GoogleFonts.notoSans().fontFamily,
              ),
              darkTheme: FlexThemeData.dark(
                colors: const FlexSchemeColor(
                  primary: Color(0xff9fc9ff),
                  primaryContainer: Color(0xff00325b),
                  secondary: Color(0xffffb59d),
                  secondaryContainer: Color(0xff872100),
                  tertiary: Color(0xff86d2e1),
                  tertiaryContainer: Color(0xff004e59),
                  appBarColor: Color(0xff872100),
                  error: Color(0xffcf6679),
                ),
                surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                blendLevel: 15,
                appBarStyle: FlexAppBarStyle.background,
                appBarOpacity: 0.90,
                subThemesData: const FlexSubThemesData(
                  blendOnLevel: 30,
                  bottomNavigationBarElevation: 5.5,
                  navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
                  navigationBarUnselectedLabelSchemeColor:
                      SchemeColor.surfaceTint,
                  navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
                  navigationBarUnselectedIconSchemeColor:
                      SchemeColor.surfaceTint,
                  navigationBarIndicatorOpacity: 0.39,
                  navigationBarOpacity: 0.10,
                  navigationBarLabelBehavior:
                      NavigationDestinationLabelBehavior.alwaysHide,
                ),
                visualDensity: FlexColorScheme.comfortablePlatformDensity,
                // To use the playground font, add GoogleFonts package and uncomment
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),

              themeMode: value.tDark ? ThemeMode.dark : ThemeMode.light,

              debugShowCheckedModeBanner: false,

              // home: const BottomNavBar(),
              home: const LoginScreen(),
              //routes
              // routes: {
              //   '/': (context) => study(),
              //   MyRoutes.study: (context) => study(),
              //   MyRoutes.books: (context) => books(),
              //   MyRoutes.videos: (context) => videos(),
              // },
            )),
      ),
    );
  }
}
