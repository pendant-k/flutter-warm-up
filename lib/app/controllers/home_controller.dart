import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class HomeController extends GetxController {
  // Observable variables
  final _isLoading = false.obs;
  final _users = <UserModel>[].obs;
  final _selectedUser = Rxn<UserModel>();

  // Getters
  bool get isLoading => _isLoading.value;
  List<UserModel> get users => _users;
  UserModel? get selectedUser => _selectedUser.value;

  // Service injection
  final UserService _userService = Get.find<UserService>();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // Methods
  Future<void> fetchUsers() async {
    try {
      _isLoading.value = true;
      final users = await _userService.getUsers();
      _users.assignAll(users);
    } catch (e) {
      Get.snackbar('오류', '사용자 정보를 불러오는데 실패했습니다.');
    } finally {
      _isLoading.value = false;
    }
  }

  void selectUser(UserModel user) {
    _selectedUser.value = user;
  }
}
