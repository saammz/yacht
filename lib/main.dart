import 'package:airbnb_app_ui/Provider/favorite_provider.dart';
import 'package:airbnb_app_ui/firebase_options.dart';
import 'package:airbnb_app_ui/model/place_model.dart';
import 'package:airbnb_app_ui/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: lightTheme(context),
        home: SplashScreen(),
      ),
    );
  }
}

// class UploadData extends StatelessWidget {
//   const UploadData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             savePlacesToFirebase();
//           },
//           child: Text('Upload data'),
//         ),
//       ),
//     );
//   }
// }
