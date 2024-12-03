import 'package:flutter/material.dart';

class KelasDataAnalisis extends StatelessWidget {
  const KelasDataAnalisis({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar
    final screenWidth = MediaQuery.of(context).size.width;

    // Menentukan jumlah kolom grid berdasarkan lebar layar
    int crossAxisCount = 2;
    if (screenWidth > 600 && screenWidth <= 900) {
      crossAxisCount = 3; // Untuk layar tablet kecil
    } else if (screenWidth > 900) {
      crossAxisCount = 4; // Untuk layar tablet besar
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Analisis',
          style: TextStyle(color: Colors.white), // Teks menjadi putih
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(
          color: Colors.white, // Ikon AppBar menjadi putih
        ),
        actionsIconTheme: const IconThemeData(
          color: Colors.white, // Ikon di sisi kanan AppBar menjadi putih
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kelas yang tersedia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildKelasItem(
                    context,
                    title: 'HTML Dasar',
                    icon: Icons.code,
                    color: Colors.blue,
                    routeName: '/htmlDasar',
                  ),
                  _buildKelasItem(
                    context,
                    title: 'CSS Styling',
                    icon: Icons.palette,
                    color: Colors.green,
                    routeName: '/cssStyling',
                  ),
                  _buildKelasItem(
                    context,
                    title: 'JavaScript Lanjutan',
                    icon: Icons.javascript,
                    color: Colors.yellow,
                    routeName: '/javascriptLanjutan',
                  ),
                  _buildKelasItem(
                    context,
                    title: 'Framework React',
                    icon: Icons.web,
                    color: Colors.purple,
                    routeName: '/frameworkReact',
                  ),
                  _buildKelasItem(
                    context,
                    title: 'Backend Node.js',
                    icon: Icons.storage,
                    color: Colors.orange,
                    routeName: '/backendNode',
                  ),
                  _buildKelasItem(
                    context,
                    title: 'Database MongoDB',
                    icon: Icons.storage_outlined,
                    color: Colors.red,
                    routeName: '/databaseMongo',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk setiap item kelas
  Widget _buildKelasItem(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required String routeName,
      }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman koridor kelas
        Navigator.pushNamed(context, routeName);
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
