

import 'package:fruits_commerce_app/features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService
{

  Future<void> add({required String path,required Map<String,dynamic> data,required String recordId});

  Future<Map<String,dynamic>> getData({required String path,required String record_id});

  Future<bool> checkIfRecordExists({required String path,required String recordId});

}