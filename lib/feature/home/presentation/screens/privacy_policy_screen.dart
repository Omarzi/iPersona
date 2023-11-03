import 'package:persona2/core/config/routes/app.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
          leading: CustomBackButton(),
          title: Text(
            AppLocalizations.of(context)!.translate(AppStrings.privacyPolicy)!,
            style: const TextStyle(
              color: AppColors.blackColor,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
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
                                    .translate("brief")!)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
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
                                      .translate("paragraph_$i")!)),
                            ],
                          ),
                        )

                      //   Text(
                      //     "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words believable. It is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more ",
                      //     style: TextStyle(
                      //       color: AppColors.color3.withOpacity(0.6),
                      //       height: 1.6.h,
                      //     ),
                      //   ),
                      //   ],
                      //  ),
                      //  SizedBox(height: 40.h),
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                      //     child: Column(
                      //       children: [
                      //         SizedBox(height: 10.h),
                      //         PolicyItem(
                      //             text:
                      //                 'The standard chunk of lorem Ipsum used since  1500s is reproduced below for those interested.'),
                      //         SizedBox(height: 15.h),
                      //         PolicyItem(
                      //             text:
                      //                 'Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum. The point of using.'),
                      //         SizedBox(height: 15.h),
                      //         PolicyItem(
                      //             text:
                      //                 'Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.'),
                      //         SizedBox(height: 15.h),
                      //         PolicyItem(
                      //             text:
                      //                 'The point of using Lorem Ipsum is that it has a moreIt is a long established fact that reader will distracted.'),
                      //       ],
                      //     ),
                      //   ),

                      //    SizedBox(height: 40.h),

                      //     Text(
                      //       'It is a long established fact that reader distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a moreIt is a long established.',
                      //       style: TextStyle(
                      //         color: AppColors.color3.withOpacity(0.6),
                      //         height: 1.6.h,
                      //       ),
                      //     ),

                      //  SizedBox(height: 10.h)
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

class PolicyItem extends StatelessWidget {
  const PolicyItem({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(AppImage.bool),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            maxLines: 3,
            style: TextStyle(
              color: AppColors.color3.withOpacity(0.6),
              height: 1.6.h,
            ),
          ),
        )
      ],
    );
  }
}
