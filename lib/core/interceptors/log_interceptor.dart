import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pop_network/pop_network.dart' show QueryFormatter;

class LogInterceptor implements Interceptor {
  String _requestUrl = '';
  String _metodo = '';

  String _formatarJSON(dynamic data) {
    const encoder = JsonEncoder.withIndent('  ');
    return encoder.convert(data);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    debugPrint('<-- ERROR $_requestUrl');
    debugPrint(_isTipoRespostaEmBytes(err.response)
        ? _formatarBytes(err.response?.data)
        : _formatarJSON(err.response?.data));
    debugPrint(err.error);
    debugPrint('<-- END $_metodo');
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _metodo = options.method.toUpperCase();
    final String queryParameters = QueryFormatter.formatQueryParameters(
        parameters: options.queryParameters);
    _requestUrl = '${options.baseUrl}${options.path}$queryParameters';
    debugPrint('--> $_metodo $_requestUrl');
    debugPrint('Headers: ${options.headers.toString()}');
    if (options.data != null) {
      debugPrint(_formatarJSON(options.data));
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(
        '<-- ${response.statusCode} ${response.statusMessage} $_requestUrl');
    debugPrint('Headers: ${response.headers.toString()}');
    debugPrint(_isTipoRespostaEmBytes(response)
        ? _formatarBytes(response.data)
        : _formatarJSON(response.data));
    handler.next(response);
  }

  String _formatarBytes(dynamic data) {
    final bytes = Uint8List.fromList(data);
    return '--> ${bytes.sublist(0, 5)}...Um monte de bytes...';
  }

  bool _isTipoRespostaEmBytes(Response? response) {
    return response != null &&
        response.requestOptions.responseType == ResponseType.bytes;
  }
}
