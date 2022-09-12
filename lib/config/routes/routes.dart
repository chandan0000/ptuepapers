import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:ptuepapers/config/routes/routesname.dart';
import 'package:ptuepapers/config/webbrowser/openbrowser.dart';
import 'package:ptuepapers/controller/authstat.dart';
import 'package:ptuepapers/screens/authscreens/loginScreen.dart';
import 'package:ptuepapers/screens/authscreens/signUp.dart';
import 'package:ptuepapers/screens/bottomnavbar/bottomnavBar.dart';

import '../../screens/authscreens/forgetpassword.dart';
import 'ErrorScreen.dart';

 
class RouteConfig {
  static final GoRouter router = GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RoutesName.signIn,
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder:
              ((context, animation, secondaryAnimation, child) =>
                  ScaleTransition(
                    scale: animation,
                    child: const LoginScreen(),
                  )),
        ),
      ),
      GoRoute(
        name: RoutesName.signUp,
        path: '/signup',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: SignUp(key: state.pageKey),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(
            scale: animation,
            child: const SignUp(),
          ),
        ),
      ),
      GoRoute(
        name: RoutesName.forgetPassowrd,
        path: '/forgetpassword',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              ScaleTransition(
            scale: animation,
            child: Forgetpassword(),
          ),
        ),
      ),
      GoRoute(
          name: RoutesName.bottomNavBar,
          path: '/bottomnavbar',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const BottomNavBar(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                position: Tween<Offset>(
                  //Tween<Offset>
                  begin: const Offset(0.0, 1.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: const BottomNavBar(),
              ),
            );
          }),
      GoRoute(
          name: RoutesName.inAppBrowserPage,
          path: '/inappbrowserpage:',
          pageBuilder: (context, state) {
            final urlweb =
                state.queryParams['urlweb'] ?? 'https://www.google.com';
            return CustomTransitionPage(
              key: state.pageKey,
              child: InAppBrowserPage(
                urlWeb: urlweb,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: InAppBrowserPage(
                  urlWeb: urlweb,
                ),
              ),
            );
          }),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: ErrorScreen(
        state.error!,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          RotationTransition(
        turns: animation,
        child: ErrorScreen(
          state.error!,
        ),
      ),
    ),
    // redirect to the login page if the user is not logged in
  );
}





















      // GoRoute(
      //   name: RoutesName.forgetPassowrd,
      //   path: '/forgetpassword',
      //   builder: (context, state) {
      // final parms = state.extra! as Map<String, Object>;
      // final name = parms['name'] as String;
      //     return Forgetpassword(
      //       key: state.pageKey,
      //     );
      //   },

      // ),


// debugLogDiagnostics: true,
       // redirect: (state) {
    //   final loggIn = auth.isLoggedIn;
    //   final isLogging = state.location == '/';
    //   return null;
    // },