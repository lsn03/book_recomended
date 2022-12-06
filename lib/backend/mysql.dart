import 'package:mysql1/mysql1.dart';

class Mysql {
  static const _ipAdress = "192.168.0.109";
  static const hostConnect = "http://$_ipAdress/love&read";
  static const signUp = "$hostConnect/signup.php";
  static const login = "$hostConnect/login.php";
  static const profile = "$hostConnect/profile.php";
  static const loadBooks = "$hostConnect/loadBooks.php";
  static const fetchData = "$hostConnect/fetchData.php";
  
  static const updateData = "$hostConnect/updateData.php";
}
