import 'dart:async';
import 'dart:convert';
import 'package:freelance_job_portal/core/errors/failures.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
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
        url: 'ws://localhost:8080/ws',
        onConnect: _onConnect,
        beforeConnect: _beforeConnect,
        onWebSocketError: _onWebSocketError,
        onStompError: _onStompError,
        onDisconnect: _onDisconnect,
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
        reconnectDelay: const Duration(seconds: 5),
      ),
    );
  }

  Future<void> connect() async {
    if (!_isConnected) {
      await _initializeStompClient(); 
      _stompClient.activate();
    }
  }

  void disconnect() {
    _stompClient.deactivate();
    _isConnected = false;
    _reconnectAttempts = 0;
  }

  void _onConnect(StompFrame frame) {
    _isConnected = true;
    _reconnectAttempts = 0;
    _resubscribeAll();
  }

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
        destination: destination,
        callback: (StompFrame frame) {
          _handleMessage;
        },
      );
    });
  }

  Future<void> subscribeToChat(String chatId) async {
    final destination = '/chat/$chatId';
    if (!_subscriptions.containsKey(destination)) {
      if (!_isConnected) await connect();
      _subscriptions[destination] = _stompClient.subscribe(
        destination: destination,
        callback: _handleMessage,
      );
    }
  }

  Future<void> unsubscribeFromChat(String chatId) async {
    final destination = '/chat/$chatId';
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

  Future<void> sendMessage(Message message, String chatId) async {
    if (message.content.trim().isEmpty) return;

    if (!_isConnected) await connect();

    final messagePayload = {
      'id': message.id,
      'senderId': message.senderId,
      'recipientId': message.recipientId,
      'content': message.content,
      'timestamp': message.timestamp.toIso8601String(),
    };

    _stompClient.send(
      destination: '/chat/$chatId',
      body: json.encode(messagePayload),
    );
  }

 void _handleMessage(StompFrame frame) {
    try {
      final Map<String, dynamic> jsonMessage = json.decode(frame.body!);
      final message = Message.fromJson(jsonMessage);
      print('Received message: ${message.content} from ${message.senderId}');
      
    } catch (e) {
      print('Error parsing message: $e');
    }
  }
}
