class Categorisemodel {
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
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDate;
  String? favorite;
  String? itemsPricediscount;

  Categorisemodel(
      {this.itemsId,
      this.itemsName,
      this.itemsPricediscount,
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
      this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDate,
      this.favorite});

  Categorisemodel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImages = json['items_images'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsPricediscount = json['itemspricediscount'];

    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategory = json['items_category'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDate = json['categories_date'];
    favorite = json['favorites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_date'] = categoriesDate;
    return data;
  }
}
