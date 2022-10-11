import 'package:empowering_humanity/constants/size_config.dart';
import 'package:empowering_humanity/view/home_page.dart';
import 'package:empowering_humanity/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = AppBlocObserver();

//   await Firebase.initializeApp();

//   final authenticationRepository = AuthenticationRepository();
//   await authenticationRepository.user.first;

//   runApp(App(authenticationRepository: authenticationRepository));
// }

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(home: SplashScreen());
  }
}
