import 'package:flutter/material.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';

class AddEditProto extends StatelessWidget {
  const AddEditProto({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          maxRadius: SizeConfig.defaultSize! * 8,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
