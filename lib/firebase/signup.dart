import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfrimController =
      TextEditingController();

  String? _errorMessage; // 🔹 에러 메시지를 담을 상태 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
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
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordConfrimController,
                decoration:
                    const InputDecoration(labelText: 'Password Confirm'),
                obscureText: true,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter password Confirm'
                    : null,
              ),
              const SizedBox(height: 24),

              // 🔹 에러 메시지를 Text로 표시
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _errorMessage = null; // 버튼 클릭 시 기존 에러 초기화
                    });

                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      // 회원가입 성공 시 이동 또는 알림
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('회원가입 성공! 로그인 페이지로 이동합니다 🎉'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        // ✅ /login으로 이동 (뒤로가기 불가)
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        if (e.code == 'weak-password') {
                          _errorMessage = '비밀번호가 너무 약합니다.';
                        } else if (e.code == 'email-already-in-use') {
                          _errorMessage = '이미 사용 중인 이메일입니다.';
                        } else if (e.code == 'invalid-email') {
                          _errorMessage = '올바른 이메일 형식이 아닙니다.';
                        } else {
                          _errorMessage = '회원가입 중 오류가 발생했습니다. (${e.code})';
                        }
                      });
                    } catch (e) {
                      setState(() {
                        _errorMessage = '예기치 못한 오류가 발생했습니다.';
                      });
                    }
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
