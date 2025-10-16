import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "../main.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter password' : null,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/signup");
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          // ✅ 로그인 성공 시 다음 페이지 이동
                          if (context.mounted) {
                            final myAppState =
                                Provider.of<MyAppState>(context, listen: false);
                            myAppState
                                .setUser(credential.user); // 🔹 로그인 사용자 저장
                            print(credential.user);
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        } on FirebaseAuthException catch (e) {
                          String message;
                          switch (e.code) {
                            case 'invalid-credential':
                              message = '이메일 또는 비밀번호가 올바르지 않습니다.';
                              break;
                            case 'user-disabled':
                              message = '해당 계정은 비활성화되었습니다.';
                              break;
                            default:
                              message = '로그인 중 오류가 발생했습니다. (${e.code})';
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(message),
                                backgroundColor: Colors.red),
                          );
                        } catch (e) {
                          print('예외 발생: $e');
                        }
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
