import 'package:flutter/material.dart';
import 'package:healthypet/models/doctor_model.dart';

class ChatDetail extends StatefulWidget {
  final DoctorModel doctor;

  ChatDetail({required this.doctor});

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  TextEditingController _messageController = TextEditingController();
  List<String> messages = []; // List pesan
  FocusNode _messageFocusNode = FocusNode(); // Tambahkan FocusNode

  @override
  void dispose() {
    _messageFocusNode.dispose(); // Pastikan untuk membuang FocusNode saat widget di-dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor.name),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                String message = messages[index];
                return ListTile(
                  title: Text(message),
                );
              },
            ),
          ),
          _buildChatInputField(),
        ],
      ),
    );
  }

  Widget _buildChatInputField() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message',
              ),
              focusNode: _messageFocusNode, // Set focus node
              onSubmitted: (_) => _sendMessage(), // Handle ketika teks selesai
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String newMessage = _messageController.text;
    if (newMessage.isNotEmpty) {
      setState(() {
        messages.add(newMessage); // Menambahkan pesan ke daftar pesan
      });
      _messageController.clear();
      _messageFocusNode.requestFocus(); // Fokuskan kembali ke TextField setelah mengirim pesan
    }
  }
}
