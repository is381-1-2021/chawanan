import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:flutter/material.dart';

class EightPage extends StatelessWidget {
  EightPage({ Key? key }) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self')
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Web Socket'),
    ),  
    body: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Send a message',
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          StreamBuilder(
            stream: _channel.stream,
            builder: (context, snapshot){
              return Text(snapshot.hasData ? '${snapshot.data}':'');
            },
          ),
        ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        if (_controller.text.isNotEmpty) {
          _channel.sink.add(_controller.text);
        }
      },
      tooltip: 'Send message',
      child: const Icon(Icons.send),
      ),
    );
  }

  void dispose() {
    _channel.sink.close();
  }
}