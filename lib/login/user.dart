class User {
  int? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _avatar;

  User(
      {int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? avatar}) {
    if (id != null) {
      this._id = id;
    }
    if (email != null) {
      this._email = email;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (avatar != null) {
      this._avatar = avatar;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get avatar => _avatar;
  set avatar(String? avatar) => _avatar = avatar;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['avatar'] = this._avatar;
    return data;
  }
}
