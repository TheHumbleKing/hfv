import 'package:get/get.dart';
import 'package:hfv_app/defs/customer.dart';

class UserController extends GetxController {
  Rx<User> user = User("", "", "", "", "").obs;
}
