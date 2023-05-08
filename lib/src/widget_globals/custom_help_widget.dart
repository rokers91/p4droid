import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:url_launcher/url_launcher.dart';

class HelpContactListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const HelpContactListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: ScreenUtil().setSp(20)),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      ),
      leading: Icon(
        icon,
        size: ScreenUtil().setWidth(40),
      ),
      trailing: IconButton(
        icon: icon == Icons.mail
            ? const Icon(Icons.mail)
            : const Icon(Icons.phone),
        onPressed: () {
          // launch(icon == Icons.mail ? 'mailto:$subtitle' : 'tel:$subtitle');
        },
      ),
    );
  }
}
