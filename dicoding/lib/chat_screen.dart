import 'package:flutter/material.dart';
import 'modal/kontak.dart';
import 'detail_chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _deleteChat(int index) {
    setState(() {
      kontak.removeAt(index);
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Chat'),
          content: const Text('Apakah Anda yakin ingin menghapus chat ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _deleteChat(index);
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: kontak.length,
        itemBuilder: (context, index) {
          final item = kontak[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(item.name[0]), // Inisial nama
              ),
              title: Text(
                item.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.chat.isNotEmpty ? item.chat[0] : ' '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailChat(kontak: item),
                  ),
                );
              },
              onLongPress: () {
                _showDeleteConfirmationDialog(context, index);
              },
            ),
          );
        },
      ),
    );
  }
}
