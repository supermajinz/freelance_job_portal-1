import 'package:flutter/material.dart';
import 'package:rating_summary/rating_summary.dart';
import '../../../review/data/model/rate_model/profile_rates.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key, required this.profileRate});
  final ProfileRates profileRate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: RatingSummary(
        color: Theme.of(context).primaryColor,
        counter: profileRate.count,
        average: profileRate.avg,
        counterFiveStars: profileRate.count5,
        counterFourStars: profileRate.count4,
        counterThreeStars: profileRate.count3,
        counterTwoStars: profileRate.count2,
        counterOneStars: profileRate.count1,
      ),
    );
  }
}
