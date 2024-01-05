

class Cartmodel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUserid;
  String? cartItemid;
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

  Cartmodel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
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
      this.itemsCategory});

  Cartmodel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImages = json['items_images'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsPrice = json['items_price'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategory = json['items_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_images'] = itemsImages;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_count'] = itemsCount;
    data['items_price'] = itemsPrice;
    data['items_active'] = itemsActive;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_category'] = itemsCategory;
    return data;
  }
}

class Countprice {
  String? totalprice;
  String? totalcount;

  Countprice({this.totalprice, this.totalcount});

  Countprice.fromJson(Map<String, dynamic> json) {
    totalprice = json['totalprice'];
    totalcount = json['totalcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalprice'] = totalprice;
    data['totalcount'] = totalcount;
    return data;
  }
}
