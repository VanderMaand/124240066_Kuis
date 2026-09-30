import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/home_page.dart';

import '../utils/constants.dart';

import 'main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller untuk membaca teks yang diketik pada TextField.
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Menyembunyikan / menampilkan password.
  bool _obscurePassword = true;

  @override
  void dispose() {
    // Wajib dibersihkan agar tidak terjadi memory leak.
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Memeriksa kredensial lalu menentukan tindakan selanjutnya.
  void _handleLogin() {
    final username = _usernameController.text.trim();
    // Password dibandingkan tanpa peduli huruf besar/kecil.
    final password = _passwordController.text.trim().toLowerCase();

    final isValid =
        username == kValidUsername && password == kValidPassword.toLowerCase();

    if (isValid) {
      // pushReplacement: mengganti halaman saat ini dengan MainPage.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
      );
    } else {
      // Hapus snackbar lama (jika ada) agar tidak menumpuk.
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text(kLoginFailedMessage),
            backgroundColor: Colors.red, // wajib merah sesuai soal
            behavior: SnackBarBehavior.floating,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          // SingleChildScrollView mencegah overflow saat keyboard muncul.
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ---- Field username ----
                    TextField(
                      controller: _usernameController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // ---- Field password ----
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      onSubmitted: (_) => _handleLogin(),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => setState(
                            () => _obscurePassword = !_obscurePassword,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ---- Tombol login ----
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonal(
                        onPressed: _handleLogin,
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
