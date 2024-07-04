import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/show_proto_details_body.dart';

class ShowProtoDetails extends StatelessWidget {
  const ShowProtoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: const Icon(Icons.arrow_back, size: 25))),
      ),
      body: const SafeArea(child: ShowProtoDetailsBody()),
    );
  }
}