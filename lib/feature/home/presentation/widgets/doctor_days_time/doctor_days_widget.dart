import 'package:intl/intl.dart';
import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

class DoctorDaysWidget extends StatefulWidget {
  const DoctorDaysWidget(
      {super.key,
      required this.doctor,
      required this.telehealth,
      required this.clincId});
  final Doctors doctor;
  final String telehealth;
  final int clincId;

  @override
  State<DoctorDaysWidget> createState() => _DoctorDaysWidgetState();
}

class _DoctorDaysWidgetState extends State<DoctorDaysWidget> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var daysCubit = cubit.doctorDays;
        return daysCubit == null
            ? const MainLoading()
            : TableCalendar(
                firstDay: DateTime.now(),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                locale: UserLocal.lang == true ? 'ar' : 'en',
                calendarFormat: CalendarFormat.month,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                weekNumbersVisible: false,
                daysOfWeekHeight: 35.h,
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    for (var oneDay in cubit.listDays) {
                      oneDay = oneDay[0].toUpperCase() +
                          oneDay.substring(1).toLowerCase();
                      if (oneDay == DateFormat.EEEE().format(day)) {
                        return Chip(
                          labelPadding: EdgeInsets.zero,
                          padding: const EdgeInsets.all(12),
                          shadowColor: Colors.amber,
                          surfaceTintColor: Colors.amber,
                          deleteIconColor: Colors.amber,
                          label: Text(
                            "${day.day}",
                            style: const TextStyle(color: AppColors.wColor),
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                        );
                      }
                    }
                    return null;
                  },
                ),
                onDaySelected: (selectedDay, focusedDay) {
                  String day = DateFormat.EEEE().format(selectedDay);
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                  cubit.getDoctorTime(
                      doctorId: widget.doctor.id!,
                      schedules: widget.telehealth,
                      day: day,
                      clinicId: widget.clincId);
                },
              );
      },
    );
  }
}
