import 'package:persona2/core/config/routes/app.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const SessionUserScreen(),
    const ProfileScreen(showBackButton: false),
  ];

  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  void initState() {
    context.read<SessionUserCubit>().getSessionUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bggraundLayoutScaffold,
      key: _scaffoldKey,
      endDrawer: const CustomDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedLabelStyle: const TextStyle(color: AppColors.color3),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == 0
                    ? Theme.of(context).primaryColor
                    : AppColors.noColor,
              ),
              child: Icon(
                Icons.home,
                color: currentIndex == 0 ? AppColors.wColor : AppColors.color3,
              ),
            ),
            label:
                AppLocalizations.of(context)!.translate(AppStrings.mainPage)!,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == 1
                    ? Theme.of(context).primaryColor
                    : AppColors.noColor,
              ),
              child: Icon(
                Icons.list_alt_outlined,
                color: currentIndex == 1 ? AppColors.wColor : AppColors.color3,
              ),
            ),
            label:
                AppLocalizations.of(context)!.translate(AppStrings.mysessions)!,
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 3
                      ? Theme.of(context).primaryColor
                      : AppColors.noColor),
              child: Icon(
                Icons.message,
                color: currentIndex == 3 ? AppColors.wColor : AppColors.color3,
              ),
            ),
            label:
                AppLocalizations.of(context)!.translate(AppStrings.myProfile)!,
          ),
        ],
      ),
    );
  }
}
