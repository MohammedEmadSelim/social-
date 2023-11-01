class UserModel {
  String? name;
  String? img;
  String? phoneNumber;
  Map<String, dynamic>? socialMedia = {};
  List? myNetwork;
  UserModel({
    this.name,
    this.img,
    this.phoneNumber,
    this.socialMedia,
    this.myNetwork,
  });
  Map<String, dynamic> toMMap() => {
        'name': name,
        "phoneNumber": phoneNumber,
        "img": img,
        'socialMedia': socialMedia,
      };
  UserModel fromMap(Map<String, dynamic>? myData) {
    return UserModel(
      name: myData!['name'],
      phoneNumber: myData['phoneNumber'],
      img: myData['img'],
      socialMedia: myData['socialMedia'],
      myNetwork: myData['myNetwork'],
    );
  }
}
