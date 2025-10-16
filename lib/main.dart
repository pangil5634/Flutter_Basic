import 'package:basic_flutter/firebase/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 🔹 Firebase 초기화 (에러 핸들링 포함)
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase 초기화 중 오류 발생: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false, // 🔹 디버그 배너 제거
          title: 'Flutter Firebase',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: MyRoutes()),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // ✅ 앱 상태 관련 변수/메서드 추가
  User? _currentUser;

  User? get currentUser => _currentUser;

  // 🔹 로그인 시 호출
  void setUser(User? user) {
    _currentUser = user;
    notifyListeners();
  }

  // 🔹 로그아웃 시 호출
  void clearUser() {
    _currentUser = null;
    notifyListeners();
  }
}
