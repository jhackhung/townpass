import 'package:town_pass/gen/assets.gen.dart';
import 'package:town_pass/util/tp_app_bar.dart';
import 'package:town_pass/util/tp_route.dart';
import 'package:town_pass/util/tp_web_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class PerkView extends StatelessWidget {
  const PerkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TPAppBar(
          showLogo: true,
          title: '優惠',
          leading: IconButton(
            icon: Assets.svg.iconPerson.svg(),
            onPressed: () => Get.toNamed(TPRoute.account),
          ),
        ),
        // body: TPInAppWebView(
        //   onWebViewCreated: (controller) {
        //     controller.loadUrl(
        //       urlRequest: URLRequest(
        //           // url: WebUri('https://taipei-pass-service.vercel.app/coupon/')),
        //           url: WebUri('http://172.20.10.3:8080/')),
        //     );
        //   },
        // ),
        body: WebViewWidget(controller: controller));
  }
}

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onHttpError: (HttpResponseError error) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )
  ..loadRequest(Uri.parse('https://im.mgt.ncu.edu.tw/'));
