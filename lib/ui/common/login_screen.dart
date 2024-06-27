import 'package:flutter/material.dart';
import 'package:play_at/ui/common/signup_screen.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import 'forgot_password_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await authService.signIn(emailController.text, passwordController.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login failed: $e')),
                  );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 20),
            const Text('Or login with:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () async {
                    try {
                      await authService.signInWithGoogle();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Google login failed: $e')),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () async {
                    try {
                      await authService.signInWithFacebook();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Facebook login failed: $e')),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () async {
                    try {
                      await authService.signInWithApple();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Apple login failed: $e')),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () async {
                    try {
                      await authService.signInWithKakao();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kakao login failed: $e')),
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () async {
                    try {
                      await authService.signInWithNaver();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Naver login failed: $e')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
