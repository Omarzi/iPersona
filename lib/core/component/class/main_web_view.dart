import 'package:persona2/core/config/routes/app.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class MainWebViewPdf extends StatelessWidget {
  MainWebViewPdf({super.key, required this.link});
  String link;
  WebViewController controller = WebViewController();

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
   

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // if(progress == 100) {
          // setState(() {
          //   print('isLoading is = {$isLoading}');
          //   isLoading = false;
          // });
          // }
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) async {
          // if (url.contains(urlLink)) {
          //   await validationCubit.paymentValidation(
          //     link: url,
          //     orderId: MyConfigCach.getInt(key: MyConfigCacheKeys.order_id)
          //         .toString(),
          //   );
          // }
          // if (url.contains('success=true')) {
           
          // } else if (url.contains('success=false')) {
           
          // }
        },
        onWebResourceError: (error) {},
        onNavigationRequest: (request) {
          if (request.url.startsWith(link)) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ))
      ..loadRequest(
        Uri.parse(link),
      );

    return SafeArea(
      child: Scaffold(
        body: WebViewWidget(controller: controller),
      ),
    );
  }
}
