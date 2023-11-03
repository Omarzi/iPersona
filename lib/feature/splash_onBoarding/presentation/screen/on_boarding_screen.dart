import 'package:persona2/core/component/widgets/dots/dots_indectator.dart';
import 'package:persona2/feature/splash_onBoarding/presentation/view/custom_page_view.dart';
import 'package:persona2/feature/splash_onBoarding/presentation/widgets/on_boarding/on_boarding_button.dart';
import 'package:persona2/feature/splash_onBoarding/presentation/widgets/on_boarding/skip.dart';

import '../../../../../core/config/routes/app.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageController;
  int position2 = 0;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  List<String> images = [
    AppImage.onBoardingBgLeft,
    AppImage.onBoardingBgRight,
    AppImage.onBoardingBgLeft,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (position2 == 1)
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(images[position2]),
            ),
            if(position2 != 1)
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(images[position2]),
            ),
          Column(
            children: [
              SizedBox(height: 20.h),
              position2 == 2 ? context.sizeH(0.06) : const Skip(),
              
              CustomPageView(
                pageController: pageController!,
                onPageChanged: (position) {
                  setState(() {});
                  position2 = position;
                  final t = pageController!.page;
                },
              ),
              DotsIndicator(
                position: position2.toDouble(),
                dotsCount: 3,
              ),
              const Spacer(flex: 2),
              OnBoardingButton(
                pageController: pageController!,
                position2: position2,
              ),
              context.sizeH(0.06)
            ],
          ),
        ],
      ),
    );
  }
}
