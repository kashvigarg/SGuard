import 'package:empowering_humanity/view/home_page.dart';
import 'package:empowering_humanity/view/map/map_view.dart';
import 'package:empowering_humanity/view/registration/profile_preview.dart';
import 'package:empowering_humanity/view/registration/profile_setup.dart';
import 'package:empowering_humanity/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';
import 'temp_page.dart';
import 'view/dashboard/user_dashboard.dart';
import 'view/login/login_as.dart';
import 'view/signup/sign_as.dart';
import 'view/signup/signup_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = AppBlocObserver();

//   await Firebase.initializeApp();

//   final authenticationRepository = AuthenticationRepository();
//   await authenticationRepository.user.first;

//   runApp(App(authenticationRepository: authenticationRepository));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // MyAppMap.initState();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => SplashScreen(), routes: [
    GoRoute(path: 'main', builder: (context, state) => const HomePage()),
    GoRoute(
      path: 'loginas',
      builder: (context, state) => const LoginAs(),
    ),
    GoRoute(
      path: 'user2',
      builder: (context, state) => const UserDashboard(),
    ),
    GoRoute(
      path: 'maploc',
      builder: (context, state) => const MapView(),
    ),
    GoRoute(
        path: 'profile', builder: ((context, state) => const ProfilePreview())),
    GoRoute(
      path: 'editprofile',
      builder: (context, state) => const ProfileSetUp(),
    ),
    GoRoute(
      path: 'signinas',
      builder: (context, state) => const SignAs(),
    ),
    GoRoute(
      path: 'user',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: 'temp',
      builder: (context, state) => const TempPage(),
    ),
  ])
]);
