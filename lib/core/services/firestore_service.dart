

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_commerce_app/core/services/database_service.dart';
import 'package:fruits_commerce_app/core/services/logger_service.dart';

class FireStoreService extends DatabaseService
{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> add({required String path, required Map<String, dynamic> data,required String recordId}) async
  {
    try
    {
      await _firestore.collection(path).doc(recordId).set(data);
    } catch (e)
    {
      LoggerService().logDebug('Exception in FireStoreService.add and the exception : $e ');
      throw Exception('Failed to add your data');
    }
  }

  @override
  Future<Map<String,dynamic>> getSpecificData({required String path, required String record_id}) async
  {
   try
   {
     var result= await _firestore.collection(path).doc(record_id).get();
     return result.data() as Map<String,dynamic>;
   } catch (e)
    {
      LoggerService().logDebug('Exception in FireStoreService.getSpecificData and the exception : $e ');
      throw Exception('Failed to fetch your data');
    }

  }

  @override
  Future<bool> checkIfRecordExists({required String path, required String recordId}) async
  {
     try
     {
       var result = await _firestore.collection(path).doc(recordId).get();
       return result.exists;
     } catch (e)
     {
       LoggerService().logDebug('Exception in FireStoreService.checkIfRecordExists and the exception : $e ');
       throw Exception('Failed to search for your data');
     }
  }

  @override
  Future<List<Map<String,dynamic>>> getCollectionData({required String path}) async {
    try
    {
      final result = await _firestore.collection(path).get();
      return result.docs.map((doc) {
        return
          {
            ...doc.data(),
          };
      }).toList();
    } catch (e)
     {
       LoggerService().logDebug('Exception in FireStoreService.getCollectionData and the exception : $e ');
       throw Exception('Failed to fetch for your data');
     }

  }

  @override
  Future<List<Map<String, dynamic>>> getFilteredCollectionData({required String path, required Map<String, dynamic> filter}) async
  {
    try
    {
      Query<Map<String, dynamic>> data = _firestore.collection(path);
      if(filter['orderBy']!=null)
        {
          String orderWith=filter['orderBy'];
          bool descending=filter['descending'];
          data = data.orderBy(orderWith,descending: descending);
        }
      if (filter['limit']!=null)
        {
          int limit=filter['limit'];
          data =data.limit(limit);
        }
       var result  = await data.get();
      return result.docs.map((item)=>item.data()).toList();
    } catch (e)
    {
      LoggerService().logDebug('Exception in FireStoreService.getFilteredCollectionData and the exception : $e ');
      throw Exception('Failed to fetch for your data');
    }

  }










}