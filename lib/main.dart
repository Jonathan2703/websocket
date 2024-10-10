import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WebSocketChannel channel = WebSocketChannel.connect(Uri.parse('ws://192.168.3.28:8080/ws/count'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Personas en Camino')),
        body: StreamBuilder(
          stream: channel.stream,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                snapshot.hasData ? '${snapshot.data}' : 'Esperando...',
                style: const TextStyle(fontSize: 24),
              ),
            );
          },
        ),
      ),
    );
  }
}
