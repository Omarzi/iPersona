import 'package:flutter/cupertino.dart';
import 'package:persona2/core/config/routes/app.dart';

class SettingModel {
  String title;
  IconData icon;
  Color color;
  SettingModel({
    required this.color,
    required this.icon,
    required this.title,
  });

 static List<SettingModel> listSettingData = [
    SettingModel(
      color: const Color(0xFFEB5757),
      icon: Icons.lock,
      title: 'Change Password',
    ),
    SettingModel(
      color: const Color(0xFF219653),
      icon: Icons.notifications_active,
      title: 'Notifications',
    ),
    SettingModel(
      color: const Color(0xFF56CCF2),
      icon: Icons.stacked_bar_chart,
      title: 'Statistics',
    ),
    SettingModel(
      color: const Color(0xFFF2994A),
      icon: CupertinoIcons.profile_circled,
      title: 'About us',
    ),
  ];
}
