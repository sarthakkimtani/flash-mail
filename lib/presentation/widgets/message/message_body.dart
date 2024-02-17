import "package:flutter/widgets.dart";
import "package:flutter_inappwebview/flutter_inappwebview.dart";
import "package:url_launcher/url_launcher.dart";

class MessageBody extends StatefulWidget {
  final String html;

  const MessageBody({super.key, required this.html});

  @override
  State<MessageBody> createState() => _MessageBodyState();
}

class _MessageBodyState extends State<MessageBody> {
  double webviewHeight = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: webviewHeight,
      child: InAppWebView(
        initialData: InAppWebViewInitialData(data: widget.html),
        initialSettings: InAppWebViewSettings(
          transparentBackground: true,
          forceDark: ForceDark.ON,
          algorithmicDarkeningAllowed: true,
          supportZoom: false,
          javaScriptEnabled: true,
          disableHorizontalScroll: false,
          disableVerticalScroll: true,
          useWideViewPort: false,
          useHybridComposition: false,
          preferredContentMode: UserPreferredContentMode.MOBILE,
        ),
        onLoadStop: (controller, url) async {
          final contentHeight = await controller.getContentHeight();
          if (contentHeight != null) {
            setState(() {
              webviewHeight = contentHeight.toDouble();
            });
          }
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final url = navigationAction.request.url;
          if (url != null && await canLaunchUrl(url)) {
            await launchUrl(url);
          }
          return NavigationActionPolicy.CANCEL;
        },
      ),
    );
  }
}
