import 'package:dio/dio.dart';
import 'package:fruits_commerce_app/core/localization/localization_cubit/localization_cubit.dart';

class Failure
{
  final String callBack;
  const Failure(this.callBack);

  static String _msg(String ar, String en) =>
      LocalizationCubit().currentLanguage == 'ar' ? ar : en;

  static Failure handleFailures(Object e) {
    switch (e) {
      case Exception exception:
        return _handleException(exception);
      case Error error:
        return _handleError(error);
      default:
        return Failure(_msg(
          'حدث خطأ غير معروف، من فضلك حاول مرة أخرى لاحقًا',
          'An unknown error occurred, please try again later',
        ));
    }
  }

  static Failure _handleException(Exception e) {
    switch (e) {
      case DioException _:
        return _handleApiFailure(e);

      case FormatException _:
        return Failure(_msg(
          'خطأ في صيغة البيانات: ${e.toString()}',
          'Data format error: ${e.toString().replaceAll('Exception:', '')}',
        ));

      default:
        return Failure('${e.toString().replaceAll('Exception:', '')}');
    }
  }

  static Failure _handleError(Error e) {
    return Failure(_msg(
      'خطأ في التطبيق: ${e.toString()}',
      'Application error: ${e.toString()}',
    ));
  }

  static Failure _handleApiFailure(DioException e) {
    switch (e.type) {
      case (DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout):
        return Failure(_msg(
          'انتهت مهلة الاتصال بالخادم',
          'Connection to the server timed out',
        ));

      case DioExceptionType.cancel:
        return Failure(_msg(
          'تم إلغاء الطلب',
          'The request was cancelled',
        ));

      case DioExceptionType.connectionError:
        return Failure(_msg(
          'حدث خطأ في الاتصال بالخادم',
          'A connection error occurred',
        ));

      case DioExceptionType.badResponse:
        return Failure(_getBadResponseMessage(e));

      case DioExceptionType.badCertificate:
        return Failure(_msg(
          'شهادة الأمان (SSL) غير صالحة أو غير موثوقة',
          'The SSL certificate is invalid or untrusted',
        ));

      default:
        return Failure(_msg(
          'فشل غير معروف. من فضلك حاول مرة أخرى لاحقًا. ${e.message}',
          'Unknown failure. Please try again later. ${e.message}',
        ));
    }
  }

  static String _getBadResponseMessage(DioException exception) {
    switch (exception.response?.statusCode) {
      case 400 || 401 || 406:
        return exception.response!.data.toString();
      case 404:
        return _msg(
          'الخادم لم يتمكن من العثور على المورد المطلوب (خطأ 404)',
          'The server could not find the requested resource (Error 404)',
        );
      case 405:
        return _msg(
          'الخادم يعرف طريقة الطلب لكنها غير مدعومة للمورد المطلوب (خطأ 405)',
          'The request method is known but not supported for this resource (Error 405)',
        );
      case 500:
        return _msg(
          'خطأ داخلي في الخادم (500)',
          'Internal server error (500)',
        );
      default:
        return _msg(
          'خطأ غير معروف (الكود: ${exception.response?.statusCode})',
          'Unknown error (Code: ${exception.response?.statusCode})',
        );
    }
  }
}