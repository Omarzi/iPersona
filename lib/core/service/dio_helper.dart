

import 'package:persona2/core/config/routes/app.dart';

class DioHelper {
  Dio dio = Dio();

  Future<Response> getData({required String endPoint}) async {
    Response response = await dio.get(
      EndPoint.baseUrl + endPoint,
      options: Options(
        headers: {
          "Authorization": "Bearer ${UserLocal.token}",
        },
      ),
    );
    // log(response.statusCode.toString());
    return response;
  }

  Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        EndPoint.baseUrl + endPoint,
        data: body,
        options: Options(
          headers: {
            "Authorization": "Bearer ${UserLocal.token}",
          },
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError {
      rethrow;
    }
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put(
      EndPoint.baseUrl + endPoint,
      data: body,
      options: Options(
        headers: {
          "Authorization": "Bearer ${UserLocal.token}",
        },
      ),
    );
  }

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.delete(
      EndPoint.baseUrl + endPoint,
      data: body,
      options: Options(
        headers: {
          "Authorization": "Bearer ${UserLocal.token}",
        },
      ),
    );
  }

// static void logout(BuildContext context) async {
//   await MyConfigCach.clearShared();
//   Navigator.pushReplacementNamed(context, 'checkScreen');
// }
}

