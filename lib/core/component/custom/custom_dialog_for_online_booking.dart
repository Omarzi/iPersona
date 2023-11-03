import 'dart:developer';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/book_doctor_model.dart';

class CustomDialogForBookOnline extends StatefulWidget {
  const CustomDialogForBookOnline({
    super.key,
    required this.bookDoctorOnlineDate,
    required this.selectTimeFrom,
    required this.selectTimeId,
  });

  final List<BookDoctorOnlineDate> bookDoctorOnlineDate;
  final String? selectTimeFrom;
  final int? selectTimeId;

  @override
  State<CustomDialogForBookOnline> createState() =>
      _CustomDialogForBookOnlineState();
}

class _CustomDialogForBookOnlineState extends State<CustomDialogForBookOnline> {
  int selectedPaymentOption = 0;
  String? phone;
  List<String> paymentImages = [
    'assets/images/pank_cards.png',
    'assets/images/fawry.png',
    'assets/images/wallet.png',
    'assets/images/aman.png',
    'assets/images/masariPayments.jpg',
  ];
  int? selectId;

  @override
  void initState() {
    selectId = widget.bookDoctorOnlineDate[0].paymentId;
    super.initState();
  }

  var promoCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            gredeantColor,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 15.h,
      ),
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .translate(AppStrings.choosePaymentMethod)!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 10.w),
                  SizedBox(
                    height: 200.h,
                    child: Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.bookDoctorOnlineDate.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context, int index) {
                          print(
                              "the lenth is ${widget.bookDoctorOnlineDate.length}");
                          var item = widget.bookDoctorOnlineDate[index];
                          return SizedBox(
                            height: 40.h,
                            child: RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.values.last,
                              title: Row(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                    height: 20.h,
                                    child: Image.asset(
                                      paymentImages[index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 5.w),
                                  Flexible(
                                    child: Text(
                                      UserLocal.lang == true
                                          ? item.nameAr ?? '..'
                                          : item.nameEn ?? '..',
                                      maxLines: 1,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              value: index,
                              groupValue: selectedPaymentOption,
                              onChanged: (int? value) {
                                setState(() {
                                  selectedPaymentOption = value!;
                                });
                                selectId = item.paymentId;
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 5.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        MainTextFormField(
                          hintText: "Promo Code",
                          controller: promoCode,
                          textFormColor: AppColors.blackColor,
                        ),
                        SizedBox(height: 16.h),
                        MainTextFormField(
                          hintText: "Mobile",
                          onChanged: (phoneValue) {
                            setState(() {
                              phone = phoneValue;
                            });
                          },
                          initialValue: HomeCubit.get(context)
                                      .userProfile!
                                      .data!
                                      .information!
                                      .phone ==
                                  null
                              ? AppLocalizations.of(context)!
                                  .translate("pleaseEnterPhone")!
                              : HomeCubit.get(context)
                                      .userProfile!
                                      .data!
                                      .information!
                                      .phone ??
                                  'Loading...',
                          textFormColor: AppColors.blackColor,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(AppLocalizations.of(context)!
                            .translate(AppStrings.cancle)!),
                      ),
                      SizedBox(width: 16.w),
                      BlocConsumer<BookCubit, BookState>(
                        listener: (context, state) {
                          var cubit = BookCubit.get(context);

                          if (state is PaymentSuccess) {
                            if (selectId == 2) {
                              context.to(AppRoutePath.mainWebView,
                                  arguments: cubit.paymentOnlineModel!.data);
                              log("in select 2 is the link is ${cubit.paymentOnlineModel!.data}");
                            } else {
                              state is PaymentLoading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : showDialog(
                                      context: context,
                                      builder: (context) {
                                        return state is PaymentLoading
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : Dialog(
                                                insetPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 30.w),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Container(
                                                  height: 200.h,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 25.w,
                                                    vertical: 15.h,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "${cubit.paymentOnlineModel == null ? 'Loading..' : cubit.paymentOnlineModel!.data ?? 'Load...'}",
                                                            style: TextStyle(
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          Text(AppLocalizations
                                                                  .of(context)!
                                                              .translate(AppStrings
                                                                  .pleaseMakeThePayment)!),
                                                        ],
                                                      ),
                                                      ElevatedButton(
                                                        child: Text(AppLocalizations
                                                                .of(context)!
                                                            .translate(AppStrings
                                                                .backToHome)!),
                                                        onPressed: () {
                                                          context.toAndRemoveAllScreen(
                                                              AppRoutePath
                                                                  .loyoutScreen);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                      },
                                    );
                            }
                          } else if (state is PaymentError) {
                            flutterToast(
                                msg: "Some Thing Error",
                                color: Theme.of(context).primaryColor);
                          }
                        },
                        builder: (context, state) {
                          var cubit = BookCubit.get(context);
                          return ElevatedButton(
                            onPressed: () {
                              cubit.payment(
                                  scheduleId: widget.selectTimeId ?? 0,
                                  promoCode: promoCode.text,
                                  mobile: phone ??
                                      HomeCubit.get(context)
                                          .userProfile!
                                          .data!
                                          .information!
                                          .phone ??
                                      '',
                                  selectId: selectId ?? 2);
                            },
                            child: state is PaymentLoading
                                ? const CircularProgressIndicator()
                                : Text(AppLocalizations.of(context)!
                                    .translate(AppStrings.pay)!),
                          );
                        },
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(child: SizedBox())
        ],
      ),
      // ),
    );
  }
}

void customBottomSheet(BuildContext context, {required Widget widget}) =>
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      showDragHandle: true,
      backgroundColor: AppColors.wColor,
      builder: (context) =>
          Padding(padding: MediaQuery.of(context).viewInsets, child: widget),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    );
