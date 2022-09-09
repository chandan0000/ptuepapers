import 'package:go_router/go_router.dart';
import 'package:ptuepapers/config/routes/routesname.dart';
import 'package:ptuepapers/screens/authscreens/forgetpassword.dart';
import 'package:ptuepapers/screens/authscreens/loginScreen.dart';
import 'package:ptuepapers/screens/authscreens/signUp.dart';
import 'package:ptuepapers/screens/bottomnavbar/bottomnavBar.dart';

import 'ErrorScreen.dart';

class RouteConfig {
  // RouteConfig(this.loginState);
  // final LoginState loginState;

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    // refreshListenable: loginState,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RoutesName.signIn,
        path: '/',
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        name: RoutesName.signUp,
        path: '/signup',
        builder: (context, state) => SignUp(
          key: state.pageKey,
        ),
      ),
      GoRoute(
          name: RoutesName.forgetPassowrd,
          path: '/forgetpassword',
          builder: (context, state) {
            // final parms = state.extra! as Map<String, Object>;
            // final name = parms['name'] as String;
            return Forgetpassword(
              key: state.pageKey,
            );
          }),
      GoRoute(
        name: RoutesName.bottomNavBar,
        path: '/bottomnavbar',
        builder: (context, state) => BottomNavBar(
          key: state.pageKey,
        ),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(
      state.error!,
      key: state.pageKey,
    ),
  );
}
