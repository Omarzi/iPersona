import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

class DoctorCardInformation extends StatelessWidget {
  const DoctorCardInformation({super.key, required this.doctor});
  final Doctors doctor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // showModalBottomSheet(
        //     context: context,
        //     builder: (context) => const CustomPaymentButtomSheet());
      },
      child: Card(
      shape: RoundedRectangleBorder(
      side:
      BorderSide(color: AppColors.primaryColor, width: 1.2.w),
      borderRadius: BorderRadius.circular(
      12.r),),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              MainImageNetwork(
                image: doctor.image ??
                    'https://cdn3.vectorstock.com/i/1000x1000/28/02/horse-icon-vector-25322802.jpg',
                height: 100.h,
                width: 90.w,
                   shape: BoxShape.circle,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,

                    child: Text(
                      doctor.name ?? 'Loading',
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(   width: 200.w,
                    height: 20.h,
                    child: Text(
                      doctor.information!.jobTitle ?? '..',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 10.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      if (doctor.doctorRatings!.isNotEmpty)
                        for (int i = 0;
                            i < doctor.doctorRatings![0].rating!.toInt();
                            i++)
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
