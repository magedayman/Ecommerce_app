import 'package:e_commerce_app/core/constant/appRoutes.dart';
import 'package:e_commerce_app/core/middleware/appMiddleware.dart';
import 'package:e_commerce_app/veiw/screens/AddressScreens/AddressDetails.dart';
import 'package:e_commerce_app/veiw/screens/AddressScreens/addressAdd.dart';
import 'package:e_commerce_app/veiw/screens/AddressScreens/addressView.dart';
import 'package:e_commerce_app/veiw/screens/orders/Checkout.dart';
import 'package:e_commerce_app/veiw/screens/ItemsDetailsScreen.dart';
import 'package:e_commerce_app/veiw/screens/ItemsPage.dart';
import 'package:e_commerce_app/veiw/screens/LanguageScreen.dart';
import 'package:e_commerce_app/veiw/screens/MainHomeScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/checkEmail/verifiyEmailcodeSingup.dart';
import 'package:e_commerce_app/veiw/screens/auth/forgetpassword/ResetPasswordScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/forgetpassword/SucssesResetPassScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/checkEmail/SucssesSingUpScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/forgetpassword/forgetPasswordScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/loginScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/singUpScreen.dart';
import 'package:e_commerce_app/veiw/screens/auth/forgetpassword/verifiedPasswordCode.dart';
import 'package:e_commerce_app/veiw/screens/cartScreen.dart';
import 'package:e_commerce_app/veiw/screens/favoriteScreen.dart';
import 'package:e_commerce_app/veiw/screens/onBoardingScreen.dart';
import 'package:e_commerce_app/veiw/screens/orders/orderDetails.dart';
import 'package:e_commerce_app/veiw/screens/orders/ordersArchive.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'veiw/screens/orders/PendingOrders.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(
  //   name: "/",
  //   page: () => test(),
  // ),
  GetPage(name: "/", page: () => const LanguageScreen(), middlewares: [
    AppMiddleware(),
  ]),
  GetPage(name: appRoutes.loginRoute, page: () => const login()),
  GetPage(
      name: appRoutes.onBoardingRoute, page: () => const onBoardingScreen()),
  GetPage(name: appRoutes.singupRoute, page: () => const SingUp()),
  GetPage(
      name: appRoutes.forgetPasswordRoute, page: () => const forgetPassword()),
  GetPage(
      name: appRoutes.verifyPasswordRoute,
      page: () => const verifyPasswordCode()),
  GetPage(
      name: appRoutes.resetPasswordRoute, page: () => const ResetPassword()),
  GetPage(
      name: appRoutes.sucsessResetPassRoute,
      page: () => const SucssesResetPass()),
  GetPage(
      name: appRoutes.sucsessSingUpRoute, page: () => const SucssesSingUp()),
  GetPage(
      name: appRoutes.verifyEmailsingUpRoute,
      page: () => const VerifyCodeSingUp()),
  GetPage(
    name: appRoutes.onHomepageRoute,
    page: () => const MainHomeScreen(),
  ),
  GetPage(
    name: appRoutes.itemsPageScreen,
    page: () => const ItemsPage(),
  ),
  GetPage(
    name: appRoutes.itemsDetailsScreen,
    page: () => const ItemsDetailsScreen(),
  ),
  GetPage(
    name: appRoutes.favoriteScreen,
    page: () => const FavoriteScreen(),
  ),
  GetPage(
    name: appRoutes.cartscreen,
    page: () => const CartScreen(),
  ),
  GetPage(
    name: appRoutes.viewAddress,
    page: () => const AddressVeiw(),
  ),
  GetPage(
    name: appRoutes.addAddress,
    page: () => const AddAddress(),
  ),
  GetPage(
    name: appRoutes.detailsAddress,
    page: () => const AddressDetails(),
  ),
  GetPage(
    name: appRoutes.checOut,
    page: () => const CheckOut(),
  ),
  GetPage(
    name: appRoutes.pendingOrders,
    page: () => const PendingOrders(),
  ),
  GetPage(
    name: appRoutes.orderDetails,
    page: () => const OrderDetails(),
  ),
  GetPage(
    name: appRoutes.orderArchive,
    page: () => const OrdersArchive(),
  ),
];
