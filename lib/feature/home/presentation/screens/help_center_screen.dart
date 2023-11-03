import 'package:persona2/core/config/routes/app.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

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
      child: Scaffold(
                backgroundColor: Colors.transparent,

          appBar: AppBar(
            leading: const CustomBackButton(),
            title:  Text(
             AppLocalizations.of(context)!
                                        .translate(AppStrings.helpCenter)!,
              style: TextStyle(color: AppColors.blackColor),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
          
              for (int i = 1; i <= 33; i++)
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(AppImage.bool),
                                ),
                                SizedBox(width: 10.w),
                                Flexible(
                                    child: Text(AppLocalizations.of(context)!
                                        .translate("explain_line_$i")!)),
                              ],
                            ),
                          )
          
          
          
          
                // Container(
                //     padding: EdgeInsets.symmetric(
                //       // horizontal: 110.w,
                //       vertical: 20.h,
                //     ),
                //     margin: EdgeInsets.symmetric(horizontal: 10.w),
                //     decoration: BoxDecoration(
                //       color: AppColors.wColor,
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       children: [
                //         SizedBox(width: 10.w),
                //         Text(
                //           'I have an issue with',
                //           textAlign: TextAlign.start,
                //           style: TextStyle(
                //             color: AppColors.primaryColor,
                //             fontSize: 20.sp
                //           ),
                //         )
                //       ],
                //     )),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: HelpCenterDetails.list.length,
                //     itemBuilder: (context, index) => ListTile(
                //       title: Text(
                //         HelpCenterDetails.list[index].text,
                //         style: TextStyle(
                //           color: AppColors.color3,
                //           fontSize: 19.sp,
                //         ),
                //       ),
                //       trailing: const Icon(
                //         Icons.arrow_forward_ios_rounded,
                //         color: AppColors.color3,
                //       ),
                //     ),
                //   ),
                // ),
              
              
              
              
              ],
            ),
          )),
    );
  }
}

class HelpCenterDetails {
  final String text;
  HelpCenterDetails({required this.text});
  static List<HelpCenterDetails> list = [
    HelpCenterDetails(text: 'Booking a new Appointment'),
    HelpCenterDetails(text: 'Existing Appointment'),
    HelpCenterDetails(text: 'Online consultations'),
    HelpCenterDetails(text: 'Feedbacks'),
    HelpCenterDetails(text: 'Medicine orders'),
    HelpCenterDetails(text: 'Diagnostic Tests'),
    HelpCenterDetails(text: 'Health plans'),
    HelpCenterDetails(text: 'My account and Practo Drive'),
    HelpCenterDetails(text: 'Have a feature in mind'),
    HelpCenterDetails(text: 'Other issues'),
  ];
}
