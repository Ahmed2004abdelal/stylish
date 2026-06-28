class FirebasePaths {
  static String products() => 'products/';
  static String categories() => 'categories/';
  static String user(String uid) => 'users/$uid';
  static String userInformationSet(String uid) =>
      'users/$uid/information/${uid}info';
  // static String userOrderSet(String uid, String orderId) =>
  //     'users/$uid/orders/${orderId}order';
  static String userInformation(String uid) => 'users/$uid/information/';
  static String userOrders(String uid) => 'users/$uid/orders/';
  static String cart(String uid, String cartId) => 'users/$uid/cart/$cartId';
  static String userOrderSet(String uid, String orderId) =>
      'users/$uid/orders/$orderId';
  static String getCart(String uid) => 'users/$uid/cart/';
}
