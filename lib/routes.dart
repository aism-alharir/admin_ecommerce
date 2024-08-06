import 'package:admin_ecommerce/view/screen/categories/add.dart';
import 'package:admin_ecommerce/view/screen/categories/edit.dart';
import 'package:admin_ecommerce/view/screen/categories/view.dart';
import 'package:admin_ecommerce/view/screen/items/add.dart';
import 'package:admin_ecommerce/view/screen/items/edit.dart';
import 'package:admin_ecommerce/view/screen/items/view.dart';
import 'package:admin_ecommerce/view/screen/orders/screen.dart';
import 'package:get/get.dart';

import 'core/constant/routes.dart';
import 'core/middleawer/mymiddleawer.dart';
import 'view/screen/auth/forgetpassword/checkemail.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/successresetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/home.dart';
import 'view/screen/language.dart';
import 'view/screen/orders/archive.dart';
import 'view/screen/orders/details.dart';
import 'view/screen/orders/pending.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoutes.language,
      page: () => const Language(),
      middlewares: [MyMiddleawer()]),
  //GetPage(name: "/", page: () =>const Cart()),

  //auth

  GetPage(
    name: AppRoutes.login,
    page: () => const Login(),
  ),

  GetPage(name: AppRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoutes.verIfyCode, page: () => const VerFiyCode()),

  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),

  //HOmePage
  GetPage(name: AppRoutes.homePage, page: () => const HomePage()),

  //orders Detalis
  GetPage(name: AppRoutes.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoutes.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoutes.ordersdetails, page: () => const OrdersDetails()),

  //categories
  GetPage(name: AppRoutes.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoutes.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoutes.categoriesedit, page: () => const CategoriesEdit()),

  //items
  GetPage(name: AppRoutes.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoutes.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoutes.itemsedit, page: () => const ItemsEdit()),

  //order
  GetPage(name: AppRoutes.orderscrren, page: () => const OrderScreen()),
];
