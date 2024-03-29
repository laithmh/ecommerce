class Couponmodel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponExpiredate;
  String? couponDiscount;

  Couponmodel(
      {this.couponId,
      this.couponName,
      this.couponCount,
      this.couponExpiredate,
      this.couponDiscount});

  Couponmodel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpiredate = json['coupon_expiredate'];
    couponDiscount = json['coupon_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_count'] = couponCount;
    data['coupon_expiredate'] = couponExpiredate;
    data['coupon_discount'] = couponDiscount;
    return data;
  }
}