import 'package:persona2/core/component/custom/custom_like_view.dart';
import 'package:persona2/core/config/routes/app.dart';

class CustomPaymentButtomSheet extends StatelessWidget {
  const CustomPaymentButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(AppImage.payment),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Confirm Payment',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          MainTextFormField(
            hintText: 'NAME ON CARD',
            borderRadius: 12,
            borderColor: AppColors.color3.withOpacity(0.2),
          ),
          SizedBox(height: 20.h),
          MainTextFormField(
            hintText: 'CARD NUMBER',
            borderRadius: 12,
            borderColor: AppColors.color3.withOpacity(0.2),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Flexible(
                child: MainTextFormField(
                  hintText: 'EXP DATE',
                  borderRadius: 12,
                  borderColor: AppColors.color3.withOpacity(0.2),
                ),
              ),
              SizedBox(width: 70.w),
              Flexible(
                child: MainTextFormField(
                  hintText: 'CVV',
                  borderRadius: 12,
                  borderColor: AppColors.color3.withOpacity(0.2),
                ),
              ),
            ],
          ),
          Spacer(),
          MainButton(
            text: AppLocalizations.of(context)!.translate(AppStrings.confirm)!,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const CustomLikeView());
            },
          )
        ],
      ),
    );
  }
}
