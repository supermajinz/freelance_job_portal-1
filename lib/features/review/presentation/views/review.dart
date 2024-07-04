import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/review/presentation/views/widget/review_body.dart';

class Review extends StatelessWidget {
  const Review({super.key});

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
      body: const SafeArea(child: ReviewBody()),
    );
  }
}