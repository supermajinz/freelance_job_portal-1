import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/app_router.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FreelanceJob());
}
//zen

//ahmad
//code bad
class FreelanceJob extends StatelessWidget {
  const FreelanceJob({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
);
  }
}