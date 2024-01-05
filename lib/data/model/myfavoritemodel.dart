class Myfavoritemodel {
  String? favoritesId;
  String? favoritesUserid;
  String? favoritesItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImages;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsCount;
  String? itemsPrice;
  String? itemsActive;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCategory;
  String? userId;

  Myfavoritemodel(
      {this.favoritesId,
      this.favoritesUserid,
      this.favoritesItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsImages,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsCount,
      this.itemsPrice,
      this.itemsActive,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCategory,
      this.userId});

  Myfavoritemodel.fromJson(Map<String, dynamic> json) {
    favoritesId = json['favorites_id'];
    favoritesUserid = json['favorites_userid'];
    favoritesItemsid = json['favorites_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImages = json['items_images'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_ price'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategory = json['items_category'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorites_id'] = favoritesId;
    data['favorites_userid'] = favoritesUserid;
    data['favorites_itemsid'] = favoritesItemsid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_images'] = itemsImages;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_count'] = itemsCount;
    data['items_ price'] = itemsPrice;
    data['items_active'] = itemsActive;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_category'] = itemsCategory;
    data['user_id'] = userId;
    return data;
  }
}
