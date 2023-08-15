class AppLinkApi {
  static const String server = "https://appnotecurrent.000webhostapp.com";

//---------------------------authentiction-----------------------------------
  static const String test = "$server/test.php";
  static const String linkApiSingup = "$server/auth/singup.php";
  static const String linkApiSingupVerifyCode = "$server/auth/verifycode.php";
  static const String linkResendSingupVerifyCode =
      "$server/auth/resendVerifyCode.php";
  static const String linkApiLogin = "$server/auth/login.php";

  // ------------------------ForgetPassword----------------------------------
  static const String linkApifpCheckEmail =
      "$server/forgetpassword/check_email.php";
  static const String linkApifpVerifyCode =
      "$server/forgetpassword/verifycodeforgetpassword.php";

  static const String linkApifpResetpassword =
      "$server/forgetpassword/resetpassword.php";

  // ----------------------- Homepage------------------------

  static const String apiHomePage = "$server/home.php";
  static const String apiItemspage = "$server/items/items.php";

  // ----------------------------Server Image-------------------------

  static const String apiImageRoot =
      "https://appnotecurrent.000webhostapp.com/upload";

  static const String apiCatergoriesImage = "$apiImageRoot/categories";
  static const String apiItemsImage = "$apiImageRoot/items";

  // favorite links

  static const String addfavorite = "$server/favorite/addFavorite.php";
  static const String removefavorite = "$server/favorite/removeFavorite.php";
  static const String viewfavorite = "$server/favorite/view.php";
  static const String deletefromfavorite =
      "$server/favorite/deletefromfavoriteList.php";

  // shopping Cart Links

  static const String addCart = "$server/cart/addCart.php";
  static const String deleteCart = "$server/cart/deleteCart.php";
  static const String itemsCountCart = "$server/cart/cartItemsCount.php";
  static const String viewCart = "$server/cart/view.php";

  // search items
  static const String apiItemsSearch = "$server/items/search.php";

  // address api links
  static const String addAddresslink = "$server/address/addAddress.php";
  static const String deleteAddresslink = "$server/address/deleteAddress.php";
  static const String updateAddresslink = "$server/address/updateAddress.php";
  static const String viewAddresslink = "$server/address/viewAddress.php";

  //coupon api links

  static const String checkCoupon = "$server/coupon/checkcoupon.php";

  // orders api link
  static const String checkoutlink = "$server/orders/checkout.php";
  static const String pendingOrderslink = "$server/orders/pendingOrders.php";
  static const String orderDetailsLink = "$server/orders/orderDetails.php";
  static const String deleteOrderLink = "$server/orders/deleteOrders.php";
  static const String orderArchiveLink = "$server/orders/orderArchive.php";

  // offers Items links

  static const String offersLink = "$server/offers.php";
  static const String ratingLink = "$server/ratings.php";
}
