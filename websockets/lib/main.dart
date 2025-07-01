import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _messages = [];

  late StompClient _stompClient;

  final String token =
      "";
  final String doctorUuid = "34352ed2-7a26-4fa1-aebc-98d6da068f8e";
  final String patientUuid = "1e8fd4b3-bccb-46e5-a539-88ebf33e0ab3";

  @override
  void initState() {
    super.initState();

    _stompClient = StompClient(
      config: StompConfig.sockJS(
        url: '',
        onConnect: onConnect,
        beforeConnect: () async {
          debugPrint('Connecting...');
          await Future.delayed(const Duration(milliseconds: 200));
        },
        stompConnectHeaders: {
          'Authorization': token,
        },
        webSocketConnectHeaders: {
          'Authorization': token,
        },
        onWebSocketError: (dynamic error) => debugPrint('WebSocket Error: $error'),
        onStompError: (frame) => debugPrint('STOMP Error: ${frame.body}'),
        onDisconnect: (_) => debugPrint('Disconnected'),
      ),
    );

    _stompClient.activate();
  }

  void onConnect(StompFrame frame) {
    final destination = "/topic/chat.$doctorUuid.$patientUuid";
    _stompClient.subscribe(
      destination: destination,
      callback: (frame) {
        final body = jsonDecode(frame.body!);
        final senderRole = body['senderRole'];
        final content = body['content'];

        setState(() {
          _messages.add("🟢 $senderRole: $content");
        });

        _scrollToBottom();
      },
    );

    setState(() {
      _messages.add("✅ Conectado como PACIENTE");
    });
  }

  void sendMessage() {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    final payload = {
      'content': content,
      'type': 'TEXT',
      'fileUrl': null,
    };

    final destination = "/app/chat/$doctorUuid/$patientUuid/send";
    _stompClient.send(destination: destination, body: jsonEncode(payload));

    setState(() {
    //  _messages.add("📤 Tú: $content");
      _controller.clear();
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _stompClient.deactivate();
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat como PACIENTE")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(_messages[index]),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Escribe un mensaje...",
                    ),
                  ),
                ),
                IconButton(
                  onPressed: sendMessage,
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}