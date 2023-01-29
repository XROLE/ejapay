class PaymentMethodModel {
  late int id;
  late String? code;
  late String? titleEn;
  late String? titleFr;
  late String? descriptionEn;
  late int? minAmount;
  late String? descriptionFr;
  late String? iconImage;

  PaymentMethodModel(
      {
        required id,
      code,
      titleEn,
      titleFr,
      descriptionEn,
      minAmount,
      descriptionFr,
      iconImage
    });

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'] ?? "";
    titleEn = json['title_en'] ?? "";
    titleFr = json['title_fr'] ?? "";
    descriptionEn = json['description_en'] ?? "";
    minAmount = json['min_amount'] ?? "";
    descriptionFr = json['description_fr'] ?? "";
    iconImage = json['icon_image'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['code'] = code;
    data['title_en'] = titleEn;
    data['title_fr'] = titleFr;
    data['description_en'] = descriptionEn;
    data['min_amount'] = minAmount;
    data['description_fr'] = descriptionFr;
    data['icon_image'] = iconImage;
    return data;
  }
}