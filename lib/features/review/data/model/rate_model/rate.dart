import '../../../../profile/data/models/profile/client_profile.dart';
import '../../../../profile/data/models/profile/worker_Profile/worker_profile.dart';

class Rate {
  final int id;
  final DateTime createDate;
  final double totalRate;
  final String description;
  final ClientProfile client;
  final WorkerProfile worker;
  final String rated;

  const Rate({
    required this.id,
    required this.createDate,
    required this.totalRate,
    required this.description,
    required this.client,
    required this.worker,
    required this.rated,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createDate': createDate,
      'totalRate': totalRate,
      'description': description,
      'client': client,
      'worker': worker,
      'rated': rated,
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      id: map['id'] as int,
      createDate: DateTime.parse(map['createDate']),
      totalRate: map['totalRate'] as double,
      description: map['description'] as String,
      rated: map['rated'] as String,
      client: ClientProfile.fromMap(map['client'] as Map<String, dynamic>),
      worker: WorkerProfile.fromMap(map['worker'] as Map<String, dynamic>),
    );
  }
}
