class PendingOrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersCoupon;
  String? ordersRating;
  String? ordersRatingcomnt;
  String? ordersPaymentmethod;
  String? ordersDatetime;
  String? ordersStatus;
  String? addressId;
  String? addressName;
  String? addressUsersid;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  PendingOrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersCoupon,
      this.ordersRating,
      this.ordersRatingcomnt,
      this.ordersPaymentmethod,
      this.ordersDatetime,
      this.ordersStatus,
      this.addressId,
      this.addressName,
      this.addressUsersid,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  PendingOrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersRatingcomnt = json['orders_ratingcomnt'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersDatetime = json['orders_datetime'];
    ordersStatus = json['orders_status'];
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_rating'] = this.ordersRating;
    data['orders_ratingcomnt'] = this.ordersRatingcomnt;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_status'] = this.ordersStatus;
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_lang'] = this.addressLang;
    return data;
  }
}
