import 'package:persona2/core/config/routes/app.dart';

class ProfileScreen extends StatelessWidget {
   const ProfileScreen({super.key,this.showBackButton = true});
final bool showBackButton;
  @override
  Widget build(BuildContext context) {
    return Container(decoration:  BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                gredeantColor,
              ],
            ),
          ),
      child: UserLocal.token == null
        ? Center(
          child: SizedBox(
            width: 150.w,
            child: MainButton(
                text: AppLocalizations.of(context)!
                .translate(AppStrings.login)!,
                onPressed: () {
                  context.to(AppRoutePath.loginScreen);
                },
              ),
          ),
        )
        : Scaffold(
        backgroundColor: Colors.transparent,
        appBar: profileAppBar(context,showBackButton: showBackButton),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              BlocBuilder<HomeCubit,HomeState>(
                builder: (context, state) {
                  var cubit = HomeCubit.get(context);
                  var profile = cubit.userProfile;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                           Text(
                           AppLocalizations.of(context)!
                .translate(AppStrings.personalInformation)!,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          MainTextFormField(
                //             labelText: AppLocalizations.of(context)!
                // .translate(AppStrings.name)!,
                            labelSize: 18.r,
                            primaryScheme: AppColors.blackColor,
                            borderRadius: 10.r,
                            height: 15.h,
                            textFormColor: AppColors.color3,
                            initialValue:profile == null ? '..' : profile.data!.name ,
                          ),
                          SizedBox(height: 25.h),
                          MainTextFormField(
                            labelSize: 18.r,
                            // labelText:AppLocalizations.of(context)!
                // .translate(AppStrings.contactNumber)! ,
                             initialValue:profile == null ? '..' : profile.data!.information!.phone ,
                            primaryScheme: AppColors.blackColor,
                            suffixIcon: Icon(Icons.edit, size: 22.sp),
                            borderRadius: 10.r,
                               textFormColor: AppColors.color3,
                            height: 15.h,
                          ),
                          // SizedBox(height: 15.h),
                          // MainTextFormField(
                          //   labelSize: 18.r,
                          //   primaryScheme: AppColors.blackColor,
                          //   labelText: 'Date of birth',
                          //   suffixIcon: Icon(Icons.edit),
                          //   height: 15.h,
                          //   borderRadius: 10,
                          // ),
                          // SizedBox(height: 15.h),
                          // MainTextFormField(
                          //   primaryScheme: AppColors.blackColor,
                          //   labelText: 'Location',
                          //   labelSize: 18.r,
                          //   borderRadius: 10,
                          //   height: 15.h,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
