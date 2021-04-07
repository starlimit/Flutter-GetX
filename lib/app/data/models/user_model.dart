class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String role;
  String fullName() => this.firstName + this.lastName;

  UserModel({this.id, this.firstName, this.lastName, this.email, this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.email = json['email'];
    this.role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
}
