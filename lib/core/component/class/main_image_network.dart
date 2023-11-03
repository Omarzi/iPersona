import 'package:cached_network_image/cached_network_image.dart';
import '../../config/routes/app.dart';

class MainImageNetwork extends StatelessWidget {
  const MainImageNetwork({
    Key? key,
    this.width = 0.28,
    this.height = 0.13,
    required this.image,
    this.fit = BoxFit.cover,
    this.infinityWight = false,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);
  final BoxFit fit;
  final String image;
  final double width;
  final double height;
  final BoxShape shape;
  final bool infinityWight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: CachedNetworkImage(
        imageUrl: image,
        fit: fit,
        imageBuilder: (context, imageProvider) {
          return Container(
            width:width.w,
            height: height.h,
            decoration: BoxDecoration(
              shape: shape,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            width: 150.0.w,
            height: 180.0.h,
            color: Colors.red,
            margin: EdgeInsets.all(50.w),
            child: Lottie.asset(
              height: 50.h,
              width: 50.w,
              AppImage.lottieError,
              fit: BoxFit.contain,
            ),
          );
        },
        progressIndicatorBuilder: (context, url, progress) {
          return CircularProgressIndicator(
            value: progress.downloaded.toDouble(),
            strokeWidth: 0.7,
          );
        },
      ),
    );
  }
}
