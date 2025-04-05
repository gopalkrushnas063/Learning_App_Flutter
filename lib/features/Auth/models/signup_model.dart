class SignupModel {
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  SignupModel({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phoneNumber': phoneNumber,
    'email': email,
    'password': password,
  };
}