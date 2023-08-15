class ItemsModel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemspriceDiscount;

  ItemsModel(
      {this.itemsId,
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
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite,
      this.itemspriceDiscount});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemspriceDiscount = json['itemsPriceDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories _id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}
