import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:sample_airbnb_app/Provider/favorite_provider.dart';
import 'package:sample_airbnb_app/view/login_screen.dart';
import 'package:sample_airbnb_app/view/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => FavoriteProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AppMainScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}

// class UploadDataInfirebase extends StatelessWidget {
//   const UploadDataInfirebase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             saveCategoryItems();
//           },
//           child: Text('Upload Data'),
//         ),
//       ),
//     );
//   }
// }
