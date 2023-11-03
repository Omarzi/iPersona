import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/hospital/hospital_cubit.dart';

class HospitalBooking extends StatefulWidget {
  const HospitalBooking({super.key, required this.onHospital});
  final OneHospitalInSearched onHospital;

  @override
  State<HospitalBooking> createState() => _HospitalBookingState();
}

class _HospitalBookingState extends State<HospitalBooking> {
  int currentIndexRoom = 0;
  int? currentRoomId;
  List<String> images = [];
  @override
  void initState() {

    if (context.read<HospitalCubit>().hospitalDetailsModel != null) {
      context
          .read<HospitalCubit>()
          .hospitalDetailsModel!
          .data!
          .images!
          .forEach((element) {
        if (widget.onHospital.id! == element.hospitalId) {
          images.add(element.image!);
        }
      });
    }
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(
          'Hospital Booking',
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
              child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImage.hospital2,
                      height: 100.h,
                      width: 90.w,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            widget.onHospital.name ?? 'Loading',
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text('Specialist Cardiologist'),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('7 Years experience'),
                            SizedBox(width: 10.w),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2.8',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '[2821 views]')
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Spacer(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 20),
                          ),
                          TextSpan(
                            text: '28.00/ hr',
                            style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grayApp),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 140.w,
                      height: 50.h,
                      child: MainButton(
                        text:AppLocalizations.of(context)!.translate(AppStrings.bookNow)!,
                        onPressed: () {
                          // context.to(AppRoutePath.doctorDetailsScreen);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )),

          BlocConsumer<HospitalCubit, HospitalState>(
            listener: (context, state) {
              if (state is BookHospitalSuccess) {
                flutterToast(
                    msg: "Booking Sucess",
                    color: Theme.of(context).primaryColor);
              }
            },
            builder: (context, state) {
              var cubit = HospitalCubit.get(context);
              var model = cubit.hospitalDetailsModel;
              return model == null
                  ? MainLoading()
                  : Flexible(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Flexible(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.data!.rooms!.length,
                              itemBuilder: (context, index) {
                                var item = model.data!.rooms![index];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndexRoom = index;
                                      currentRoomId = item.id;
                                    });
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.r)),
                                    color: currentIndexRoom == index
                                        ? Color.fromARGB(255, 231, 228, 228)
                                        : Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '\$${item.price}',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            '${item.type}',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: AppColors.color3
                                                // fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(height: 10.h),
                                          SizedBox(
                                            width: 80.w,
                                            height: 30.h,
                                            child: MainButton(
                                              text: AppLocalizations.of(context)!.translate(AppStrings.bookNow)!,
                                              fontSizeText: 10.sp,
                                              borderRadius: 5,
                                              onPressed: () {
                                                if (currentRoomId == null) {
                                                  flutterToast(
                                                      msg: "Please Choose Room",
                                                      color: Theme.of(context)
                                                          .primaryColor);
                                                } else {
                                                  cubit.bookHospital(
                                                    hospitalId:
                                                        widget.onHospital.id!,
                                                    roomId: currentRoomId!,
                                                  );
                                                }
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),

          // Image.asset(AppImage.pa),
          BlocBuilder<HospitalCubit, HospitalState>(
            buildWhen: (previous, current) {
              return images != [];
            },
            builder: (context, state) {
              return SliderImages(imagesList: images);
            },
          ),
          Text(
               AppLocalizations.of(context)!.translate(AppStrings.ratting)!,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImage.mo),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Muhammed',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text('Thank you Doctor'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
