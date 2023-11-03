
import 'package:persona2/feature/splash_onBoarding/presentation/model/page_view_item_model.dart';
import 'package:persona2/feature/splash_onBoarding/presentation/widgets/on_boarding/page_view_item.dart';

import '../../../../../core/config/routes/app.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    Key? key,
    required this.onPageChanged,
    required this.pageController,
  }) : super(key: key);
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 9,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: pageController,
        itemCount: PageViewItemModel.listPagesView.length,
        itemBuilder: (context, index) {
          return PageViewItem(
            title: PageViewItemModel.listPagesView[index].title,
            subTitle: PageViewItemModel.listPagesView[index].subTitle,
            img: PageViewItemModel.listPagesView[index].img,
          );
        },
      ),
    );
  }
}
