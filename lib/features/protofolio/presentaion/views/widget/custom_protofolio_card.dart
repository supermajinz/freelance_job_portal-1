import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:go_router/go_router.dart';

class CustomProtofolioCardList extends StatelessWidget {
  final List<PortofolioJob> jobsList;
  final int workerProfileId;

  const CustomProtofolioCardList(
      {super.key, required this.jobsList, required this.workerProfileId});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: SizeConfig.defaultSize! * 2,
      runSpacing: SizeConfig.defaultSize! * 2,
      children: List.generate(
        jobsList.length,
        (index) => InkWell(
          onTap: () {
            GoRouter.of(context)
                .push("/showprotodetails", extra: jobsList[index]);
          },
          child: _buildPortfolioCard(context, index),
        ),
      ),
    );
  }

  Widget _buildPortfolioCard(BuildContext context, int index) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildImageContainer(context, index),
        _buildTitleOverlay(index),
      ],
    );
  }

  Widget _buildImageContainer(BuildContext context, int index) {
    // print(
    //   "we are in portofolio card image ${jobsList[index].photoDtOs!.first.photo}");
    bool hasNoPhoto = jobsList[index].photoDtOs!.isEmpty;
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1.5),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: hasNoPhoto
              ? const AssetImage('assets/images/51-200x200.jpg')
              : NetworkImage(
                  'http://localhost:8080/api/v1/file/photo/${jobsList[index].photoDtOs!.first.photo}'),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: SizeConfig.defaultSize! * 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleOverlay(int index) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize! * 0.8,
            horizontal: SizeConfig.defaultSize!),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.8),
              Colors.transparent,
            ],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(SizeConfig.defaultSize! * 1.5),
            bottomRight: Radius.circular(SizeConfig.defaultSize! * 1.5),
          ),
        ),
        child: CustomLabel(
          text: jobsList[index].name!,
          color: Colors.white,
        ),
      ),
    );
  }
}
