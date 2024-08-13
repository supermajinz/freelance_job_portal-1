import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/view%20model/bloc/portofolio_bloc.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/custom_protofolio_card.dart';
import 'package:go_router/go_router.dart';

class PortofolioWidget extends StatefulWidget {
  final int workerProfileId;
  const PortofolioWidget({super.key, required this.workerProfileId});

  @override
  State<PortofolioWidget> createState() => _PortofolioWidgetState();
}

class _PortofolioWidgetState extends State<PortofolioWidget> {
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
          return CustomProtofolioCardList(
              jobsList: state.portofolios,
              workerProfileId: widget.workerProfileId);
        }
        if (state is NoPortofolios) {
          return Column(
            children: [
              const Center(
                child: Text("ليس لديك أعمال سابقة"),
              ),
              const VirticalSpace(2),
              CustomButtonGeneral(
                onPressed: () {
                  GoRouter.of(context)
                      .push("/addprotofolio", extra: widget.workerProfileId);
                },
                width: SizeConfig.defaultSize! * 25.5,
                borderSide: const BorderSide(width: 0),
                color: Theme.of(context).primaryColor,
                text: "اضافة ملف شخصي",
                textcolor: Colors.white,
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
