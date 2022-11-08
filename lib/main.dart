import 'package:empowering_humanity/view/live_streams/live_stream_view.dart';
import 'package:empowering_humanity/view/home_page.dart';
import 'package:empowering_humanity/view/login/login_page.dart';
import 'package:empowering_humanity/view/map/map_view.dart';
import 'package:empowering_humanity/view/registration/profile_preview.dart';
import 'package:empowering_humanity/view/registration/profile_setup.dart';
import 'package:empowering_humanity/view/registration/registration_form.dart';
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
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

final _router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(path: 'main', builder: (context, state) => HomePage()),
        GoRoute(
          path: 'loginas',
          builder: (context, state) => const LoginAs(),
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: 'registration',
          builder: (context, state) => const RegistrationForm(),
        ),
        GoRoute(
          path: 'user',
          builder: (context, state) => const UserDashboard(),
        ),
        GoRoute(
          path: 'maploc',
          builder: (context, state) => const MapView(),
        ),
        GoRoute(
            path: 'profile', builder: ((context, state) => ProfilePreview())),
        GoRoute(
          path: 'editprofile',
          builder: (context, state) => const ProfileSetUp(),
        ),
        GoRoute(
          path: 'signinas',
          builder: (context, state) => const SignAs(),
        ),
        GoRoute(
          path: 'signup',
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: 'temp',
          builder: (context, state) => const TempPage(),
        ),
        GoRoute(
          path: 'livestream',
          builder: (context, state) => LiveStreamView(),
        ),
      ])
]);
