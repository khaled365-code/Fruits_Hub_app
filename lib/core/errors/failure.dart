
import 'package:dio/dio.dart';

class Failure {
  final String callBack;
  const Failure(this.callBack);

  static Failure handleFailures(Object e) {
    switch (e) {
      case Exception exception:
        return _handleException(exception);
      case Error error:
        return _handleError(error);
      default:
        return const Failure("حدث خطأ غير معروف، من فضلك حاول مرة أخرى لاحقًا");
    }
  }


  static Failure _handleException(Exception e) {
    switch (e) {
      case DioException _:
        return _handleApiFailure(e);

      case FormatException _:
        return Failure("خطأ في صيغة البيانات: ${e.toString()}");

      default:
        return Failure('${e.toString().replaceAll('Exception:','')}');
    }
  }

  static Failure _handleError(Error e)
  {
    return Failure("خطأ في التطبيق: ${e.toString()}");
  }

  static Failure _handleApiFailure(DioException e) {
    switch (e.type) {
      case (DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout):
        return const Failure('انتهت مهلة الاتصال بالخادم');

      case DioExceptionType.cancel:
        return const Failure('تم إلغاء الطلب');

      case DioExceptionType.connectionError:
        return const Failure('حدث خطأ في الاتصال بالخادم');

      case DioExceptionType.badResponse:
        return Failure(_getBadResponseMessage(e));

      case DioExceptionType.badCertificate:
        return const Failure('شهادة الأمان (SSL) غير صالحة أو غير موثوقة');

      default:
        return Failure('فشل غير معروف. من فضلك حاول مرة أخرى لاحقًا. ${e.message}');
    }
  }

  static String _getBadResponseMessage(DioException exception) {
    switch (exception.response?.statusCode) {
      case 400 || 401 || 406:
        return exception.response!.data.toString();
      case 404:
        return 'الخادم لم يتمكن من العثور على المورد المطلوب (خطأ 404)';
      case 405:
        return 'الخادم يعرف طريقة الطلب لكنها غير مدعومة للمورد المطلوب (خطأ 405)';
      case 500:
        return 'خطأ داخلي في الخادم (500)';
      default:
        return 'خطأ غير معروف (الكود: ${exception.response?.statusCode})';
    }
  }
}





