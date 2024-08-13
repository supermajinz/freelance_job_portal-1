import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/visit_portofolio_card_list.dart';
import 'package:go_router/go_router.dart';

class VisitPortofolioWidget extends StatefulWidget {
  final int workerProfileId;
  const VisitPortofolioWidget({super.key, required this.workerProfileId});

  @override
  State<VisitPortofolioWidget> createState() => _VisitPortofolioWidgetState();
}

class _VisitPortofolioWidgetState extends State<VisitPortofolioWidget> {
  @override
  Widget build(BuildContext context) {
    print("will try widget profile id ${widget.workerProfileId}");
    return BlocConsumer<PortofolioBloc, PortofolioState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is PortofolioError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is PortofolioLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PortofolioLoaded) {
          return VisitCustomProtofolioCardList(
              jobsList: state.portofolios,
              workerProfileId: widget.workerProfileId);
        }
        if (state is NoPortofolios) {
          return const Column(
            children: [
              Center(
                child: Text("ليس لديه أعمال سابقة"),
              )
            ],
          );
        } else {
          return const Placeholder(); //TODO no portofolio
        }
      },
    );
  }
}
