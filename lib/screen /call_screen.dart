// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';

// class CallScreen extends StatefulWidget {
//   final String channelName;
//   final String token;
//   final bool isVideo;

//   CallScreen({required this.channelName, required this.token, required this.isVideo});

//   @override
//   _CallScreenState createState() => _CallScreenState();
// }

// class _CallScreenState extends State<CallScreen> {
//   late final RtcEngine _agoraEngine;
//   List<int> remoteUids = [];

//   @override
//   void initState() {
//     super.initState();
//     _initializeAgora();
//   }

//   Future<void> _initializeAgora() async {
//     _agoraEngine = createAgoraRtcEngine();
//     await _agoraEngine.initialize(RtcEngineContext(
//       appId: 'YOUR_AGORA_APP_ID',
//     ));

//     _agoraEngine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           print('Joined channel: ${widget.channelName}');
//         },
//         onUserJoined: (connection, uid, elapsed) {
//           setState(() => remoteUids.add(uid));
//         },
//       ),
//     );

//     await _agoraEngine.joinChannel(
//       TokenOptions(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             if (widget.isVideo)
//               _renderVideoViews(),
//             Positioned(
//               bottom: 20,
//               child: IconButton(
//                 icon: Icon(Icons.call_end, color: Colors.red),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _renderVideoViews() {
//     return Container();
//   }