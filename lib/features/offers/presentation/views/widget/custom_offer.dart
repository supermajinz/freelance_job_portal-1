import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_label.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widget/custom_subtitle_medium.dart';

class CustomOffer extends StatelessWidget {
  const CustomOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 21,
      padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
      decoration: BoxDecoration(
        color: Theme.of(context).unselectedWidgetColor,
        borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: CircleAvatar(
                  radius: SizeConfig.defaultSize! * 4,
                  backgroundImage: const AssetImage(
                    "assets/images/pro.jpg",
                  ),
                ),
              ),
              const HorizintalSpace(.5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSubTitleMedium(
                    text: "أحمد مراد",
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
                    child: const CustomBody(
                      text: "مطور تطبيقات موبايل",
                      color: Colors.white,
                    ),
                  ),
                  const VirticalSpace(0.2),
                  const Row(
                    children: [
                      CustomLabel(
                        text: "4.6",
                        color: Colors.white,
                      ),
                      HorizintalSpace(0.5),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
                child: const HorizintalSpace(10),
              ),
              const CustomLabel(
                text: "1d",
                color: Colors.white,
              ),
            ],
          ),
          const VirticalSpace(1),
          const CustomSubTitleMedium(
            text: "Excited to work with you!",
            color: Colors.white,
          ),
          const VirticalSpace(.5),
          const CustomBody(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}


// سوف اعطيك الواجهات مع ملفات الربط تأكد لي انا صحيحة والغير الصحيح صححه لي واربط لي كل شيء
// سوف اعطيك الendpoint ايضا
// http://localhost:8080/api/v1/offers
// وهذا الbody
// {
//   "message": "offer messafe",
//   "cost": 100000,
//   "deliveryTime": 40,
//   "workerId": 1,
//   "projectId": 1
// }
// وهذا الresponse الذي يرجع
// {
//     "id": 18,
//     "message": "offer messafe",
//     "cost": 100000,
//     "deliveryTime": 40,
//     "status": "pending",
//     "createDate": "2024-08-02T21:00:12.879+00:00",
//     "worker": {
//         "id": 1,
//         "bio": null,
//         "userId": 0,
//         "rate": 0.0,
//         "jobTitleDTO": null,
//         "categoryDTO": null,
//         "photoDTOs": null,
//         "skillDTOs": null,
//         "userDTO": null
//     }
// }
// وهذا لانشاء offer
// ولدي ايضا endpointتعدبل ال offer
// http://localhost:8080/api/v1/offers/1
// وهذا الbody
// {
//   "message": "offer new message",
//   "cost": 10000,
//   "deliveryTime": 50
// }
// وهذا الresponse الذي يرجع
// {
//     "id": 1,
//     "message": "offer new message",
//     "cost": 10000,
//     "deliveryTime": 50,
//     "status": "pending",
//     "createDate": "2024-08-02T17:06:18.642+00:00",
//     "worker": {
//         "id": 1,
//         "bio": "I'm a skilled developer with 5 years of experience",
//         "userId": 1,
//         "rate": 2.5,
//         "jobTitleDTO": {
//             "id": 2,
//             "title": "مصمم جرافيك"
//         },
//         "categoryDTO": {
//             "id": 2,
//             "name": "برمجة، تطوير المواقع والتطبيقات",
//             "photo": null
//         },
//         "photoDTOs": [],
//         "skillDTOs": [],
//         "userDTO": {
//             "id": 1,
//             "firstname": "AAAA",
//             "lastname": "Doe",
//             "phone": "0986411621",
//             "email": "aaaa@example.com",
//             "points": 0,
//             "status": "ACTIVE",
//             "device_token": "dsa"
//         }
//     }
// }
// والان سوف اعطيك جميع الملفات
// import 'package:dartz/dartz.dart';
// import 'package:freelance_job_portal/core/errors/failures.dart';
// import 'package:freelance_job_portal/features/offers/data/model/offer_model/offer_model.dart';

// abstract class OfferRepo {
//   Future<Either<Failure, OfferModel>> createOffer(
//       Map<String, dynamic> offerData);
//   Future<Either<Failure, OfferModel>> updateOffer(
//       int id, Map<String, dynamic> offerData);
 
// }
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:freelance_job_portal/core/errors/failures.dart';
// import 'package:freelance_job_portal/core/utils/api_service.dart';
// import 'package:freelance_job_portal/features/offers/data/model/offer_model/offer_model.dart';
// import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';

// class OfferRepoImpl implements OfferRepo {
//   final ApiService _apiService;

//   OfferRepoImpl(this._apiService);

//   @override
//   Future<Either<Failure, OfferModel>> createOffer(
//       Map<String, dynamic> offerData) async {
//     try {
//       final response = await _apiService.post('offers', offerData);
//       final project = OfferModel.fromJson(response);
//       return Right(project);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }
  
// @override
//   Future<Either<Failure, OfferModel>> updateOffer(int id, Map<String, dynamic> offerData) async {
//     try {
//       final response = await _apiService.put('offers/$id', offerData);
//       final offer = OfferModel.fromJson(response);
//       return Right(offer);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//       return left(ServerFailure(errMessage: e.toString()));
//     }
//   }


// }
// part of 'offer_bloc.dart';

// sealed class OfferState extends Equatable {
//   const OfferState();

//   @override
//   List<Object> get props => [];
// }

// final class OfferInitial extends OfferState {}

// final class OfferLoading extends OfferState {}

// final class OfferSuccess extends OfferState {
//   final OfferModel offer;

//   const OfferSuccess(this.offer);

//   @override
//   List<Object> get props => [offer];
// }

// final class OfferFaliure extends OfferState {
//   final String errMessage;

//   const OfferFaliure(this.errMessage);
//   @override
//   List<Object> get props => [errMessage];
// }
// part of 'offer_bloc.dart';

// sealed class OfferEvent extends Equatable {
//   const OfferEvent();

//   @override
//   List<Object> get props => [];
// }

// class CreateOffer extends OfferEvent {
//   final Map<String, dynamic> offerData;

//   const CreateOffer(this.offerData);

//   @override
//   List<Object> get props => [offerData];
// }

// class UpdateOffer extends OfferEvent {
//   final int offerId;
//   final Map<String, dynamic> offerData;

//   const UpdateOffer(this.offerId, this.offerData);

//   @override
//   List<Object> get props => [offerId, offerData];
// }
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:freelance_job_portal/features/offers/data/repo/offer_repo.dart';
// import '../../../data/model/offer_model/offer_model.dart';

// part 'offer_event.dart';
// part 'offer_state.dart';

// class OfferBloc extends Bloc<OfferEvent, OfferState> {
//   final OfferRepo repo;
//   OfferBloc(this.repo) : super(OfferInitial()) {
//     on<CreateOffer>(_onCreateOffer);
//     on<UpdateOffer>(_onUpdateOffer);
   
//   }

//   Future<void> _onCreateOffer(
//     CreateOffer event,
//     Emitter<OfferState> emit,
//   ) async {
//     emit(OfferLoading());
//     final result = await repo.createOffer(event.offerData);
//     result.fold(
//       (failure) => emit(OfferFaliure(failure.errMessage)),
//       (offer) => emit(OfferSuccess(offer)),
//     );
//   }

//   Future<void> _onUpdateOffer(
//       UpdateOffer event, Emitter<OfferState> emit) async {
//     emit(OfferLoading());
//     final result = await repo.updateOffer(event.offerId, event.offerData);
//     result.fold(
//       (failure) => emit(OfferFaliure(failure.errMessage)),
//       (offer) => emit(OfferSuccess(offer)),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freelance_job_portal/core/utils/size_config.dart';
// import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
// import 'package:freelance_job_portal/core/widget/custom_meony_general.dart';
// import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
// import 'package:freelance_job_portal/core/widget/custom_text_form_general.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import 'package:freelance_job_portal/features/offers/presentation/view_models/bloc/offer_bloc.dart';

// class CreateOfferBody extends StatefulWidget {
//   const CreateOfferBody({super.key});

//   @override
//   State<CreateOfferBody> createState() => _CreateOfferBodyState();
// }

// class _CreateOfferBodyState extends State<CreateOfferBody> {
//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     final TextEditingController descriptionController = TextEditingController();
//     final TextEditingController priceController = TextEditingController();
//     final TextEditingController deliveryTimeController =
//         TextEditingController();

//     return BlocConsumer<OfferBloc, OfferState>(
//       listener: (context, state) {
//         if (state is OfferSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Offer created successfully!')),
//           );
//         } else if (state is OfferFaliure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text('Failed to create offer: ${state.errMessage}')),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(
//                     horizontal: SizeConfig.defaultSize! * 1.5,
//                     vertical: SizeConfig.defaultSize! * 2),
//                 child: Column(
//                   children: [
//                     const VirticalSpace(4),
//                     CustomTextFormGeneral(
//                         mycontroller: descriptionController,
//                         onTapicon: () {},
//                         hinttext: "",
//                         lable: "Description",
//                         isNumber: false),
//                     const VirticalSpace(3),
//                     CustomTextFormGeneral(
//                       hinttext: "",
//                       lable: "Delivery Time",
//                       isNumber: true,
//                       mycontroller: deliveryTimeController,
//                       obs: false,
//                       onTapicon: () {},
//                     ),
//                     const VirticalSpace(4),
//                     const CustomSubTitle(text: "Budget"),
//                     const VirticalSpace(1),
//                     CustomMeonyGeneral(
//                       mycontroller: priceController,
//                       onTapicon: () {},
//                       isNumber: true,
//                     ),
//                     const VirticalSpace(36),
//                     Center(
//                       child: CustomButtonGeneral(
//                           onPressed: () {
//                             if (formKey.currentState!.validate()) {
//                               final offerData = {
//                                 'message': descriptionController.text,
//                                 'cost': int.parse(priceController.text),
//                                 'deliveryTime':
//                                     int.parse(deliveryTimeController.text),
//                                 "workerId": 1,
//                                 "projectId": 1
//                               };

//                               context
//                                   .read<OfferBloc>()
//                                   .add(CreateOffer(offerData));
//                             }
//                           },
//                           color: Theme.of(context).primaryColor,
//                           textcolor: Colors.white,
//                           text: "Send",
//                           borderSide: const BorderSide(),
//                           width: SizeConfig.defaultSize! * 20),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/utils/size_config.dart';
// import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
// import 'package:freelance_job_portal/core/widget/custom_edit_meony_general.dart';
// import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';

// class EditOfferBody extends StatelessWidget {
//   const EditOfferBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: [
//       Container(
//         margin: EdgeInsets.symmetric(
//             horizontal: SizeConfig.defaultSize! * 1.5,
//             vertical: SizeConfig.defaultSize! * 2),
//         child: Column(
//           children: [
//             const VirticalSpace(4),
//             const EditTextForm(
//                 // initvalue:
//                 // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
//                 hinttext: "",
//                 lable: "Discripion",
//                 isNumber: false),
//             const VirticalSpace(3),
//             const EditTextForm(
//                 // initvalue:
//                 // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
//                 hinttext: "",
//                 lable: "Delivery Time",
//                 isNumber: false),
//             const VirticalSpace(4),
//             const CustomSubTitle(text: "Budget"),
//             const VirticalSpace(1),
//             const CustomEditMeonyGeneral(
//               // initVal: "7.500.00",
//               isNumber: true,
//             ),
//             const VirticalSpace(36),
//             CustomButtonGeneral(
//                 onPressed: () {},
//                 color: Theme.of(context).primaryColor,
//                 textcolor: Colors.white,
//                 text: "Save",
//                 borderSide: const BorderSide(),
//                 width: SizeConfig.defaultSize! * 20)
//           ],
//         ),
//       )
//     ]);
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/utils/functions/show_bottom_sheet_offer.dart';
// import 'package:freelance_job_portal/core/utils/size_config.dart';
// import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
// import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
// import 'package:freelance_job_portal/core/widget/custom_container.dart';
// import 'package:freelance_job_portal/core/widget/custom_label.dart';
// import 'package:freelance_job_portal/core/widget/custom_meony.dart';
// import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
// import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';
// import 'package:go_router/go_router.dart';

// class OfferDetailsBody extends StatelessWidget {
//   const OfferDetailsBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const VirticalSpace(3),
//             Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.defaultSize! * .5),
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).focusColor,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
//                           topRight:
//                               Radius.circular(SizeConfig.defaultSize! * 4))),
//                   child: Padding(
//                     padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
//                     child: Column(
//                       children: [
//                         const VirticalSpace(20),
//                         const CustomSubTitle(text: "Excited to Work With You!"),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: SizeConfig.defaultSize! * 1),
//                           child: Text(
//                             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus",
//                             textAlign: TextAlign.center,
//                             maxLines: 5,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context).textTheme.bodyLarge,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Text(
//                             "show more",
//                             textAlign: TextAlign.start,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelLarge!
//                                 .copyWith(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                   decorationThickness: 2,
//                                   decoration: TextDecoration.underline,
//                                 ),
//                           ),
//                         ),
//                         const VirticalSpace(4),
//                         const Row(
//                           children: [
//                             Expanded(
//                                 child: CustomSubTitleMedium(text: "Price")),
//                             Expanded(
//                                 child: CustomMeony(
//                               text: "7,500,000",
//                             ))
//                           ],
//                         ),
//                         const VirticalSpace(4),
//                         const Row(
//                           children: [
//                             Expanded(
//                                 child: CustomSubTitleMedium(
//                                     text: "Delivery Time")),
//                             Expanded(
//                                 child: CustomContainer(
//                               text: "12/4/2024",
//                             ))
//                           ],
//                         ),
//                         const VirticalSpace(11),
//                         CustomButtonGeneral(
//                             onPressed: () {
//                               showBottomSheetOffer(context);
//                             },
//                             color: Colors.white,
//                             textcolor: Colors.black,
//                             text: "Accept Offer",
//                             borderSide:
//                                 const BorderSide(width: 1, color: Colors.grey),
//                             width: SizeConfig.defaultSize! * 20)
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.defaultSize! * .5),
//                   padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
//                   decoration: BoxDecoration(
//                       color: Theme.of(context).hintColor,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(SizeConfig.defaultSize! * 4),
//                           topRight:
//                               Radius.circular(SizeConfig.defaultSize! * 4))),
//                   child: Column(
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(top: 5),
//                             child: CircleAvatar(
//                               radius: SizeConfig.defaultSize! * 5,
//                               backgroundImage: const AssetImage(
//                                 "assets/images/pro.jpg",
//                               ),
//                             ),
//                           ),
//                           const HorizintalSpace(1.5),
//                           const Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomSubTitleMedium(
//                                 text: "أحمد مراد",
//                                 color: Colors.white,
//                               ),
//                               CustomBody(
//                                 text: "مطور تطبيقات موبايل",
//                                 color: Colors.white,
//                               ),
//                               CustomBody(
//                                 text: "13 مشروع مكتمل",
//                                 color: Colors.white,
//                               ),
//                               VirticalSpace(0.2),
//                               Row(
//                                 children: [
//                                   CustomLabel(
//                                     text: "4.6",
//                                     color: Colors.white,
//                                   ),
//                                   HorizintalSpace(0.5),
//                                   Icon(
//                                     Icons.star,
//                                     color: Colors.yellow,
//                                     size: 20,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                           const HorizintalSpace(8),
//                           IconButton(
//                               onPressed: () {
//                                 GoRouter.of(context).push('/editoffer');
//                               },
//                               icon: const Icon(
//                                 Icons.edit,
//                                 size: 25,
//                                 color: Colors.white,
//                               ))
//                         ],
//                       ),
//                       const VirticalSpace(2),
//                       const ShowChip()
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
// import 'package:freelance_job_portal/core/widget/custom_label.dart';
// import 'package:freelance_job_portal/core/widget/space.dart';
// import '../../../../../core/utils/size_config.dart';
// import '../../../../../core/widget/custom_subtitle_medium.dart';

// class CustomOffer extends StatelessWidget {
//   const CustomOffer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: SizeConfig.defaultSize! * 21,
//       padding: EdgeInsets.all(SizeConfig.defaultSize! * 1),
//       decoration: BoxDecoration(
//         color: Theme.of(context).unselectedWidgetColor,
//         borderRadius: BorderRadius.circular(SizeConfig.defaultSize! * 1),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
//                 child: CircleAvatar(
//                   radius: SizeConfig.defaultSize! * 4,
//                   backgroundImage: const AssetImage(
//                     "assets/images/pro.jpg",
//                   ),
//                 ),
//               ),
//               const HorizintalSpace(.5),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const CustomSubTitleMedium(
//                     text: "أحمد مراد",
//                     color: Colors.white,
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(right: SizeConfig.defaultSize! * .5),
//                     child: const CustomBody(
//                       text: "مطور تطبيقات موبايل",
//                       color: Colors.white,
//                     ),
//                   ),
//                   const VirticalSpace(0.2),
//                   const Row(
//                     children: [
//                       CustomLabel(
//                         text: "4.6",
//                         color: Colors.white,
//                       ),
//                       HorizintalSpace(0.5),
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: SizeConfig.defaultSize! * .5),
//                 child: const HorizintalSpace(10),
//               ),
//               const CustomLabel(
//                 text: "1d",
//                 color: Colors.white,
//               ),
//             ],
//           ),
//           const VirticalSpace(1),
//           const CustomSubTitleMedium(
//             text: "Excited to work with you!",
//             color: Colors.white,
//           ),
//           const VirticalSpace(.5),
//           const CustomBody(
//             text:
//                 "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
//             color: Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
// اريدك ان تربط لي كل شيء بشكل صحيح
// اريد ان تكون واجهة التعديل يوجد فيها معلومات ال offerالذي انشأته ومن ثم اعدلها انا
// وايضا الoffer details خذ لي معلوماته من المودل