/// ============================================================
/// profile_page.dart
/// ------------------------------------------------------------
/// Halaman profil pengguna.
///  - Menampilkan foto profil (avatar) berbentuk lingkaran.
///  - Warna avatar dapat diganti dengan memilih salah satu
///    warna pada palet di bawahnya.
///  - Menampilkan nama, NIM, dan prodi.
///  - Tombol logout kembali ke LoginPage (pushReplacement).
/// ============================================================
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// Pilihan warna yang tersedia untuk foto profil.
  static const List<Color> _palette = [
    Colors.deepPurple,
    Colors.blue,
    Colors.teal,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.blueGrey,
  ];

  /// Warna avatar yang sedang dipilih (default: ungu).
  Color _avatarColor = Colors.deepPurple;

  /// Warna ikon di dalam avatar; otomatis putih/gelap
  /// menyesuaikan terang-gelapnya warna latar agar tetap terbaca.
  Color get _iconColor =>
      ThemeData.estimateBrightnessForColor(_avatarColor) == Brightness.dark
      ? Colors.white
      : Colors.black87;

  /// Logout: ganti halaman saat ini dengan LoginPage.
  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ---- Foto profil (warna berubah dengan animasi halus) ----
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _avatarColor,
                boxShadow: [
                  BoxShadow(
                    color: _avatarColor.withOpacity(0.4),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(Icons.person, size: 64, color: _iconColor),
            ),
            const SizedBox(height: 16),

            // ---- Nama & prodi di bawah foto ----
            const Text(
              kProfileName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(kProfileProdi, style: TextStyle(color: Colors.grey.shade600)),
            const SizedBox(height: 24),

            // ---- Palet pemilih warna ----
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Ganti Warna Foto Profil',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: _palette.map((color) {
                final isSelected = color == _avatarColor;
                return GestureDetector(
                  onTap: () => setState(() => _avatarColor = color),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: color,
                      // Cincin tebal menandai warna yang sedang aktif.
                      border: Border.all(
                        color: isSelected ? Colors.black87 : Colors.transparent,
                        width: 2.5,
                      ),
                    ),
                    child: isSelected
                        ? Icon(
                            Icons.check,
                            size: 20,
                            color:
                                ThemeData.estimateBrightnessForColor(color) ==
                                    Brightness.dark
                                ? Colors.white
                                : Colors.black87,
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // ---- Kartu informasi akun ----
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.badge_outlined),
                    title: Text('Nama'),
                    subtitle: Text(kProfileName),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.numbers),
                    title: Text('NIM'),
                    subtitle: Text(kValidUsername),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.school_outlined),
                    title: Text('Program Studi'),
                    subtitle: Text(kProfileProdi),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ---- Tombol logout ----
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _logout,
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
