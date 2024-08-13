import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/widget/custom_icon_back.dart';
import 'package:freelance_job_portal/core/widget/custom_title.dart';
import 'package:freelance_job_portal/features/auth/presentation/view_models/bloc/auth_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/view_models/bloc/wallet_bloc.dart';
import 'package:freelance_job_portal/features/wallet/presentation/views/widget/wallet_body.dart';
import 'package:go_router/go_router.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        if (authState is AuthGuest) {
          return Placeholder();
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
                return CircularProgressIndicator();
              }
              if (state is WalletPaymentsLoaded) {
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
                  body:
                      SafeArea(child: WalletBody(wallet: state.walletPayments,myUserId: authState.id,)),
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
