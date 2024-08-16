
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/protofolio/data/models/portofolio_job/portofolio_job/portofolio_job.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/show_proto_details_body.dart';
import 'package:go_router/go_router.dart';

class VisitShowProtoDetails extends StatefulWidget {
  final PortofolioJob job;
  const VisitShowProtoDetails({super.key, required this.job});

  @override
  State<VisitShowProtoDetails> createState() => _VisitShowProtoDetailsState();
}

class _VisitShowProtoDetailsState extends State<VisitShowProtoDetails> {
  @override
  void initState() {
    context.read<PortofolioBloc>().add(ViewPortofolioJob(jobId: widget.job.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PortofolioBloc, PortofolioState>(
      listener: (context, state) {
        if (state is PortofolioJobDeleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Portofolio Job Deleted')),
          );
          GoRouter.of(context).pushReplacement('/homescreen');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: const CustomTitle(
                text: 'تفاصيل العمل',
                white: true,
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).primaryColor,
              leading: CustomIconBack(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              )),
          body: SafeArea(
              child: ShowProtoDetailsBody(
            job: widget.job,
          )),
        );
      },
    );
  }
}
