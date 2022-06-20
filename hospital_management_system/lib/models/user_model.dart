// class UserModel {
//   String? email;

//   String? accessToken;
//   String? expire;
//   String? message;

//   UserModel({
//     this.email,
//     this.accessToken,
//     this.expire,
//     this.message,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       return UserModel(
//         accessToken: json['data']['token'],
//         expire: json['data']['expire'],
//       );
//     } else {
//       return UserModel(message: json['message']);
//     }
//   }
// }

class UserModel {
  int? id;
  String? name;
  String? email;
  String? profilePic;
  String? accessToken;
  String? tokenType;
  String? message;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profilePic,
    this.accessToken,
    this.tokenType,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      return UserModel(
        id: json['data']['id'] ?? 0,
        name: json['data']['name'],
        email: json['data']['email'],
        tokenType: json['token_type'],
        accessToken: json['access_token'],
        message: json['message'],
      );
    } else {
      return UserModel(message: json['message']);
    }
  }
}


// class AkunDoktorPerawatModel {
//   List<AkunDoktorPerawat>? akunDoktorPerawat;

//   AkunDoktorPerawatModel({this.akunDoktorPerawat});

//   AkunDoktorPerawatModel.fromJson(Map<String, dynamic> json) {
//     if (json['akun_doktor_perawat'] != null) {
//       akunDoktorPerawat = <AkunDoktorPerawat>[];
//       json['akun_doktor_perawat'].forEach((v) {
//         akunDoktorPerawat!.add(AkunDoktorPerawat.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (akunDoktorPerawat != null) {
//       data['akun_doktor_perawat'] =
//           akunDoktorPerawat!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AkunDoktorPerawat {
//   int? id;
//   String? nickname;
//   String? email;
//   String? jenisPekerjaan;
//   DataDoktorPerawat? dataDoktorPerawat;

//   AkunDoktorPerawat(
//       {this.id,
//       this.nickname,
//       this.email,
//       this.jenisPekerjaan,
//       this.dataDoktorPerawat});

//   AkunDoktorPerawat.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     nickname = json['nickname'];
//     email = json['email'];
//     jenisPekerjaan = json['jenis_pekerjaan'];
//     dataDoktorPerawat = json['data_doktor_perawat'] != null
//         ? DataDoktorPerawat.fromJson(json['data_doktor_perawat'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['nickname'] = nickname;
//     data['email'] = email;
//     data['jenis_pekerjaan'] = jenisPekerjaan;
//     if (dataDoktorPerawat != null) {
//       data['data_doktor_perawat'] = dataDoktorPerawat!.toJson();
//     }
//     return data;
//   }
// }

// class DataDoktorPerawat {
//   int? akunDokterPerawatId;
//   String? nomorSIP;
//   String? nama;
//   String? jabatan;
//   String? nomorTelfon;
//   String? jenisKelamin;
//   String? spesialis;
//   String? jadwalPraktek;
//   int? nomorSTR;

//   DataDoktorPerawat(
//       {this.akunDokterPerawatId,
//       this.nomorSIP,
//       this.nama,
//       this.jabatan,
//       this.nomorTelfon,
//       this.jenisKelamin,
//       this.spesialis,
//       this.jadwalPraktek,
//       this.nomorSTR});

//   DataDoktorPerawat.fromJson(Map<String, dynamic> json) {
//     akunDokterPerawatId = json['akun_dokter_perawat_id'];
//     nomorSIP = json['nomor_SIP'];
//     nama = json['nama'];
//     jabatan = json['jabatan'];
//     nomorTelfon = json['nomor_telfon'];
//     jenisKelamin = json['jenis_kelamin'];
//     spesialis = json['spesialis'];
//     jadwalPraktek = json['jadwal_praktek'];
//     nomorSTR = json['nomor_STR'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['akun_dokter_perawat_id'] = akunDokterPerawatId;
//     data['nomor_SIP'] = nomorSIP;
//     data['nama'] = nama;
//     data['jabatan'] = jabatan;
//     data['nomor_telfon'] = nomorTelfon;
//     data['jenis_kelamin'] = jenisKelamin;
//     data['spesialis'] = spesialis;
//     data['jadwal_praktek'] = jadwalPraktek;
//     data['nomor_STR'] = nomorSTR;
//     return data;
//   }
// }