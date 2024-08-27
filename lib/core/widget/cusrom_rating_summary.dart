import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_empty.dart';
import 'package:freelance_job_portal/core/widget/custom_loading.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../features/profile/presentation/views/widget/custom_review_card_worker.dart';
import '../../features/profile/worker profile/widgets/custom_rate.dart';
import '../../features/review/presentation/view_models/bloc/review_bloc.dart';

class CusromRatingSummary extends StatelessWidget {
  const CusromRatingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) {
        if (state is GetReviewSuccess) {
          if (state.profileRates.rates.isEmpty) {
            return const CustomEmpty();
          } else {
            return Column(
              children: [
                const VirticalSpace(4),
                CustomRate(profileRate: state.profileRates),
                const VirticalSpace(6),
                SizedBox(
                  // height: SizeConfig.defaultSize! * 35,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: state.profileRates.rates.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return CustomReviewCardWorker(
                          rate: state.profileRates.rates[index]);
                    },
                  ),
                ),
              ],
            );
          }
        } else if (state is ReviewFaliure) {
          return Center(child: Text(state.errMessage));
        } else {
          print(state.toString());
          return const CustomLoading();
        }
      },
    );
  }
}
