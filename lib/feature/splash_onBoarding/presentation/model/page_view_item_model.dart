

import 'package:persona2/core/config/routes/app.dart';

class PageViewItemModel {
  const PageViewItemModel({
    required this.title,
    required this.subTitle,
    required this.img,
  });
  final String title;
  final String subTitle;
  final String img;

  static List<PageViewItemModel> listPagesView = [
    const PageViewItemModel(
      img: AppImage.firstBoarding,
      title: 'Find Trusted Doctors',
      subTitle: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
    const PageViewItemModel(
      img: AppImage.twoBoarding,
      title: 'Choose Best Doctors',
      subTitle:  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
    const PageViewItemModel(
      img: AppImage.threetwBoarding,
      title: 'Easy Appointments',
      subTitle: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.',
    ),
  ];
}
