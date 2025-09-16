

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

import '../../features/auth/data/models/user_model.dart';

class FireStoreService implements DatabaseService
{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> add({required String path, required Map<String, dynamic> data,required String recordId}) async
  {
   await _firestore.collection(path).doc(recordId).set(data);
  }

  @override
  Future<Map<String,dynamic>> getData({required String path, required String record_id}) async
  {
    var result= await _firestore.collection(path).doc(record_id).get();
    return result.data() as Map<String,dynamic>;

  }










}