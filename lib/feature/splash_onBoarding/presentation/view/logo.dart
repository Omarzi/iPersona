
import '../../../../../core/config/routes/app.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppImage.logo),
        Text.rich(
          TextSpan(
            text: 'Food',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
            children: [
              TextSpan(
                text: 'Zone',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 27.sp),
              ),
            ],
          ),
        ),
          Text(
          'FOOD DELIVERY',
          style: TextStyle(color: Color(0xFF707070), fontSize: 13.sp),
        ),
      ],
    );
  }
}
