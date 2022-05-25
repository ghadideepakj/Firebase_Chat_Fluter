import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_flutter/screens/welcome_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Future<FirebaseApp> _initializedFirebase() async {
  //   FirebaseApp firebaseApp = await Firebase.initializeApp();
  //   return firebaseApp;
  // }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDXSmWKhtCrI6xl0fxZOw7z2PzUUgaEr0E',
      appId: '1:954963377161:android:4cd322ac7f3fee1a5d0cd8',
      messagingSenderId: '1234566788',
      projectId: 'flash-chat-5f94b',
      //   authDomain: 'react-native-firebase-testing.firebaseapp.com',
      //   databaseURL: 'https://react-native-firebase-testing.firebaseio.com',
      //   storageBucket: 'react-native-firebase-testing.appspot.com',
      //   measurementId: 'G-F79DJ0VFGS',
    ),
  );
  runApp(const FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: const TextTheme(
      //     bodyText1: TextStyle(color: Colors.white),
      //   ),
      // ),
      //home: ChatScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
