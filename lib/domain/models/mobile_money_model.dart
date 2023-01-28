class MobileMoneyModel {
  late String name;
 late String id;
  late String phoneNumber;

  MobileMoneyModel({ required this.name, required this.id, required this.phoneNumber});

  MobileMoneyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    id = json['id'] ?? "";
    phoneNumber = json['phone_number'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['id'] = id;
    data['phone_number'] = phoneNumber;
    return data;
  }
}