
import 'package:persona2/core/config/routes/app.dart';

class TitleForgotScreen extends StatelessWidget {
  const TitleForgotScreen({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:   TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subTitle,
          style:   TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
      ],
    );
  }
}
