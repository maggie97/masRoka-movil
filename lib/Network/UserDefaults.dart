class UserDefaults{
  static UserDefaults shared = UserDefaults();
  String userId, email;
  UserDefaults(){
    userId = "";
    email = "";
  }
}