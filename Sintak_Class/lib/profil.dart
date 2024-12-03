import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'login_screen.dart';


class Profil extends StatelessWidget {
  const Profil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilku'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 120),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 30,
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            'Akun Saya',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.mode_edit_outline_outlined,
                                color: Colors.grey, size: 18),
                            onPressed: () {
                              // Tambahkan aksi untuk mengedit nama di sini
                            },
                          ),
                        ],
                      ),
                      const Text(
                        'akunsaya123@gmail.com',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          Icon(Icons.emoji_events,
                              color: Colors.orange, size: 20),
                          SizedBox(width: 5),
                          Text(
                            'Poin: 0 Pt ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                          Text(" | "),
                          Icon(Icons.military_tech,
                              color: Colors.blue, size: 20),
                          SizedBox(width: 5),
                          Text(
                            '150 XP',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildMenuItem(
                  context,
                  icon: Icons.home,
                  text: "Dashboard",
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                        const Dashboard(),
                        transitionsBuilder: (context, animation,
                            secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.face,
                  text: "Profil Saya",
                  onTap: () {
                    // Tambahkan aksi untuk Profil Saya
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  text: "Pengaturan",
                  onTap: () {
                    // Tambahkan aksi untuk Pengaturan
                  },
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.logout,
                  text: "Log out",
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                          (route) => false, // Hapus semua rute sebelumnya
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
        required String text,
        Color textColor = Colors.black,
        Color iconColor = Colors.black,
        required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 70),
        child: Card(
          child: ListTile(
            leading: Icon(icon, color: iconColor),
            title: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: textColor == Colors.red
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
