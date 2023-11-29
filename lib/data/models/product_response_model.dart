// To parse this JSON data, do
//
//     final productRepository = productRepositoryFromJson(jsonString);

import 'dart:convert';

ProductResponse productRepositoryFromJson(String str) => ProductResponse.fromJson(json.decode(str));

String productRepositoryToJson(ProductResponse data) => json.encode(data.toJson());

class ProductResponse {
    bool success;
    Product data;
    String message;
    int code;
    dynamic error;

    ProductResponse({
        required this.success,
        required this.data,
        required this.message,
        required this.code,
        required this.error,
    });

    ProductResponse copyWith({
        bool? success,
        Product? data,
        String? message,
        int? code,
        dynamic error,
    }) => 
        ProductResponse(
            success: success ?? this.success,
            data: data ?? this.data,
            message: message ?? this.message,
            code: code ?? this.code,
            error: error ?? this.error,
        );

    factory ProductResponse.fromJson(Map<String, dynamic> json) => ProductResponse(
        success: json["success"],
        data: Product.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
        "code": code,
        "error": error,
    };
}

class Product {
    int page;
    int limit;
    int totalPage;
    int totalData;
    String current;
    String next;
    dynamic previous;
    List<ProductData> products;

    Product({
        required this.page,
        required this.limit,
        required this.totalPage,
        required this.totalData,
        required this.current,
        required this.next,
        required this.previous,
        required this.products,
    });

    Product copyWith({
        int? page,
        int? limit,
        int? totalPage,
        int? totalData,
        String? current,
        String? next,
        dynamic previous,
        List<ProductData>? products,
    }) => 
        Product(
            page: page ?? this.page,
            limit: limit ?? this.limit,
            totalPage: totalPage ?? this.totalPage,
            totalData: totalData ?? this.totalData,
            current: current ?? this.current,
            next: next ?? this.next,
            previous: previous ?? this.previous,
            products: products ?? this.products,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        page: json["page"],
        limit: json["limit"],
        totalPage: json["total_page"],
        totalData: json["total_data"],
        current: json["current"],
        next: json["next"],
        previous: json["previous"],
        products: List<ProductData>.from(json["products"].map((x) => ProductData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "total_page": totalPage,
        "total_data": totalData,
        "current": current,
        "next": next,
        "previous": previous,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class ProductData {
    String id;
    String name;
    Brand brand;
    String image;
    double rating;
    int totalReview;
    int price;
    String? discountType;
    int discount;
    int maxDiscount;
    int finalDiscount;
    int finalPrice;
    Category category;
    DateTime createdAt;
    dynamic position;

    ProductData({
        required this.id,
        required this.name,
        required this.brand,
        required this.image,
        required this.rating,
        required this.totalReview,
        required this.price,
        required this.discountType,
        required this.discount,
        required this.maxDiscount,
        required this.finalDiscount,
        required this.finalPrice,
        required this.category,
        required this.createdAt,
        required this.position,
    });

    ProductData copyWith({
        String? id,
        String? name,
        Brand? brand,
        String? image,
        double? rating,
        int? totalReview,
        int? price,
        String? discountType,
        int? discount,
        int? maxDiscount,
        int? finalDiscount,
        int? finalPrice,
        Category? category,
        DateTime? createdAt,
        dynamic position,
    }) => 
        ProductData(
            id: id ?? this.id,
            name: name ?? this.name,
            brand: brand ?? this.brand,
            image: image ?? this.image,
            rating: rating ?? this.rating,
            totalReview: totalReview ?? this.totalReview,
            price: price ?? this.price,
            discountType: discountType ?? this.discountType,
            discount: discount ?? this.discount,
            maxDiscount: maxDiscount ?? this.maxDiscount,
            finalDiscount: finalDiscount ?? this.finalDiscount,
            finalPrice: finalPrice ?? this.finalPrice,
            category: category ?? this.category,
            createdAt: createdAt ?? this.createdAt,
            position: position ?? this.position,
        );

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        name: json["name"],
        brand: brandValues.map[json["brand"]]!,
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        totalReview: json["total_review"],
        price: json["price"],
        discountType: json["discount_type"],
        discount: json["discount"],
        maxDiscount: json["max_discount"],
        finalDiscount: json["final_discount"],
        finalPrice: json["final_price"],
        category: categoryValues.map[json["category"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "brand": brandValues.reverse[brand],
        "image": image,
        "rating": rating,
        "total_review": totalReview,
        "price": price,
        "discount_type": discountType,
        "discount": discount,
        "max_discount": maxDiscount,
        "final_discount": finalDiscount,
        "final_price": finalPrice,
        "category": categoryValues.reverse[category],
        "created_at": createdAt.toIso8601String(),
        "position": position,
    };
}

enum Brand {
    AUDI,
    BMW,
    EIBACH,
    FUEL,
    GAJAH_TUNGGAL,
    GIO,
    GOOD_YEAR,
    KANATI,
    LENSO,
    NICHE,
    ROTIFORM,
    SUPERSPRINT,
    TPI,
    VOLKSWAGEN
}

final brandValues = EnumValues({
    "AUDI": Brand.AUDI,
    "BMW": Brand.BMW,
    "Eibach": Brand.EIBACH,
    "FUEL": Brand.FUEL,
    "Gajah Tunggal": Brand.GAJAH_TUNGGAL,
    "Gio": Brand.GIO,
    "Good Year": Brand.GOOD_YEAR,
    "Kanati": Brand.KANATI,
    "Lenso": Brand.LENSO,
    "Niche": Brand.NICHE,
    "Rotiform": Brand.ROTIFORM,
    "Supersprint": Brand.SUPERSPRINT,
    "TPI": Brand.TPI,
    "Volkswagen": Brand.VOLKSWAGEN
});

enum Category {
    EXHAUST,
    PART_ACCESSORIES,
    SUSPENSION,
    TIRES,
    WHEELS
}

final categoryValues = EnumValues({
    "Exhaust": Category.EXHAUST,
    "Part & Accessories": Category.PART_ACCESSORIES,
    "Suspension": Category.SUSPENSION,
    "Tires": Category.TIRES,
    "Wheels": Category.WHEELS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
