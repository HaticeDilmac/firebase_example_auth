// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example_one/model/data.dart';

class FirebaseService {
  final usersTable = FirebaseFirestore.instance
      .collection('users'); //users collectionuna erişme

  Future<Type> getUserPost(String userId) async {
    final userDoc =
        await usersTable.doc(userId).get().then((value) => value.data());
    final dataModels = DataModel.fromJson(userDoc!);
    return DataModel;
  }
}
