import 'package:fluttertoast/fluttertoast.dart';

import '../../config/routes/app.dart';

flutterToast({required String msg, required Color color}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 14.0.sp,
  );
}


flutterSnackBar({required BuildContext context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg), backgroundColor: Theme
        .of(context)
        .primaryColor),
  );
}
