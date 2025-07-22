import 'package:get/get.dart';
import '../models/user_model.dart';

class UserService extends GetxService {
  // Mock data - 실제 앱에서는 API 호출로 대체
  final List<UserModel> _mockUsers = [
    UserModel(id: 1, name: '김철수', email: 'kim@example.com'),
    UserModel(id: 2, name: '박영희', email: 'park@example.com'),
    UserModel(id: 3, name: '이민수', email: 'lee@example.com'),
  ];

  Future<List<UserModel>> getUsers() async {
    // 네트워크 지연 시뮬레이션
    await Future.delayed(const Duration(seconds: 1));
    return _mockUsers;
  }

  Future<UserModel?> getUserById(int id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return _mockUsers.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<UserModel> createUser(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    final newUser = user.copyWith(id: _mockUsers.length + 1);
    _mockUsers.add(newUser);
    return newUser;
  }

  Future<UserModel> updateUser(UserModel user) async {
    await Future.delayed(const Duration(seconds: 1));
    final index = _mockUsers.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _mockUsers[index] = user;
      return user;
    }
    throw Exception('사용자를 찾을 수 없습니다.');
  }

  Future<void> deleteUser(int id) async {
    await Future.delayed(const Duration(seconds: 1));
    _mockUsers.removeWhere((user) => user.id == id);
  }
}
