class Ordersmodel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUserid;
  String? cartItemid;
  String? cartOrders;
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
  String? orderId;
  String? orderUserid;
  String? orderPayment;
  String? orderAddress;
  String? orderType;
  String? orderPrice;
  String? orderTotalprice;
  String? orderPricedelivrey;
  String? orderCoupon;
  String? orderRating;
  String? orderNoterating;
  String? orderDate;
  String? orderStatus;
  String? addressId;
  String? addressUserid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  Ordersmodel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUserid,
      this.cartItemid,
      this.cartOrders,
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
      this.orderId,
      this.orderUserid,
      this.orderPayment,
      this.orderAddress,
      this.orderType,
      this.orderPrice,
      this.orderTotalprice,
      this.orderPricedelivrey,
      this.orderCoupon,
      this.orderRating,
      this.orderNoterating,
      this.orderDate,
      this.orderStatus,
      this.addressId,
      this.addressUserid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  Ordersmodel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemid = json['cart_itemid'];
    cartOrders = json['cart_orders'];
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
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderPayment = json['order_payment'];
    orderAddress = json['order_address'];
    orderType = json['order_type'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    orderPricedelivrey = json['order_pricedelivrey'];
    orderCoupon = json['order_coupon'];
    orderRating = json['order_rating'];
    orderNoterating = json['order_noterating'];
    orderDate = json['order_date'];
    orderStatus = json['order_status'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_itemid'] = cartItemid;
    data['cart_orders'] = cartOrders;
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
    data['order_id'] = orderId;
    data['order_userid'] = orderUserid;
    data['order_payment'] = orderPayment;
    data['order_address'] = orderAddress;
    data['order_type'] = orderType;
    data['order_price'] = orderPrice;
    data['order_totalprice'] = orderTotalprice;
    data['order_pricedelivrey'] = orderPricedelivrey;
    data['order_coupon'] = orderCoupon;
    data['order_rating'] = orderRating;
    data['order_noterating'] = orderNoterating;
    data['order_date'] = orderDate;
    data['order_status'] = orderStatus;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
