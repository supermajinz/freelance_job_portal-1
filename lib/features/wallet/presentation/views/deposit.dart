import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/deposit_body.dart';

class Deposit extends StatelessWidget {
  const Deposit({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1)),
                child: const Icon(Icons.arrow_back, size: 25))),
      ),
      body: const DepositBody(),
    );
  }
}
