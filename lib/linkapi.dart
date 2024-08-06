class AppLink {
  static const String server = "http://192.168.77.64/ecommerce/admin";
  static const String test = "$server/test.php";
  static const String imagesstatic = "http://192.168.77.64/ecommerce/upload";
  //=========Images=============//
  static const String imagesCategories = "$imagesstatic/categories";
  static const String imagesItems = "$imagesstatic/items";

  //===============Admin auth=================//
  static const String signup = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";

  //===============forgetpassword=================//
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";

  //===============Home=======================//
  static const String hpmePage = "$server/home.php";

  //===========orders==========//
  static const String approveOrder = "$server/orders/approve.php";
  static const String pepare = "$server/orders/pepare.php";
  
  static const String viewAcceptedOrders =
      "$server/orders/viewAcceptedOrder.php";
  static const String viewArchiveorders = "$server/orders/archive.php";
  static const String viewPendeingOrder = "$server/orders/viewPendingOrder.php";
  static const String detailsOrders = "$server/orders/details.php";
  

  //categories
  static const String categoriesview = "$server/categories/view.php";
  static const String categoriesadd = "$server/categories/add.php";
  static const String categoriesedit = "$server/categories/edit.php";
  static const String categoriesdelete = "$server/categories/delete.php";

  //items
  static const String itemsview = "$server/items/view.php";
  static const String itemsadd = "$server/items/add.php";
  static const String itemsedit = "$server/items/edit.php";
  static const String itemsdelete = "$server/items/delete.php";
}
// ipv4 address 192.168.200.
