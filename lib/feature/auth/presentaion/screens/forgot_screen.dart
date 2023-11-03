import 'package:persona2/core/config/routes/app.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.h),
            Container(
              height: 400.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int pageIndex) {
                  setState(() {
                    _currentPageIndex = pageIndex;
                  });
                },
                children: [
                  Page1(
                    currentPageIndex: _currentPageIndex,
                    pageController: _pageController,
                  ),
                  Page2(
                    currentPageIndex: _currentPageIndex,
                    pageController: _pageController,
                  ),
                  Page3(
                    currentPageIndex: _currentPageIndex,
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

