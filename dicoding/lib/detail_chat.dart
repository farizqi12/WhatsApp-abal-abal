import 'package:flutter/material.dart';
import 'modal/kontak.dart';

class DetailChat extends StatefulWidget {
  const DetailChat({super.key, required this.kontak});

  // Menerima data kontak
  final Kontak kontak;

  @override
  State<DetailChat> createState() => _DetailChatState();
}

class _DetailChatState extends State<DetailChat> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController(); // Controller untuk ListView

  // Simpan pesan yang dikirim oleh user
  List<String> userMessages = [];

  @override
  Widget build(BuildContext context) {
    // Mengakses data kontak
    final item = widget.kontak;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 22, // Ukuran avatar
              child: Text(
                item.name[0], // Inisial nama
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(width: 10), // Jarak antara avatar dan nama
            Text(
              item.name, // Nama kontak
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(color: Colors.white, Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(color: Colors.white, Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(color: Colors.white, Icons.menu_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          // Bagian untuk menampilkan daftar pesan
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Tambahkan controller
              itemCount: item.chat.length + userMessages.length,
              itemBuilder: (context, index) {
                // Gabungkan pesan user dan kontak
                final combinedMessages = [
                  ...item.chat.map((message) => {'isUser': false, 'message': message}),
                  ...userMessages.map((message) => {'isUser': true, 'message': message}),
                ];

                // Pesan sesuai urutan
                final messageData = combinedMessages[index];
                final isUser = messageData['isUser'] as bool;
                final message = messageData['message'] as String;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isUser ? Colors.blue[300] : Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
                          bottomRight: isUser ? Radius.zero : const Radius.circular(12),
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
