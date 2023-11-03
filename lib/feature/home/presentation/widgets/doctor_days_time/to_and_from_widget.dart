import 'package:persona2/core/config/routes/app.dart';

// ignore: must_be_immutable
class ToAndFromWidget extends StatefulWidget {
  ToAndFromWidget({
    super.key,
    required this.to,
    required this.from,
    required this.id,
    required this.index,
    required this.currentIndex,
    required this.fun,
  });
  final String to;
  final String from;
  final int id;
  final int index;
  int currentIndex;
  VoidCallback fun;
  @override
  State<ToAndFromWidget> createState() => _ToAndFromWidgetState();
}

class _ToAndFromWidgetState extends State<ToAndFromWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<BookCubit>().selectTimeFrom = widget.from;
            context.read<BookCubit>().selectTimeId = widget.id;
            setState(() {
              widget.fun();
            });
          },
          child: Container(
            margin: EdgeInsets.all(2.w),
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
                color: widget.currentIndex == widget.index
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12.sp)),
            child: Column(
              children: [
                Text(
                  widget.to,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.wColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  widget.from,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.wColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
