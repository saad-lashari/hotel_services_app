// ignore_for_file: file_names

class AppUser {
  AppUser(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.image,
      this.loyaltyPoints,
      this.loyalty_amount});
  int? id, loyaltyPoints;
  String? name, email, phone, password, image;
  double? loyalty_amount;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phoneNumber'],
        password: json['password'],
        image: json['image'],
        loyaltyPoints: json['loyalty_points'],
        loyalty_amount: json['loyalty_amount'] == null
            ? null
            : double.parse(json['loyalty_amount'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phoneNumber': phone,
        'password': password,
        'image': image,
      };
}
