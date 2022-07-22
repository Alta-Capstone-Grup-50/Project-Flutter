class CreateAccount {
  String? nama;
  String? email;
  String? password;
  String? level;

  CreateAccount({this.nama, this.email, this.password, this.level});

  CreateAccount.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    password = json['password'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['email'] = email;
    data['password'] = password;
    data['level'] = level;
    return data;
  }
}
