// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SettingsTileWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      tileColor: Colors.white,
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      // subtitle: const Text(
      //   'List Tile Subtitle',
      //   style: TextStyle(
      //     color: Colors.black,
      //   ),
      // ),
      trailing: Container(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}
