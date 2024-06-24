import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/custom_button_general.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:iconly/iconly.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  IconlyBold.wallet,
                  size: 150,
                ),
                HorizintalSpace(1),
                Column(
                  children: [
                    Text(
                      "Balance:",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "SYP 20,000,000",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text("Withheld Funds:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900)),
                    Text("SYP 7,500,000", style: TextStyle(fontSize: 18)),
                  ],
                )
              ],
            ),
          ),
          const VirticalSpace(2),
          Row(
            children: [
              CustomButtonGeneral(
                  onPressed: () {},
                  color: Colors.deepPurple,
                  textcolor: Colors.white,
                  text: "Deposit",
                  borderSide: const BorderSide(width: 0),
                  width: 160),
              const Spacer(),
              CustomButtonGeneral(
                  onPressed: () {},
                  color: primaryColer,
                  textcolor: Colors.white,
                  text: "Withdraw",
                  borderSide: const BorderSide(width: 0),
                  width: 160)
            ],
          ),
          const VirticalSpace(3),
          const Text(
            "Transaction History:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const VirticalSpace(2),
          SizedBox(
            height: 435,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            "SYP 5,000,000 ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "has been sent to ",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "Ahmad Murad ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "for ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "Order Management App",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Text(
                        "Date: 12/2/2024",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Transaction ID: 94786746873743876",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: 6),
          )
        ],
      ),
    );
  }
}
