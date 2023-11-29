// To parse this JSON data, do
//
//     final productDetailResponse = productDetailResponseFromJson(jsonString);

import 'dart:convert';

ProductDetailResponse productDetailResponseFromJson(String str) =>
    ProductDetailResponse.fromJson(json.decode(str));

String productDetailResponseToJson(ProductDetailResponse data) =>
    json.encode(data.toJson());

class ProductDetailResponse {
  bool? success;
  ProductDetail? data;
  String? message;
  int? code;
  dynamic error;

  ProductDetailResponse({
    this.success,
    this.data,
    this.message,
    this.code,
    this.error,
  });

  ProductDetailResponse copyWith({
    bool? success,
    ProductDetail? data,
    String? message,
    int? code,
    dynamic error,
  }) =>
      ProductDetailResponse(
        success: success ?? this.success,
        data: data ?? this.data,
        message: message ?? this.message,
        code: code ?? this.code,
        error: error ?? this.error,
      );

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      ProductDetailResponse(
        success: json["success"],
        data:
            json["data"] == null ? null : ProductDetail.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
        "code": code,
        "error": error,
      };
}

class ProductDetail {
  ProductDetailData? product;
  List<dynamic>? variants;

  ProductDetail({
    this.product,
    this.variants,
  });

  ProductDetail copyWith({
    ProductDetailData? product,
    List<dynamic>? variants,
  }) =>
      ProductDetail(
        product: product ?? this.product,
        variants: variants ?? this.variants,
      );

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        product: json["product"] == null
            ? null
            : ProductDetailData.fromJson(json["product"]),
        variants: json["variants"] == null
            ? []
            : List<dynamic>.from(json["variants"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "variants":
            variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
      };
}

class ProductDetailData {
  String? id;
  String? parentId;
  String? name;
  String? sku;
  String? productCode;
  String? brandId;
  Brand? brand;
  String? productCategoryId;
  ProductCategory? productCategory;
  String? description;
  int? price;
  bool? isReadyStock;
  dynamic preOrderTime;
  dynamic preOrderDp;
  int? multipliesPurchase;
  int? discountPerSet;
  dynamic discountType;
  int? discount;
  int? maxDiscount;
  int? finalDiscount;
  int? finalPrice;
  String? status;
  int? sold;
  int? stocks;
  List<Image>? images;
  Spec? spec;

  ProductDetailData({
    this.id,
    this.parentId,
    this.name,
    this.sku,
    this.productCode,
    this.brandId,
    this.brand,
    this.productCategoryId,
    this.productCategory,
    this.description,
    this.price,
    this.isReadyStock,
    this.preOrderTime,
    this.preOrderDp,
    this.multipliesPurchase,
    this.discountPerSet,
    this.discountType,
    this.discount,
    this.maxDiscount,
    this.finalDiscount,
    this.finalPrice,
    this.status,
    this.sold,
    this.stocks,
    this.images,
    this.spec,
  });

  ProductDetailData copyWith({
    String? id,
    String? parentId,
    String? name,
    String? sku,
    String? productCode,
    String? brandId,
    Brand? brand,
    String? productCategoryId,
    ProductCategory? productCategory,
    String? description,
    int? price,
    bool? isReadyStock,
    dynamic preOrderTime,
    dynamic preOrderDp,
    int? multipliesPurchase,
    int? discountPerSet,
    dynamic discountType,
    int? discount,
    int? maxDiscount,
    int? finalDiscount,
    int? finalPrice,
    String? status,
    int? sold,
    int? stocks,
    List<Image>? images,
    Spec? spec,
  }) =>
      ProductDetailData(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        name: name ?? this.name,
        sku: sku ?? this.sku,
        productCode: productCode ?? this.productCode,
        brandId: brandId ?? this.brandId,
        brand: brand ?? this.brand,
        productCategoryId: productCategoryId ?? this.productCategoryId,
        productCategory: productCategory ?? this.productCategory,
        description: description ?? this.description,
        price: price ?? this.price,
        isReadyStock: isReadyStock ?? this.isReadyStock,
        preOrderTime: preOrderTime ?? this.preOrderTime,
        preOrderDp: preOrderDp ?? this.preOrderDp,
        multipliesPurchase: multipliesPurchase ?? this.multipliesPurchase,
        discountPerSet: discountPerSet ?? this.discountPerSet,
        discountType: discountType ?? this.discountType,
        discount: discount ?? this.discount,
        maxDiscount: maxDiscount ?? this.maxDiscount,
        finalDiscount: finalDiscount ?? this.finalDiscount,
        finalPrice: finalPrice ?? this.finalPrice,
        status: status ?? this.status,
        sold: sold ?? this.sold,
        stocks: stocks ?? this.stocks,
        images: images ?? this.images,
        spec: spec ?? this.spec,
      );

  factory ProductDetailData.fromJson(Map<String, dynamic> json) =>
      ProductDetailData(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        sku: json["sku"],
        productCode: json["product_code"],
        brandId: json["brand_id"],
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        productCategoryId: json["product_category_id"],
        productCategory: json["product_category"] == null
            ? null
            : ProductCategory.fromJson(json["product_category"]),
        description: json["description"],
        price: json["price"],
        isReadyStock: json["is_ready_stock"],
        preOrderTime: json["pre_order_time"],
        preOrderDp: json["pre_order_dp"],
        multipliesPurchase: json["multiplies_purchase"],
        discountPerSet: json["discount_per_set"],
        discountType: json["discount_type"],
        discount: json["discount"],
        maxDiscount: json["max_discount"],
        finalDiscount: json["final_discount"],
        finalPrice: json["final_price"],
        status: json["status"],
        sold: json["sold"],
        stocks: json["stocks"],
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        spec: json["spec"] == null ? null : Spec.fromJson(json["spec"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "sku": sku,
        "product_code": productCode,
        "brand_id": brandId,
        "brand": brand?.toJson(),
        "product_category_id": productCategoryId,
        "product_category": productCategory?.toJson(),
        "description": description,
        "price": price,
        "is_ready_stock": isReadyStock,
        "pre_order_time": preOrderTime,
        "pre_order_dp": preOrderDp,
        "multiplies_purchase": multipliesPurchase,
        "discount_per_set": discountPerSet,
        "discount_type": discountType,
        "discount": discount,
        "max_discount": maxDiscount,
        "final_discount": finalDiscount,
        "final_price": finalPrice,
        "status": status,
        "sold": sold,
        "stocks": stocks,
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "spec": spec?.toJson(),
      };
}

class Brand {
  String? id;
  String? name;
  String? description;
  String? logo;
  String? type;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Brand({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Brand copyWith({
    String? id,
    String? name,
    String? description,
    String? logo,
    String? type,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Brand(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        type: type ?? this.type,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        logo: json["logo"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "logo": logo,
        "type": type,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Image {
  String? id;
  String? productId;
  String? image;
  DateTime? createdAt;
  String? createdBy;

  Image({
    this.id,
    this.productId,
    this.image,
    this.createdAt,
    this.createdBy,
  });

  Image copyWith({
    String? id,
    String? productId,
    String? image,
    DateTime? createdAt,
    String? createdBy,
  }) =>
      Image(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["product_id"],
        image: json["image"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image": image,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
      };
}

class ProductCategory {
  String? id;
  String? nameType;
  String? description;
  List<String>? specs;
  bool? isDeleted;
  dynamic icon;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProductCategory({
    this.id,
    this.nameType,
    this.description,
    this.specs,
    this.isDeleted,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  ProductCategory copyWith({
    String? id,
    String? nameType,
    String? description,
    List<String>? specs,
    bool? isDeleted,
    dynamic icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      ProductCategory(
        id: id ?? this.id,
        nameType: nameType ?? this.nameType,
        description: description ?? this.description,
        specs: specs ?? this.specs,
        isDeleted: isDeleted ?? this.isDeleted,
        icon: icon ?? this.icon,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        id: json["id"],
        nameType: json["name_type"],
        description: json["description"],
        specs: json["specs"] == null
            ? []
            : List<String>.from(json["specs"]!.map((x) => x)),
        isDeleted: json["is_deleted"],
        icon: json["icon"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_type": nameType,
        "description": description,
        "specs": specs == null ? [] : List<dynamic>.from(specs!.map((x) => x)),
        "is_deleted": isDeleted,
        "icon": icon,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Spec {
  String? id;
  String? productId;
  dynamic pattern;
  bool? isGeneral;
  bool? isOem;
  num? diameter;
  num? weight;
  dynamic weightGross;
  num? width;
  String? type;
  dynamic color;
  dynamic pcd;
  dynamic offset;
  dynamic centerBore;
  dynamic et;
  String? speedRating;
  int? profile;
  String? loadIndex;
  String? plyRating;
  dynamic chassisCodes;
  dynamic motorKit;
  dynamic edfcFt;
  dynamic edfcRr;
  dynamic baseFt;
  dynamic baseRr;
  dynamic thickness;
  dynamic cb;
  String? boltPattern;
  dynamic length;
  dynamic engine;
  dynamic cc;
  dynamic yearStart;
  dynamic yearEnd;
  DateTime? createdAt;
  DateTime? updatedAt;

  Spec({
    this.id,
    this.productId,
    this.pattern,
    this.isGeneral,
    this.isOem,
    this.diameter,
    this.weight,
    this.weightGross,
    this.width,
    this.type,
    this.color,
    this.pcd,
    this.offset,
    this.centerBore,
    this.et,
    this.speedRating,
    this.profile,
    this.loadIndex,
    this.plyRating,
    this.chassisCodes,
    this.motorKit,
    this.edfcFt,
    this.edfcRr,
    this.baseFt,
    this.baseRr,
    this.thickness,
    this.cb,
    this.boltPattern,
    this.length,
    this.engine,
    this.cc,
    this.yearStart,
    this.yearEnd,
    this.createdAt,
    this.updatedAt,
  });

  Spec copyWith({
    String? id,
    String? productId,
    dynamic pattern,
    bool? isGeneral,
    bool? isOem,
    num? diameter,
    num? weight,
    dynamic weightGross,
    int? width,
    String? type,
    dynamic color,
    dynamic pcd,
    dynamic offset,
    dynamic centerBore,
    dynamic et,
    String? speedRating,
    int? profile,
    String? loadIndex,
    String? plyRating,
    dynamic chassisCodes,
    dynamic motorKit,
    dynamic edfcFt,
    dynamic edfcRr,
    dynamic baseFt,
    dynamic baseRr,
    dynamic thickness,
    dynamic cb,
    String? boltPattern,
    dynamic length,
    dynamic engine,
    dynamic cc,
    dynamic yearStart,
    dynamic yearEnd,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Spec(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        pattern: pattern ?? this.pattern,
        isGeneral: isGeneral ?? this.isGeneral,
        isOem: isOem ?? this.isOem,
        diameter: diameter ?? this.diameter,
        weight: weight ?? this.weight,
        weightGross: weightGross ?? this.weightGross,
        width: width ?? this.width,
        type: type ?? this.type,
        color: color ?? this.color,
        pcd: pcd ?? this.pcd,
        offset: offset ?? this.offset,
        centerBore: centerBore ?? this.centerBore,
        et: et ?? this.et,
        speedRating: speedRating ?? this.speedRating,
        profile: profile ?? this.profile,
        loadIndex: loadIndex ?? this.loadIndex,
        plyRating: plyRating ?? this.plyRating,
        chassisCodes: chassisCodes ?? this.chassisCodes,
        motorKit: motorKit ?? this.motorKit,
        edfcFt: edfcFt ?? this.edfcFt,
        edfcRr: edfcRr ?? this.edfcRr,
        baseFt: baseFt ?? this.baseFt,
        baseRr: baseRr ?? this.baseRr,
        thickness: thickness ?? this.thickness,
        cb: cb ?? this.cb,
        boltPattern: boltPattern ?? this.boltPattern,
        length: length ?? this.length,
        engine: engine ?? this.engine,
        cc: cc ?? this.cc,
        yearStart: yearStart ?? this.yearStart,
        yearEnd: yearEnd ?? this.yearEnd,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Spec.fromJson(Map<String, dynamic> json) => Spec(
        id: json["id"],
        productId: json["product_id"],
        pattern: json["pattern"],
        isGeneral: json["is_general"],
        isOem: json["is_oem"],
        diameter: json["diameter"],
        weight: json["weight"],
        weightGross: json["weight_gross"],
        width: json["width"],
        type: json["type"],
        color: json["color"],
        pcd: json["pcd"],
        offset: json["offset"],
        centerBore: json["center_bore"],
        et: json["et"],
        speedRating: json["speed_rating"],
        profile: json["profile"],
        loadIndex: json["load_index"],
        plyRating: json["ply_rating"],
        chassisCodes: json["chassis_codes"],
        motorKit: json["motor_kit"],
        edfcFt: json["edfc_ft"],
        edfcRr: json["edfc_rr"],
        baseFt: json["base_ft"],
        baseRr: json["base_rr"],
        thickness: json["thickness"],
        cb: json["cb"],
        boltPattern: json["bolt_pattern"],
        length: json["length"],
        engine: json["engine"],
        cc: json["cc"],
        yearStart: json["year_start"],
        yearEnd: json["year_end"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "pattern": pattern,
        "is_general": isGeneral,
        "is_oem": isOem,
        "diameter": diameter,
        "weight": weight,
        "weight_gross": weightGross,
        "width": width,
        "type": type,
        "color": color,
        "pcd": pcd,
        "offset": offset,
        "center_bore": centerBore,
        "et": et,
        "speed_rating": speedRating,
        "profile": profile,
        "load_index": loadIndex,
        "ply_rating": plyRating,
        "chassis_codes": chassisCodes,
        "motor_kit": motorKit,
        "edfc_ft": edfcFt,
        "edfc_rr": edfcRr,
        "base_ft": baseFt,
        "base_rr": baseRr,
        "thickness": thickness,
        "cb": cb,
        "bolt_pattern": boltPattern,
        "length": length,
        "engine": engine,
        "cc": cc,
        "year_start": yearStart,
        "year_end": yearEnd,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
