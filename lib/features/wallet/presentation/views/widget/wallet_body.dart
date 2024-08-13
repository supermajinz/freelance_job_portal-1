import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_model.dart';
import 'package:freelance_job_portal/features/wallet/data/models/wallet_payments/wallet_payments.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class WalletBody extends StatelessWidget {
  final int myUserId;
  final WalletPayments wallet;
  const WalletBody({super.key, required this.wallet, required this.myUserId});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.defaultSize! * 2,
          right: SizeConfig.defaultSize! * 2,
          top: SizeConfig.defaultSize! * 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  IconlyBold.wallet,
                  size: SizeConfig.defaultSize! * 15,
                ),
                const HorizintalSpace(1),
                Column(
                  children: [
                    const CustomSubTitle(
                      text: ":الرصيد:",
                    ),
                    CustomSubTitleMedium(
                      text: wallet.wallet!.totalBalance.toString(),
                      color: Colors.grey,
                    ),
                    const CustomSubTitle(
                      text: "الرصيد المحجوز:",
                    ),
                    CustomSubTitleMedium(
                      text: wallet.wallet!.totalHeldBalance.toString(),
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            ),
          ),
          const VirticalSpace(2),
          /*
          Row(
            children: [
              CustomButtonGeneral(
                  onPressed: () {
                    GoRouter.of(context).push("/deposit");
                  },
                  color: Colors.deepPurple,
                  textcolor: Colors.white,
                  text: "Deposit",
                  borderSide: const BorderSide(width: 0),
                  width: SizeConfig.defaultSize! * 16),
              const Spacer(),
              CustomButtonGeneral(
                  onPressed: () {
                    GoRouter.of(context).push("/withdraw");
                  },
                  color: primaryColer,
                  textcolor: Colors.white,
                  text: "Withdraw",
                  borderSide: const BorderSide(width: 0),
                  width: SizeConfig.defaultSize! * 16)
            ],
          ),
          */
          const VirticalSpace(3),
          const CustomSubTitle(
            text: "تاريخ التحوبلات:",
          ),
          const VirticalSpace(1),
          SizedBox(
            height: SizeConfig.defaultSize! * 40,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          CustomBody(
                              text: wallet.transactions![index].amount!
                                  .toString()),
                          CustomBody(
                            text: wallet.transactions![index].senderUserId ==
                                    myUserId
                                ? " قد أرسلت   "
                                : " استلمت  ",
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      CustomBody(
                        text:
                            "التاريخ : ${DateFormat('yyyy-MM-dd').format(wallet.transactions![index].transactionDate!)}",
                      ),
                      CustomBody(
                        text:
                            "رقم عملية التحويل: ${wallet.transactions![index].transactionNumber!.toString()}",
                      ),
                      Row(
                        children: [
                          CustomBody(
                            text:
                                "نوع العملية: ${wallet.transactions![index].type}",
                            color: Colors.grey,
                          ),
                          Builder(
                            builder: (context) {
                              if (wallet.transactions![index].type ==
                                  "DEPOSIT") {
                                return const Icon(Icons.move_to_inbox_rounded);
                              }
                              if (wallet.transactions![index].type ==
                                  "WITHDRAW") {
                                return const Icon(Icons.outbox);
                              }
                              if (wallet.transactions![index].type ==
                                  "TRANSFER") {
                                return const Icon(Icons.send);
                              }
                              if (wallet.transactions![index].type ==
                                  "TRANSFERHELD") {
                                return const Icon(Icons.send_and_archive);
                              }
                              if (wallet.transactions![index].type == "HOLD") {
                                return const Icon(Icons.back_hand_rounded);
                              }
                              if (wallet.transactions![index].type == "HOLD") {
                                return const Icon(Icons.handshake);
                              }
                              return const HorizintalSpace(1);
                            },
                          )
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: wallet.transactions!.length),
          )
        ],
      ),
    );
  }
}
