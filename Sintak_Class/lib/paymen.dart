import 'package:flutter/material.dart';

class Paymen extends StatelessWidget {
  const Paymen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Berlangganan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black87,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSubscriptionCard(
              title: 'Langganan 1 bulan (30 hari)',
              price: 'Rp 1,500,000',
              buttonText: 'Pilih paket',
              onTap: () {
                // Logika untuk paket 1 bulan
              },
            ),
            const SizedBox(height: 10),
            _buildSubscriptionCard(
              title: 'Langganan 3 bulan (90 hari)',
              price: 'Rp 4,500,000',
              buttonText: 'Pilih paket',
              onTap: () {
                // Logika untuk paket 3 bulan
              },
            ),
            const SizedBox(height: 10),
            _buildSubscriptionCardWithBadge(
              badgeText: 'Hemat 10%',
              title: 'Langganan 6 bulan (180 hari)',
              price: 'Rp 8,100,000',
              buttonText: 'Pilih paket',
              onTap: () {
                // Logika untuk paket 6 bulan
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kartu langganan biasa
  Widget _buildSubscriptionCard({
    required String title,
    required String price,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87, // Warna tombol
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12), // Padding tombol
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk kartu langganan dengan badge
  Widget _buildSubscriptionCardWithBadge({
    required String badgeText,
    required String title,
    required String price,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Stack(
      children: [
        _buildSubscriptionCard(
          title: title,
          price: price,
          buttonText: buttonText,
          onTap: onTap,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badgeText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
