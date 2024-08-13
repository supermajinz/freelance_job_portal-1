import 'package:freelance_job_portal/features/review/data/model/rate_model/rate.dart';

class ProfileRates {
  final List<Rate> rates;
  final int count;
  final double avg;
  final int count1;
  final int count2;
  final int count3;
  final int count4;
  final int count5;

  const ProfileRates({
    required this.rates,
    required this.count,
    required this.avg,
    required this.count1,
    required this.count2,
    required this.count3,
    required this.count4,
    required this.count5,
  });

  Map<String, dynamic> toMap() {
    return {
      'rates': rates,
      'count': count,
      'avg': avg,
      'count1': count1,
      'count2': count2,
      'count3': count3,
      'count4': count4,
      'count5': count5,
    };
  }

  factory ProfileRates.fromMap(Map<String, dynamic> map) {
    return ProfileRates(
      rates: map['rates'].map<Rate>((e) => Rate.fromMap(e)).toList(),
      count: map['count'] as int,
      avg: map['avg'] as double,
      count1: map['count1'] as int,
      count2: map['count2'] as int,
      count3: map['count3'] as int,
      count4: map['count4'] as int,
      count5: map['count5'] as int,
    );
  }
}
