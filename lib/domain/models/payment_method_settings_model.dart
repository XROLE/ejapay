class PaymentMethodSettingsModel {
  late String id;
  late String name;
  late String desc;

  PaymentMethodSettingsModel({required this.id, required this.name, required this.desc});

  PaymentMethodSettingsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['desc'] = desc;
    return data;
  }
}