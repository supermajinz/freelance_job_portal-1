import 'package:flutter/material.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/wallet_body.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: WalletBody()),
    );
  }
}
