import 'package:flutter/material.dart';
import 'package:practice_real_demo/model/user_model.dart';
import 'package:practice_real_demo/service/user_firebase_service.dart';

class UserProvider extends ChangeNotifier{

  UserProvider(this.userFirebaseService);
  final UserFirebaseService userFirebaseService;
  List<UserModel> _users = [];

  List<UserModel> get users => _users;

  Future addUser(UserModel userModel)async{
    await userFirebaseService.addUser(userModel);
    await fetchUsers();
    print('user added');
    notifyListeners();
  }
  Future<void> fetchUsers() async {
    _users = await userFirebaseService.getUsers();
    print('user fetched successfully');
    notifyListeners();
  }

  Future<void> deleteUser(String id) async {
    await userFirebaseService.deleteUser(id);
    await fetchUsers();
    print('User deleted');
    notifyListeners();
  }

  Future<void> updateUser(UserModel userModel) async {
    await userFirebaseService.updateUser(userModel);
    await fetchUsers();
    notifyListeners();
  }
}