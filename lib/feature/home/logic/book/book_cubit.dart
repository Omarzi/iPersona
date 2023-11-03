import 'dart:developer';

import 'package:persona2/core/config/routes/app.dart';
import 'package:persona2/feature/home/logic/model/book_doctor_model.dart';
import 'package:persona2/feature/home/logic/model/payment_online_model.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookInitial());
  static BookCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  String? selectTimeFrom;
  int? selectTimeId;
  BookDoctorModel? bookDoctorModel;
  void bookDoctor({
    required int scheduleId,
    required String timeFrom,
    required String lang,
  }) {
    emit(BookDoctorLoading());
    dioHelper
        .postData(
            endPoint: EndPoint.bookDoctorEndPoint,
            body: {
              JsonKeys.scheduleId: scheduleId,
              JsonKeys.timeFrom: timeFrom,
              JsonKeys.lang: lang,
            },
            token: UserLocal.token)
        .then((value) {
          log("llllllllllll${value.data}");
      bookDoctorModel = BookDoctorModel.fromJson(value.data);
      if (bookDoctorModel != null) {
        if (bookDoctorModel!.status == true) {
          if (bookDoctorModel!.type == 'online') {
            emit(BookDoctorOnlineSuccess());
          } else if (bookDoctorModel!.type == 'ofline') {
            emit(BookDoctorOflineSuccess());
          }
        } else {
          log("in else not E");
          emit(BookDoctorError(msg: bookDoctorModel!.msg ?? 'Error'));
        }
      }
    }).catchError((e) {
      log("the Error in catch is : $e");

      emit(BookDoctorError(msg: 'Error'));
    });
  }

  PaymentOnlineModel? paymentOnlineModel;
  void payment({
    required int scheduleId,
    required String mobile,
    required int selectId,
    String? promoCode,
  }) {
    emit(PaymentLoading());
    dioHelper.postData(
        endPoint: EndPoint.paymentEndPoint,
        token: UserLocal.token,
        body: {
          JsonKeys.scheduleId: scheduleId,
          "phone_mobile": mobile,
          "gate": selectId,
          "promocode" : promoCode
        }).then((value) {
      log("payment data is ${value.data}");
      paymentOnlineModel = PaymentOnlineModel.fromJson(value.data);
      emit(PaymentSuccess(msg: value.data['msg']));
    }).catchError((e) {
      emit(PaymentError());
    });
  }




}
