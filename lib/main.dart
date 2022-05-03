import 'package:blog/app/app_theme.dart';
import 'package:blog/res/strings.dart';
import 'package:blog/ui/page/splash_page/splash_binding.dart';
import 'package:blog/ui/page/splash_page/splash_page.dart';
import 'package:blog/util/injection_init.dart';
import 'package:blog/util/locale_util.dart';
import 'package:flutter/material.dart';
import 'package:blog/routes/routes.dart';
import 'package:blog/util/keyboard_util.dart';
import 'package:get/get.dart';

/// @class : main
/// @date : 2021/08/11
/// @name : jhf
/// @description :入口
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 依赖注入，将一些后续随时会用到的实例对象交给 Get 管理，后续直接使用即可
  await Injection.init();
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: Routes.routePage,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Scaffold(
        body: GestureDetector(
          onTap: () => KeyboardUtils.hideKeyboard(context),
          child: child,
        ),
      ),

      ///主题颜色
      theme: appThemeData,

      ///国际化支持-来源配置
      translations: Messages(),

      ///国际化支持-默认语言
      locale: LocaleOptions.getDefault(),

      ///国际化支持-备用语言
      fallbackLocale: const Locale('en', 'US'),

      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      home: const SplashPage(),
    ),
  );
}
