
import '../../../../../../core/config/routes/app.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.img,
  });
  final String title;
  final String subTitle;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
   
        Image.asset(
          img,
          width: context.w * 0.8,
          height: context.h * 0.4,
        ),
        context.sizeH(0.05),
       Padding(
         padding:  EdgeInsets.symmetric(horizontal: 15.w),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
             Text(
            title,
            style:   TextStyle(
              fontSize: 28.sp,
              color: const Color(0xff4a4b4d),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.start,
            softWrap: false,
          ),
          context.sizeH(0.01),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.titleSmall,
            textHeightBehavior:
                const TextHeightBehavior(applyHeightToFirstAscent: false),
            textAlign: TextAlign.center,
            
          )
             
          ],
         ),
       )],
    );
  }
}
