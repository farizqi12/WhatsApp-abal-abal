import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  final String text;

  const Profil({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setelan'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 100), // Batas tinggi maksimum
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Akun Saya',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Aku sibuk, telfon saja kalau penting',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 70), // Batas tinggi minimum
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Privasi'),
                        onTap: () {
                          // Kosong, tidak melakukan apapun
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 70), // Batas tinggi minimum
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.face),
                        title: const Text('Avatar'),
                        onTap: () {
                          // Kosong, tidak melakukan apapun
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 70), // Batas tinggi minimum
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.storage_outlined),
                        title: const Text('Kelola Penyimpanan'),
                        onTap: () {
                          // Kosong, tidak melakukan apapun
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
