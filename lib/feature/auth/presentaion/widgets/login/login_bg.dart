import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/config/routes/app.dart';

class LoginBg extends StatelessWidget {
  const LoginBg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SvgPicture.asset(
        AppImage.loginBg,
        color: AppColors.primaryColor,
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
