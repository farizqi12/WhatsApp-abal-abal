import 'package:flutter/material.dart';
import 'package:flutter_application_1/paymen.dart';
import 'package:flutter_application_1/chat_admin.dart';
import 'package:flutter_application_1/kelas_web.dart';
import 'package:flutter_application_1/kelas_android.dart';
import 'package:flutter_application_1/kelas_data_analisis.dart';
import 'profil.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lebar dan tinggi dinamis untuk card
    double cardWidth =
        MediaQuery.of(context).size.width * 0.8; // 80% dari lebar layar
    double imageHeight = cardWidth * 0.5; // 50% dari lebar card

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.black87,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                'Selamat datang Muhamad Farizqi'),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 18,
                  ),
                  'Semangat belajarnya Yaa!',
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black87,
              child: Icon(Icons.person, color: Colors.white),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Profil(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
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
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner dengan teks dan card overlay
              Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'img/Banner1.jpg',
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari kelas anda',
                            hintStyle: const TextStyle(color: Colors.black54),
                            prefixIcon:
                                const Icon(Icons.search, color: Colors.black54),
                            filled: true,
                            fillColor: Colors.black38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              // Kategori Kelas
              // Bagian Kategori Kelas
              const Text(
                'Semua Kelas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

// Tambahkan SingleChildScrollView untuk scroll horizontal
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryItem(
                      context,
                      'Android Developer',
                      'img/android-developers.png',
                      Icons.android,
                      Colors.green,
                      const KelasAndroid(),
                    ),
                    const SizedBox(width: 16), // Spasi antar item
                    _buildCategoryItem(
                      context,
                      'Data Analisis',
                      'img/data-analis.jpg',
                      Icons.analytics_rounded,
                      Colors.blue,
                      const KelasDataAnalisis(),
                    ),
                    const SizedBox(width: 16), // Spasi antar item
                    _buildCategoryItem(
                      context,
                      'Front-End Web Developer',
                      'img/front end.png',
                      Icons.web_rounded,
                      Colors.orange,
                      const KelasWeb(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.subscriptions,
                            size: 40,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status Langganan',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Anda belum berlangganan Sintak Class. Pilih paket langganan dan mulai perjalanan Anda menjadi developer profesional.',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Paymen()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Pilih paket langganan',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Program Terbaru
              const Text(
                'Program Terbaru Kami',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCard(
                      'img/flayer1.png',
                      'Coding Camp 2025 powered by DBS Foundation',
                      'Pelatihan teknologi informasi standar tinggi.',
                      cardWidth,
                      imageHeight,
                    ),
                    _buildCard(
                      'img/flayer2.png',
                      'Web Development Bootcamp',
                      'Pelajari dasar hingga mahir pengembangan web.',
                      cardWidth,
                      imageHeight,
                    ),
                    _buildCard(
                      'img/flayer3.png',
                      'Mobile App Mastery',
                      'Kuasai pengembangan aplikasi mobile Android & iOS.',
                      cardWidth,
                      imageHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Tombol Floating
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ChatAdmin()));
        },
        child: const Icon(Icons.mark_chat_unread, color: Colors.white),
      ),
    );
  }

  // Widget kategori kelas
  Widget _buildCategoryItem(BuildContext context, String title, String image,
      IconData icon, Color badgeColor, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: badgeColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 24, color: Colors.white),
              ),
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  // Outline
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.black,
                    ),
                  ),
                  // Main text
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget card program
  Widget _buildCard(String imagePath, String title, String description,
      double cardWidth, double imageHeight) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: cardWidth,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: cardWidth,
                  height: imageHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
