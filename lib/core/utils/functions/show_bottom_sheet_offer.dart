import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/view_models/bloc/wallet_bloc.dart';
import 'package:iconly/iconly.dart';

void showBottomSheetOffer(
  BuildContext context,
  void Function()? onPressed,
  int price,
  int date,
  String projectName,
) {
  final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;
  const double heldPercentage = 0.2; // 20%

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      // Rounded corners for the sheet
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) {
      return BlocProvider(
        create: (context) =>
            WalletBloc(DependencyInjection.providePaymentsRepo())
              ..add(GetWalletPayments(userId)),
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state is WalletLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is! WalletPaymentsLoaded) {
              return const Center(child: Text(''));
            }

            final double heldAmount = price * heldPercentage;
            final double newBalance =
                state.walletPayments.wallet!.totalBalance! - price;
            final double newHeldBalance =
                state.walletPayments.wallet!.totalHeldBalance! + heldAmount;

            // Check for sufficient balance
            // if (state.walletPayments.wallet!.totalBalance! < price) {
            //   return _buildInsufficientFundsContent(context);
            // } //TODO remove comment after adding a suffecient balance to the account

            return Container(
              padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
              child: Column(
                mainAxisSize:
                    MainAxisSize.min, // Important for preventing overflow
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Center(
                    child:
                        CustomSubTitle(text: "هل أنت متأكد أنك تريد القبول؟"),
                  ),
                  const VirticalSpace(2),
                  Center(
                    child: CustomBody(
                      text: projectName,
                    ),
                  ),
                  const VirticalSpace(3),
                  _buildOfferDetailRow(
                      context, "السعر", "ل.س $price", Icons.attach_money),
                  _buildOfferDetailRow(context, "زمن التسليم", "$date يوم",
                      Icons.calendar_today),
                  const VirticalSpace(3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.labelLarge,
                        children: [
                          const TextSpan(
                            text: "سيتم حجز ",
                          ),
                          TextSpan(
                              text: "ل.س ${heldAmount.toStringAsFixed(2)} ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(text: "من رصيدك"),
                        ],
                      ),
                    ),
                  ),
                  const VirticalSpace(3),
                  _buildWalletInfo(context, newBalance, newHeldBalance),
                  const VirticalSpace(4),
                  Center(
                    child: CustomButtonGeneral(
                      onPressed: onPressed,
                      color: Colors.white,
                      textcolor: Colors.black,
                      text: "اضغط للقبول",
                      borderSide: const BorderSide(color: Colors.grey),
                      width: SizeConfig.screenWidth! * 0.8,
                    ),
                  ),
                  const VirticalSpace(2),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

Widget _buildOfferDetailRow(
    BuildContext context, String label, String value, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const HorizintalSpace(2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSubTitleMedium(text: label),
            CustomBody(text: value),
          ],
        ),
      ],
    ),
  );
}

Widget _buildWalletInfo(
    BuildContext context, double newBalance, double newHeldBalance) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSubTitle(text: "معلومات المحفظة:"),
        const VirticalSpace(1),
        _buildWalletDetailRow(context, "الرصيد المتاح بعد القبول:", newBalance),
        _buildWalletDetailRow(context, "الرصيد المحجوز:", newHeldBalance),
      ],
    ),
  );
}

Widget _buildWalletDetailRow(
    BuildContext context, String label, double amount) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBody(text: label, color: Colors.grey[600]!),
        CustomBody(text: "ل.س ${amount.toStringAsFixed(2)}"),
      ],
    ),
  );
}

Widget _buildInsufficientFundsContent(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.4,
    padding: EdgeInsets.all(SizeConfig.defaultSize! * 2),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_amber_rounded,
              size: 64, color: Colors.orange),
          const VirticalSpace(2),
          const CustomSubTitle(
              text:
                  'ليس لديك رصيد كافي لتقبل العرض، يرجى تعبئة رصيدك و إعادة المحاولة'),
          const VirticalSpace(3),
          CustomButtonGeneral(
            onPressed: () => Navigator.pop(context),
            color: Colors.white,
            textcolor: Colors.black,
            text: "حسناً",
            borderSide: const BorderSide(color: Colors.grey),
            width: SizeConfig.defaultSize! * 20,
          ),
        ],
      ),
    ),
  );
}
//the old ui
/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/dependency_injection.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_body_medium.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/custom_sub_title.dart';
import 'package:freelance_job_portal/core/widget/custom_subtitle_medium.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/view_models/bloc/wallet_bloc.dart';
import 'package:iconly/iconly.dart';

void showBottomSheetOffer(
BuildContext context,
void Function()? onPressed,
int price,
int date,
String projectName,
) {
final userId = (context.read<AuthBloc>().state as AuthAuthenticated).id;

showModalBottomSheet(
context: context,
isScrollControlled: true,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
),
builder: (context) {
return BlocProvider(
create: (context) =>
WalletBloc(DependencyInjection.providePaymentsRepo())
..add(GetWalletPayments(userId)),
child: BlocBuilder<WalletBloc, WalletState>(
builder: (context, state) {
if (state is WalletLoading) {
return Center(
child: CircularProgressIndicator(),
);
}
if (state is! WalletPaymentsLoaded) {
return SizedBox.shrink();
}

reasonml

Copy
        final totalBalance = state.walletPayments.wallet!.totalBalance!;
        final totalHeldBalance = state.walletPayments.wallet!.totalHeldBalance!;
        final reservedAmount = (price * 0.20);

        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.defaultSize! * 2,
            horizontal: SizeConfig.defaultSize! * 3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomSubTitle(text: "هل أنت متأكد أنك تريد القبول؟"),
              const SizedBox(height: 10),
              CustomSubTitleMedium(text: projectName),
              const SizedBox(height: 20),
              _buildInfoRow("السعر", price.toString()),
              const SizedBox(height: 10),
              _buildInfoRow("زمن تسليم", "$date يوم"),
              const SizedBox(height: 20),
              Text(
                "سيتم حجز ${reservedAmount.toStringAsFixed(2)} من رصيدك",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 20),
              _buildWalletInfo(totalBalance, totalHeldBalance, price),
              const SizedBox(height: 30),
              CustomButtonGeneral(
                onPressed: onPressed,
                color: Colors.white,
                textcolor: Colors.black,
                text: "اضغط للقبول",
                borderSide: const BorderSide(color: Colors.grey),
                width: double.infinity,
              ),
            ],
          ),
        );
      },
    ),
  );
},
);
}

Widget _buildInfoRow(String title, String value) {
return Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
CustomSubTitleMedium(text: title),
CustomBody(text: value),
],
);
}

Widget _buildWalletInfo(double totalBalance, double totalHeldBalance, int price) {
final newBalance = totalBalance - price;
final newHeldBalance = totalHeldBalance + (price * 0.20);

return Row(
children: [
Icon(
IconlyBold.wallet,
size: SizeConfig.defaultSize! * 8,
),
const SizedBox(width: 10),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const CustomSubTitle(text: "سيصبح رصيدك بعد استلامك المشروع:"),
CustomSubTitleMedium(
text: "ل.س ${newBalance.toStringAsFixed(2)}",
color: Colors.grey,
),
const SizedBox(height: 10),
const CustomSubTitle(text: "سيصبح الرصيد المحجوز:"),
CustomSubTitleMedium(
text: newHeldBalance.toStringAsFixed(2),
color: Colors.grey,
),
],
),
),
],
);
}
*/