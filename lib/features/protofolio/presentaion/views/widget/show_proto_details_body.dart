import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/custom_protofolio_card.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/edit_text_form.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/widget/show_chip.dart';

class ShowProtoDetailsBody extends StatelessWidget {
  const ShowProtoDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.defaultSize! * 1.5,
              vertical: SizeConfig.defaultSize! * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VirticalSpace(1),
              const Center(
                child: Text(
                  "Order Management App",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const VirticalSpace(2),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce fermentum lacus metus. Vivamus faucibus ullamcorper velit, id facilisis lacus tempus.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const VirticalSpace(4),
              SizedBox(
                height: SizeConfig.defaultSize! * 38.5,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomProtofolioCard();
                  },
                ),
              ),
              const VirticalSpace(4),
              const Text(
                "Skills Used",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const VirticalSpace(2),
              const ShowChip(),
              const VirticalSpace(5),
              const Row(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  HorizintalSpace(20),
                  Text(
                    "14/7/2022",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
              const VirticalSpace(2),
              Row(
                children: [
                  const HorizintalSpace(22.8),
                  Row(
                    children: [
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.visibility_outlined)),
                          const Text(
                            "3000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      const HorizintalSpace(1),
                      Column(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite)),
                          const Text(
                            "5000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              const VirticalSpace(5),
              const EditTextForm(
                  initvalue: "https://docs.google.com/d/10qgrbMt3I",
                  hinttext: "",
                  lable: "Link",
                  isNumber: false),
            ],
          ),
        )
      ],
    );
  }
}
