import 'package:persona2/core/config/routes/app.dart';

class TimeWidget extends StatefulWidget {
   TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
int currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ConstToAndFrom(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return cubit.doctorTimeModel == null
                ?  Text(AppLocalizations.of(context)!.translate(AppStrings.pleaseChoosseTime)!)
                : SizedBox(
                    height: 150.h,
                    width: 300.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.doctorTimeModel!.data!.length,
                      itemBuilder: (context, index) {
                        var to = cubit.doctorTimeModel!.data![index].to;
                        var from = cubit.doctorTimeModel!.data![index].from;
                        var id = cubit.doctorTimeModel!.data![index].id;
                        return ToAndFromWidget(
                          id: id ?? 0,
                          fun: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          to: to ?? '..',
                          from: from ?? '..',
                          index: index,
                          currentIndex: currentIndex,
                        );
                      },
                    ),
                  );
          },
        ),
      ],
    );
  }
}
