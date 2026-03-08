


abstract class DatabaseService
{

  Future<void> add({required String path,required Map<String,dynamic> data,required String recordId});

  Future<Map<String,dynamic>> getSpecificData({required String path,required String record_id});

  Future<bool> checkIfRecordExists({required String path,required String recordId});

  Future<List<Map<String,dynamic>>> getCollectionData({required String path});

  Future<List<Map<String,dynamic>>> getFilteredCollectionData({required String path,required Map<String,dynamic> filter});

}


