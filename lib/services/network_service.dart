import 'package:dio/dio.dart';

class NetworkService {
  final Dio _dio = Dio();

  final String baseUrl;

  NetworkService({required this.baseUrl}) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.headers = {
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFkNjYxZjQxODVkNTY5ZTllYzMyNzkzYjVmZTdhY2M5OGE4YjY2YzM0ZjI3ZjExYTdmNDI5YjE1NjdhYmY3NzUyZmY5MjIyNDI4YzE0ZDIiLCJpYXQiOjE3MTc0NjUyOTEuNzg4NDYyLCJuYmYiOjE3MTc0NjUyOTEuNzg4NDY0LCJleHAiOjE3NDkwMDEyOTEuNzg0NDMxLCJzdWIiOiI0MjMiLCJzY29wZXMiOltdfQ.oZLf0Xw8lxCk028nQzB3g4OoB_rTQ5MFUk7Kw4CLK23vFVOY1gWFB3jGtVUA-s_7c2qdrZaWTgsZqjdbbEE6AYGuaTAMb5p3XZ_0n3ByVEul9Wp82-TWW1gu-4gP9Su9vzQFEComxulAYR-fW-0HvEVj65Izv8aSjlhdVgy3jqpTjLoEqk8JFdjgg5e7-q-xFcmdTDJ69mfALY0fcCc68rfD-iio-_rAcxsu7QeyFaZ7f2J2ehhnidKuBKf75uPZzv7Aw_zcMUxVXzMj74-PeEfbxbFCzu7CJi7kPwM60xPgTfdxWDySeIj4m128suYAIpCHRjASNZpwsaNombhl0boQTNHihRH3xku7yfca1icO8gjf67N2uEtCtKsxYPhmHmzHp5Mgcc9jqToUB6ydbF3Jcj1riBIbHvEW_3T3gLVRGPTLv0P6_QTxxXJwfQ0zl-zE6x6fhymLIgaQPX_gDOVE0DLGAxlut0z-3RF9lIqiShCJk5KetsbV0sTiNBsgZmL7nNKeNeKldcHmLvKuZwwPN80quJdvNzRd4jm5Ufv_eyuuzm3lr81CiJHUIl3lyAhJRHdjwXZwD86nlUcZtSxM5p_vwtGL0U1kruDBQQQRBldjBtv14olYMDaN9EUDuxzglv_UNuz7OWuElWIauULjKb8Ezh6boPHQeGb8HSI'
    };
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  Response _handleError(DioException e) {
    if (e.response != null) {
      return e.response!;
    } else {
      return Response(
        requestOptions: e.requestOptions,
        statusMessage: e.message,
      );
    }
  }
}
