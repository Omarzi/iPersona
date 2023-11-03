import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/search_doctor_model.dart';

class ListDoctorSearchedWidget extends StatelessWidget {
  const ListDoctorSearchedWidget({super.key, required this.telehealth});
  final String telehealth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var model = cubit.searchDoctorModel;
        return model == null
            ? const MainLoading()
            : Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: model.data!.doctors!.length,
                  itemBuilder: (context, index) {
                    Doctors item = model.data!.doctors![index];
                    return SearchedDoctorItem(
                      item: item,
                      telehealth: telehealth,
                    );
                  },
                ),
              );
      },
    );
  }
}
