import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/view_models/bloc/wallet_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/wallet_body.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is AuthGuest) {
          return const Placeholder();
        } else if (authState is AuthAuthenticated) {
          return BlocConsumer<WalletBloc, WalletState>(
            listener: (context, state) {
              if (state is WalletError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.errorMessage}')),
                );
              }
            },
            builder: (context, state) {
              context.read<WalletBloc>().add(GetWalletPayments(authState.id));

              if (state is WalletLoading) {
                return const CircularProgressIndicator();
              }
              if (state is WalletPaymentsLoaded) {
                return Scaffold(
                  appBar: AppBar(
                      title: const CustomTitle(
                        text: 'المحفظة',
                        white: true,
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(IconlyLight.info_circle,color: Colors.white,size: 30),
                          onPressed: () {
                            _showGuidelinesBottomSheet(context);
                          },
                        ),
                      ],
                      centerTitle: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      leading: CustomIconBack(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      )),
                  body: SafeArea(
                      child: WalletBody(
                    wallet: state.walletPayments,
                    myUserId: authState.id,
                  )),
                );
              } else {
                print('state error ${state.props}');
                return Scaffold(
                  appBar: AppBar(
                      title: const CustomTitle(
                        text: 'المحفظة',
                        white: true,
                      ),
                      centerTitle: true,
                      backgroundColor: Theme.of(context).primaryColor,
                      leading: CustomIconBack(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      )),
                  body: Center(
                    child: Text('Unexpected State: ${state.toString()}'),
                  ),
                );
              }
            },
          );
        } else {
          return Center(
            child: Text('Unexpected State: ${authState.toString()}'),
          );
        }
      },
    );
  }
}

void _showGuidelinesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              IconlyBold.info_circle,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            const Text(
              'إرشادات الاستخدام',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'هنا يمكنك العثور على جميع المعلومات والنصائح المتعلقة باستخدام المحفظة بشكل صحيح وآمن.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ],
        ),
      );
    },
  );
}
