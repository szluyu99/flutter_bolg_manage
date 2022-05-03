import 'package:url_launcher/url_launcher.dart';

/// @class : Navigate
/// @date : 2021/08/25
/// @name : jhf
/// @description : 导航
class Navigate {
  ///打开浏览器
  ///[url] 链接
  static Future<void> launchInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
