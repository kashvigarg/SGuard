import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:empowering_humanity/app/app.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = AppBlocObserver();

//   await Firebase.initializeApp();

//   final authenticationRepository = AuthenticationRepository();
//   await authenticationRepository.user.first;

//   runApp(App(authenticationRepository: authenticationRepository));
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UI wip",
    );
  }
}
