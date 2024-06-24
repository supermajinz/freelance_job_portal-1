import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/constants/colors.dart';
import 'package:iconly/iconly.dart';
import 'package:navigation_view/item_navigation_view.dart';
import 'package:navigation_view/navigation_view.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
        backgroundColor: Theme.of(context).primaryColor,
        curve: Curves.fastEaseInToSlowEaseOut,
        //durationAnimation: const Duration(microseconds: 1000),
        color: primaryColer,
        borderTopColor: primaryColer,
        onChangePage: (p0) {},
        items: [
          ItemNavigationView(
              childAfter: const Icon(
                IconlyBold.profile,
                color: primaryColer,
                size: 30,
              ),
              childBefore: const Icon(
                IconlyBold.profile,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: const Icon(
                IconlyBold.bag,
                color: primaryColer,
                size: 30,
              ),
              childBefore: const Icon(
                IconlyBold.bag,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: const Icon(
                IconlyBold.search,
                color: primaryColer,
                size: 30,
              ),
              childBefore: const Icon(
                IconlyBold.search,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: const Icon(
                IconlyBold.chat,
                color: primaryColer,
                size: 30,
              ),
              childBefore: const Icon(
                IconlyBold.chat,
                color: Colors.grey,
                size: 30,
              )),
          ItemNavigationView(
              childAfter: const Icon(
                IconlyBold.home,
                color: primaryColer,
                size: 30,
              ),
              childBefore: const Icon(
                IconlyBold.home,
                color: Colors.grey,
                size: 30,
              )),
        ]);
  }
}
