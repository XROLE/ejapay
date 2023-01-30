class WalletModel {
  late int? dateCreation;
  late int? dateUpdate;
  late int? id;
  late String? identification;
  late  String? status;
  late String? data;
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

  WalletModel(
      {
        this.dateCreation,
      this.dateUpdate,
      this.id,
      this.identification,
      this.status,
      this.data,
      this.fullName,
      this.address,
      this.accountName,
      this.imageLink,
      this.lastUsed,
      this.customer,
      this.country,
      this.paymentType,
      this.paymentMode,
      this.transactionType,
      });

  WalletModel.fromJson(Map<String, dynamic> json) {
    dateCreation = json['date_creation'] ?? "";
    dateUpdate = json['date_update'] ?? "";
    id = json['id'] ?? "";
    identification = json['identification'] ?? "";
    status = json['status'] ?? "";
    data = json['data'] ?? "";
    fullName = json['fullName'] ?? "";
    address = json['address'] ?? "";
    accountName = json['accountName'] ?? "";
    imageLink = json['imageLink'] ?? "";
    lastUsed = json['lastUsed'] ?? "";
    customer = json['customer'] ?? "";
    country = json['country'] ?? "";
    paymentType = json['paymentType'] ?? "";
    paymentMode = json['paymentMode'] ?? "";
    transactionType = json['transactionType'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['date_creation'] = dateCreation;
    data['date_update'] = dateUpdate;
    data['id'] = id;
    data['identification'] = identification;
    data['status'] = status;
    data['data'] = data;
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
