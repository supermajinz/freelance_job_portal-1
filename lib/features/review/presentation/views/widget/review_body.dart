import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/review/presentation/view_models/args/review_args.dart';
import 'package:freelance_job_portal/features/review/presentation/views/widget/custom_rating.dart';
import 'package:go_router/go_router.dart';
import '../../view_models/bloc/review_bloc.dart';

class ReviewBody extends StatelessWidget {
  const ReviewBody({super.key, required this.args});
  final ReviewArgs args;

  @override
  Widget build(BuildContext context) {
    final descriptionController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    double overall = 0;
    double proficiency = 0;
    double communication = 0;
    double quality = 0;
    SizeConfig().init(context);
    return BlocListener<ReviewBloc, ReviewState>(
      listener: (context, state) {
        if (state is ReviewSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم تسجيل التقييم')),
          );
          GoRouter.of(context).pop();
        }
      },
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.defaultSize! * 1.5,
                  vertical: SizeConfig.defaultSize! * 2),
              child: Column(
                children: [
                  Center(
                    child: CustomTitle(
                      text: "Review ${args.reviewedName}",
                    ),
                  ),
                  const VirticalSpace(5),
                  const CustomSubTitle(
                    text: "Overrall rating",
                  ),
                  const VirticalSpace(1),
                  CustomRating(
                    onRatingUpdate: (rating) => overall = rating,
                  ),
                  const VirticalSpace(3),
                  const CustomSubTitle(
                    text: "Proficieny rating",
                  ),
                  const VirticalSpace(1),
                  CustomRating(
                    onRatingUpdate: (rating) => proficiency = rating,
                  ),
                  const VirticalSpace(3),
                  const CustomSubTitle(
                    text: "Communication rating",
                  ),
                  const VirticalSpace(1),
                  CustomRating(
                    onRatingUpdate: (rating) => communication = rating,
                  ),
                  const VirticalSpace(3),
                  const CustomSubTitle(
                    text: "Quality rating",
                  ),
                  const VirticalSpace(1),
                  CustomRating(
                    onRatingUpdate: (rating) => quality = rating,
                  ),
                  const VirticalSpace(5),
                  CustomTextFormGeneral(
                      obs: false,
                      mycontroller: descriptionController,
                      hinttext: "",
                      lable: "Describe your experience",
                      isNumber: false),
                  const VirticalSpace(8),
                  Center(
                      child: CustomButtonGeneral(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final offerData = {
                                "overall": overall,
                                "proficiency": proficiency,
                                "communication": communication,
                                "quality": quality,
                                "description": descriptionController.text,
                                "rated": args.rated,
                                "clientProfileId": args.clientId,
                                "workerProfileId": args.workerId,
                              };

                              BlocProvider.of<ReviewBloc>(context)
                                  .add(AddReview(args.projectId, offerData));
                            }
                          },
                          color: Theme.of(context).primaryColor,
                          textcolor: Colors.white,
                          text: "Send",
                          borderSide: const BorderSide(width: 0),
                          width: SizeConfig.defaultSize! * 20)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
