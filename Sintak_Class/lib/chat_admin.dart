import 'package:flutter/material.dart';

class ChatAdmin extends StatefulWidget {
  const ChatAdmin({super.key});

  @override
  State<ChatAdmin> createState() => _ChatAdmin();
}

class _ChatAdmin extends State<ChatAdmin> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController =
  ScrollController(); // Controller untuk ListView

  // Simpan pesan yang dikirim oleh user
  List<String> userMessages = [];

  // Simpan pesan yang dikirim oleh admin
  List<String> adminMessages = [
    "Halo, ada yang bisa kami bantu?",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 60,
        backgroundColor: Colors.black87,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 22, // Ukuran avatar
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10), // Jarak antara avatar dan nama
            Text(
              "Admin",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Bagian untuk menampilkan daftar pesan
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                controller: _scrollController, // Tambahkan controller
                itemCount: userMessages.length + adminMessages.length,
                itemBuilder: (context, index) {
                  // Gabungkan pesan admin dan user
                  final combinedMessages = [
                    ...adminMessages.map(
                            (message) => {'isUser': false, 'message': message}),
                    ...userMessages.map(
                            (message) => {'isUser': true, 'message': message}),
                  ];

                  // Pesan sesuai urutan
                  final messageData = combinedMessages[index];
                  final isUser = messageData['isUser'] as bool;
                  final message = messageData['message'] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    child: Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.blue[300] : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(12),
                            topRight: const Radius.circular(12),
                            bottomLeft: isUser
                                ? const Radius.circular(12)
                                : Radius.zero,
                            bottomRight: isUser
                                ? Radius.zero
                                : const Radius.circular(12),
                          ),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: isUser ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Bagian untuk input teks
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue, size: 30),
                  onPressed: () {
                    final text = _messageController.text.trim();
                    if (text.isNotEmpty) {
                      setState(() {
                        userMessages.add(text); // Tambahkan pesan user
                      });
                      _messageController.clear(); // Kosongkan input

                      // Scroll ke bawah secara otomatis
                      Future.delayed(const Duration(milliseconds: 100), () {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });

                      // Simulasikan respons admin
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() {
                          adminMessages.add(
                              "Kami telah menerima pesan Anda, terima kasih!");
                        });

                        // Scroll ke bawah secara otomatis
                        Future.delayed(const Duration(milliseconds: 100), () {
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        });
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
