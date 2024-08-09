import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/profile/presentation/views/profile.dart';
import 'package:freelance_job_portal/features/profile/worker%20profile/widgets/worker_profile_screen.dart';

class ProfileSwitcher extends StatefulWidget {
  const ProfileSwitcher({Key? key}) : super(key: key);

  @override
  State<ProfileSwitcher> createState() => _ProfileSwitcherState();
}

class _ProfileSwitcherState extends State<ProfileSwitcher> {
  bool _isWorkerProfile = false; // Default to Client Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const VirticalSpace(1),
          // Animated Switcher for smooth transition
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) => SlideTransition(
                    position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0), end: Offset.zero)
                        .animate(animation),
                    child: child),
                child: _isWorkerProfile
                    ? _buildWorkerSwitch()
                    : _buildClientSwitch(),
              ),
            ),
          ),
          VirticalSpace(1),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: _isWorkerProfile
                  ? const WorkerProfileScreen()
                  : const Profile(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientSwitch() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isWorkerProfile = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Client',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Center(
                child: Text(
                  'Worker',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkerSwitch() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isWorkerProfile = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'Client',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Worker',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
