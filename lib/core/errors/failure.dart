

import 'package:dio/dio.dart';

class Failure
{
  final String callBack;
  const Failure(this.callBack);


  static Failure handleFailures(Object e)
  {
    switch(e)
    {
      case Exception exception:
        return _handleException(exception);
      case Error error:
        return _handleError(error);
      default:
      return const Failure("Unknown Failure happened , please try again later");
    }




  }

  static Failure _handleException(Exception e)
  {
    switch(e)
    {

      case DioException _:
        return _handleApiFailure(e);


      case FormatException _:
        return Failure(e.toString());


      default:
        return Failure('${e.toString()}');



    }
  }

  static Failure _handleError(Error e)
  {
    return Failure(e.toString());
  }

  static Failure _handleApiFailure(DioException e)
  {
    switch(e.type)
    {

      case (DioExceptionType.connectionTimeout||
          DioExceptionType.receiveTimeout||
          DioExceptionType.sendTimeout):
        return const Failure('connection timeout happened');

      case DioExceptionType.cancel:
        return const Failure('request has been canceled');

      case DioExceptionType.connectionError:
        return const Failure('error happened with the request');

      case DioExceptionType.badResponse:
        return Failure(_getBadResponseMessage(e));

      default:
        return Failure('UnKnown Failure Please Try Again Later. ${e.message}');
    }

  }

  static String _getBadResponseMessage(DioException exception)
  {
    switch (exception.response!.statusCode) {
      case 400 || 401 || 406:
        return exception.response!.data.toString();
      case 404:
        return 'The server cannot find the requested resource (404 not recognized)';
      case 405:
        return 'The request method is known by the server but is not supported by the target resource (405)';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Unknown Error (Code: ${exception.response!.statusCode})';
    }

  }




}