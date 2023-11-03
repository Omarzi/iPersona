import '../../config/routes/app.dart';

class MainImageAssets extends StatelessWidget {
  const MainImageAssets({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(7)),
      child: Image.asset(
        image,
        width: context.w * 0.17,
        height: context.h * 0.05,
      ),
    );
  }
}

class MainImageAssets2 extends StatelessWidget {
  const MainImageAssets2({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 30.w,
      height: 30.h,
    );
  }
}
