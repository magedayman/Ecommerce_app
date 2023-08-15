class CartViewModel {
  String? productprice;
  String? productcount;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsCount;
  String? itemsActive;
  String? itemsDate;
  String? itemsCatgories;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;

  CartViewModel(
      {this.productprice,
      this.productcount,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsCount,
      this.itemsActive,
      this.itemsDate,
      this.itemsCatgories,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid});

  CartViewModel.fromJson(Map<String, dynamic> json) {
    productprice = json['productprice'];
    productcount = json['productcount'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsDate = json['items_date'];
    itemsCatgories = json['items_catgories'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productprice'] = this.productprice;
    data['productcount'] = this.productcount;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_date'] = this.itemsDate;
    data['items_catgories'] = this.itemsCatgories;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    return data;
  }
}
