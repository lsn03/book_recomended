class User{
  
  String first_name;
  String? second_name;
  String email;
  String password;
  String birthday;
  User(
    
    this.first_name,
    this.second_name,
    this.email,
    this.password,
    this.birthday,
  );

  Map<String,dynamic> toJson() =>
  {
    
    "first_name":first_name,
    "second_name":second_name,
    "email":email,
    "user_password":password,
    "birthday":birthday,
  };

}