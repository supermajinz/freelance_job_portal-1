import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/protofolio/presentaion/views/widget/edit_protofolio_body.dart';

class EditProtofolio extends StatelessWidget {
  const EditProtofolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Protofolio'),centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: const Icon(Icons.arrow_back, size: 25))),
      ),
      body: const SafeArea(child: EditProtofolioBody()),
    );
  }
}