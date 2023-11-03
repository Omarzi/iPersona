import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/core/utils/app_strings.dart';
import 'package:url_launcher/url_launcher.dart';

Future<DateTime?> customData(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
          DateTime.now().year - 1, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

PreferredSize homeAppBar(BuildContext context) => PreferredSize(
      preferredSize: Size.fromHeight(140.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6F427D),
              Color(0xFFBA80CC),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              child: Container(
                color: Colors.amber,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                height: 50,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<HomeCubit, HomeState>(
                            builder: (context, state) {
                              var cubit = HomeCubit.get(context);
                       
                              return Text(
                                "${AppLocalizations.of(context)!.translate(AppStrings.hi)!} ${UserLocal.token== null ? '' :cubit.userProfile == null ? '' : cubit.userProfile!.data!.name}",
                                style: TextStyle(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            AppLocalizations.of(context)!
                                .translate(AppStrings.findYourDoctor)!,
                            style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: CircleAvatar(
                            radius: 25.r,
                            // backgroundImage: AssetImage(AppImage.mo),
                            child: Icon(Icons.menu),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 10,
              child: Container(
                color: Colors.amber,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                // width: double.infinity,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );

PreferredSize profileAppBar(BuildContext context,
        {bool showBackButton = true}) =>
    PreferredSize(
      preferredSize: Size.fromHeight(200.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 122, 131, 183),
              Color(0xFFb280c7),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                showBackButton == true
                    ? const CustomBackButton()
                    : const SizedBox.shrink(),
                SizedBox(width: 15.w,),
                Text(
                  AppLocalizations.of(context)!.translate(AppStrings.profile)!,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Theme.of(context).cardColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)!
                  .translate(AppStrings.setupYourProfile)!,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).cardColor,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.translate(AppStrings
                  .updateYourProfileToConnectYourDoctorWithBetterImpression)!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            // Stack(
            //   children: [
            //      CircleAvatar(
            //       radius: 60.sp,
            //       backgroundImage: AssetImage(AppImage.mo),
            //     ),
            //     Positioned(
            //       bottom: 0,
            //       right: 0,
            //       child: FloatingActionButton(
            //         onPressed: () {},
            //         mini: true,
            //         backgroundColor: Color(0xFF7e849a).withOpacity(0.7),
            //         child: Icon(
            //           Icons.camera_alt_sharp,
            //           color: Theme.of(context).cardColor,
            //           size: 20.r,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.platformDefault,
  )) {
    throw Exception('Could not launch $url');
  }
}
