class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilePicture;
  final String? ktp;

  SignUpFormModel({
    this.name,
    this.email,
    this.password,
    this.pin,
    this.profilePicture,
    this.ktp,
  });

  /// Converts the SignUpFormModel object to a JSON representation.
  ///
  /// Returns a map containing the key-value pairs representing the object's properties.
  /// The keys are 'name', 'email', 'password', 'pin', 'profile_picture', and 'ktp'.
  /// The values are the corresponding property values of the SignUpFormModel object.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilePicture,
      'ktp': ktp,
    };
  }

  /// Creates a new instance of [SignUpFormModel] with the specified parameters.
  /// If any of the parameters are null, the corresponding value from the current instance is used.
  ///
  /// Parameters:
  /// - [pin]: The new pin value. If null, the pin value from the current instance is used.
  /// - [profilePicture]: The new profile picture value. If null, the profile picture value from the current instance is used.
  /// - [ktp]: The new ktp value. If null, the ktp value from the current instance is used.
  ///
  /// Returns:
  /// A new instance of [SignUpFormModel] with the updated values.
  SignUpFormModel copyWith({
    String? pin,
    String? profilePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilePicture: profilePicture ?? this.profilePicture,
        ktp: ktp ?? this.ktp,
      );
}
