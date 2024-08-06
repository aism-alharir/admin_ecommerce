import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/initalbinding.dart';
import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleControllere controller = Get.put(LocaleControllere());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      title: 'Flutter Demo',
      theme: controller.appTheme,
      locale: controller.language,
      initialBinding: InitalBindings(),
      getPages: routes,
      //home: const Language(),
      //const Test(),
    );
  }
}
