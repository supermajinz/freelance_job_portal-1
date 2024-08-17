import 'dart:async';
import 'dart:convert';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/features/chat%20copy/data/message.dart';
import 'package:freelance_job_portal/features/chat/data/models/chat_model.dart';
import 'package:freelance_job_portal/features/chat/data/models/message.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:freelance_job_portal/features/auth/data/auth_token_service.dart';

class ChatService {
  late StompClient _stompClient;
  final AuthTokenService tokenService =
      DependencyInjection.provideAuthTokenService();
  final Map<String, StompUnsubscribe> _subscriptions = {};
  bool _isConnected = false;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;

  ChatService() {
    _initializeStompClient();
  }





  Future<void> _initializeStompClient() async {
    final token = await tokenService.getToken('access_token');
    _stompClient = StompClient(
      config: StompConfig(
        url: 'ws:/${DependencyInjection.baseHost}/ws/websocket',
        onConnect: _onConnect,
        reconnectDelay: const Duration(seconds: 5),
      ),
    );
        // stompConnectHeaders: {'Authorization': 'Bearer $token'},
        // webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
        // beforeConnect: _beforeConnect,
        // onWebSocketError: _onWebSocketError,
        // onStompError: _onStompError,
        // onDisconnect: _onDisconnect,
    _stompClient.activate();
    print("isActive ${_stompClient.isActive}");
  }

  Future<void> connect() async {
    if (!_isConnected) {
      // await _initializeStompClient();
      _stompClient.activate();
    }
  }

  void disconnect() {
    _stompClient.deactivate();
    _isConnected = false;
    _reconnectAttempts = 0;
  }

  void _onConnect(StompFrame frame) {
    print("connected");
    print(frame);
  }
    // _isConnected = true;
    // _reconnectAttempts = 0;
    // _resubscribeAll();

  Future<void> _beforeConnect() async {
    print('Waiting to connect...');
    await Future.delayed(const Duration(milliseconds: 200));
    print('Connecting...');
  }

  void _onWebSocketError(dynamic error) {
    print('WebSocket error: $error');
    _handleReconnect();
  }

  void _onStompError(StompFrame frame) {
    print('STOMP error: ${frame.body}');
    _handleReconnect();
  }

  void _onDisconnect(StompFrame frame) {
    _isConnected = false;
    _handleReconnect();
  }

  void _handleReconnect() {
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _reconnectAttempts++;
      Future.delayed(Duration(seconds: _reconnectAttempts * 5), () {
        connect();
      });
    } else {
      throw ServerFailure(
          errMessage:
              'Failed to reconnect after $_maxReconnectAttempts attempts');
    }
  }

  void _resubscribeAll() {
    _subscriptions.forEach((destination, _) {
      _subscriptions[destination] = _stompClient.subscribe(
        destination: "/user/$destination/queue/messages",
        callback: (StompFrame frame) {
          _handleMessage;
        },
      );
    });
  }

  Future<void> subscribeToChat(String chatId,
      {required void Function(MessageModel msg) callback}) async {
    // await _initializeStompClient();
    if (!_subscriptions.containsKey(chatId)) {
      print("isActive2 ${_stompClient.isActive}");
      print("connection ${_stompClient.config.url}");
      _subscriptions[chatId] = _stompClient.subscribe(
        destination: "/user/$chatId/queue/messages",
        callback: (p0) => _handleMessage(p0, callback),
      );
    }
  }

  Future<void> unsubscribeFromChat(String chatId) async {
    final destination = chatId;
    if (_subscriptions.containsKey(destination)) {
      if (_isConnected) {
        final unsubscribe = _subscriptions.remove(destination);
        if (unsubscribe != null) {
          unsubscribe();
        }
      } else {
        _subscriptions.remove(destination);
      }
    }
  }

  Future<void> sendMessage(String message, ChatRoomModel chat) async {
    // if (message.content.trim().isEmpty) return;
    if(message.trim().isEmpty)return;
    if (!_isConnected) await connect();
    final messagePayload = {
      'senderId': chat.sender.id,
      'recipientId': chat.recipient.id,
      'content': message,
    };

    print("sending $messagePayload to /app/chat");
    _stompClient.send(
      destination: '/app/chat',
      headers: {
        "content-type": "application/json"
      },
      body: json.encode(messagePayload),
    );
  }

  void _handleMessage(StompFrame frame, void Function(MessageModel msg) callback) {
    try {
      final Map<String, dynamic> jsonMessage = json.decode(frame.body!);
      final message = MessageModel.fromJson(jsonMessage);
      callback(message);
    } catch (e) {
      print('Error parsing message: $e');
    }
  }
}
