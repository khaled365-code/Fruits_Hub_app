

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';

class FireStoreService extends DatabaseService
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

  @override
  Future<bool> checkIfRecordExists({required String path, required String recordId}) async
  {
    var result = await _firestore.collection(path).doc(recordId).get();
    return result.exists;
  }










}