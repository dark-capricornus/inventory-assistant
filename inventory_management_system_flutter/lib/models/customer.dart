class Customer {
  final int id;
  final String name;
  final String contactPerson;
  final String email;
  final String phone;
  final String address;
  final String? gstin;
  final int? orderCount;
  final double? lifetimeValue;

  Customer({
    required this.id,
    required this.name,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    this.gstin,
    this.orderCount,
    this.lifetimeValue,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      name: json['name'] as String,
      contactPerson: json['contactPerson'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      gstin: json['gstin'] as String?,
      orderCount: json['orderCount'] as int?,
      lifetimeValue: json['lifetimeValue'] != null ? (json['lifetimeValue'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'contactPerson': contactPerson,
      'email': email,
      'phone': phone,
      'address': address,
      'gstin': gstin,
      'orderCount': orderCount,
      'lifetimeValue': lifetimeValue,
    };
  }
}