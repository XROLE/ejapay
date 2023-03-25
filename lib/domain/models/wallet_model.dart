class WalletModel {
  late int? dateCreation;
  late int? dateUpdate;
  late int? id;
  late String? identification;
  late String? status;
  late String? fullName;
  late String? address;
  late String? accountName;
  late String? imageLink;
  late int? lastUsed;
  late int? customer;
  late int? country;
  late int? paymentType;
  late int? paymentMode;
  late int? transactionType;

  WalletModel({
    required this.dateCreation,
    required this.dateUpdate,
    required this.id,
    required this.identification,
    required this.status,
    required this.fullName,
    required this.address,
    required this.accountName,
    required this.imageLink,
    required this.lastUsed,
    required this.customer,
    required this.country,
    required this.paymentType,
    required this.paymentMode,
    required this.transactionType,
  });

  WalletModel.fromJson(Map<String, dynamic> json) {
    dateCreation = json['date_creation'] ?? 01022023;
    dateUpdate = json['date_update'] ?? 01022023;
    id = json['id'] ?? 1;
    identification = json['identification'] ?? "";
    status = json['status'] ?? "";
    fullName = json['fullName'] ?? "";
    address = json['address'] ?? "";
    accountName = json['accountName'] ?? "";
    imageLink = json['imageLink'] ?? "";
    lastUsed = json['lastUsed'] ?? "";
    customer = json['customer'] ?? 1;
    country = json['country'] ?? 1;
    paymentType = json['paymentType'] ?? 1;
    paymentMode = json['paymentMode'] ?? 1;
    transactionType = json['transactionType'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date_creation'] = dateCreation;
    data['date_update'] = dateUpdate;
    data['id'] = id;
    data['identification'] = identification;
    data['status'] = status;
    data['fullName'] = fullName;
    data['address'] = address;
    data['accountName'] = accountName;
    data['imageLink'] = imageLink;
    data['lastUsed'] = lastUsed;
    data['customer'] = customer;
    data['country'] = country;
    data['paymentType'] = paymentType;
    data['paymentMode'] = paymentMode;
    data['transactionType'] = transactionType;
    return data;
  }
}
