import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'signalling.dart';

// class SignalClass extends StatelessWidget {
//   const SignalClass({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: LiveStreamView(),
//     );
//   }
// }

class LiveStreamView extends StatefulWidget {
  LiveStreamView({Key? key}) : super(key: key);

  @override
  _LiveStreamViewState createState() => _LiveStreamViewState();
}

class _LiveStreamViewState extends State<LiveStreamView> {
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () async {
                  signaling.openUserMedia(_localRenderer, _remoteRenderer);
                  roomId = await signaling.createRoom(_remoteRenderer);
                  textEditingController.text = roomId!;
                  setState(() {});
                },
                child: Text("Start Streaming"),
              ),
              SizedBox(
                width: 8,
              ),
              // ElevatedButton(
              //   onPressed: ()  {

              //   },
              //   child: Text("Create room"),
              // ),
              // SizedBox(
              //   width: 8,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Add roomId
              //     signaling.joinRoom(
              //       textEditingController.text,
              //       _remoteRenderer,
              //     );
              //   },
              //   child: Text("Join room"),
              // ),
              // SizedBox(
              //   width: 8,
              // ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  signaling.hangUp(_localRenderer);
                },
                child: Text("Hangup"),
              )
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  //Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("Join the following Room: "),
          //       Flexible(
          //         child: TextFormField(
          //           controller: textEditingController,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SizedBox(height: 8)
        ],
      ),
    );
  }
}
