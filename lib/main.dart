import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example_one/firebase_options.dart';
import 'package:firebase_example_one/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            centerTitle: true,
            title: const Text(
              'Giriş Ekranı',
            ),
          ),
          body: Center(
            child: Container(
              height: 400,
              width: 350,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.deepPurple)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textMethod(_nameController, 'İsim:'),
                  const SizedBox(height: 20.0),
                  textMethod(_emailController, 'E-posta:'),
                  const SizedBox(height: 20.0),
                  textMethod(_passwordController, 'Şifre'),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      AuthService().signUp(context,
                          name: _nameController.text,
                          mail: _emailController.text,
                          password: _passwordController.text);
                      // AuthService().registerUser(
                      //     name: _nameController.text,
                      //     mail: _emailController.text,
                      //     password: _passwordController.text);
                      // String email = _emailController.text;
                      // String password = _passwordController.text;
                      // Giriş işlemlerini burada gerçekleştirin
                    },
                    child: const Text('Giriş Yap'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget textMethod(TextEditingController controller, String text) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FCM Bildirim Örneği',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   @override
//   void initState() {
//     super.initState();
//     _firebaseMessaging.requestPermission(
//       announcement: true,
//       carPlay: true,
//       criticalAlert: true,
//     );
//     _firebaseMessaging.getToken().then((token) {
//       print('FCM Token: $token');
//     });

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print('Bildirim alındı: ${message.notification!.title}');
//       // Bildirim alındığında yapılacak işlemleri burada gerçekleştirin
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print('Uygulama açıldı: ${message.notification!.title}');
//       // Bildirim tıklandığında yapılacak işlemleri burada gerçekleştirin
//     });

//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }

//   Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     print('Arka planda bildirim alındı: ${message.notification!.title}');
//     // Arka planda bildirim alındığında yapılacak işlemleri burada gerçekleştirin
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FCM Bildirim Örneği'),
//       ),
//       body: Center(
//         child: Text(
//           'Firebase Messaging ile bildirimleri almak için uygulamayı çalıştırın.',
//         ),
//       ),
//     );
//   }
// }
