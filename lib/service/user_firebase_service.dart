import 'package:practice_real_demo/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';

class UserFirebaseService{

  Future addUser(UserModel userModel)async{
   DatabaseReference reference =  FirebaseDatabase.instance.ref();
  await reference.child('user').child(userModel.userId).set(userModel.toJson());
  }

  Future deleteUser(String id)async{
    DatabaseReference reference =  FirebaseDatabase.instance.ref();
    await reference.child('user').child(id).remove();
  }
  Future<List<UserModel>> getUsers() async {
    DatabaseReference reference = FirebaseDatabase.instance.ref().child('user');
    DataSnapshot snapshot = await reference.get();
    if (snapshot.exists) {
      List<UserModel> users = [];
      Map<dynamic, dynamic> usersMap = snapshot.value as Map<dynamic, dynamic>;
      usersMap.forEach((key, value) {
        users.add(UserModel.fromJson(Map<String, dynamic>.from(value)));
      });
      return users;
    }
    return [];
  }
  Future updateUser(UserModel userModel) async {
    DatabaseReference reference = FirebaseDatabase.instance.ref();
    await reference.child('user').child(userModel.userId).update(userModel.toJson());
  }

}