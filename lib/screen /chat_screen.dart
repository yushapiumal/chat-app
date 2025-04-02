// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:socket_io_client/socket_io_client.dart';

// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final Socket socket = io('http://your-backend-url',
//       OptionBuilder().setTransports(['websocket']).build());
//   final TextEditingController _messageController = TextEditingController();
//   List<Message> _messages = [];
//   String? _secretKey;

//   @override
//   void initState() {
//     super.initState();
//     _connectSocket();
//     _loadEncryptionKey();
//   }

//   void _connectSocket() {
//     socket.on('message', (data) {
//       final decrypted = _decryptMessage(data['content']);
//       setState(() {
//         _messages.add(Message(
//           content: decrypted,
//           isMe: false,
//           timestamp: DateTime.parse(data['timestamp']),
//         ));
//       });
//     });
//   }

//   String _decryptMessage(String encrypted) {
//     // Implement AES decryption
//     return encrypted;
//   }

//   void _sendMessage() {
//     final encrypted = _encryptMessage(_messageController.text);
//     socket.emit('private-message', {
//       'sender': 'currentUserId',
//       'receiver': 'partnerId',
//       'content': encrypted,
//       'timestamp': DateTime.now().toString(),
//       'type': 'text'
//     });
//     _messageController.clear();
//   }

//   void _initiateCall(bool isVideo) async {
//     final channelName = 'couple_${DateTime.now().millisecondsSinceEpoch}';
//     final token = await _getAgoraToken(channelName);
    
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CallScreen(
//           channelName: channelName,
//           token: token,
//           isVideo: isVideo,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Private Couple Chat'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.video_call),
//             onPressed: () => _initiateCall(true),
//           selectedIcon: IconButton(
//             icon: Icon(Icons.call),
//             onPressed: () => _initiateCall(false),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (ctx, i) => ChatBubble(
//                 message: _messages[i],
//                 secretKey: _secretKey,
//               ),
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               decoration: InputDecoration(hintText: 'Type a message...'),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: _sendMessage,
//           ),
//         ],
//       ),
//     );
//   }
// }