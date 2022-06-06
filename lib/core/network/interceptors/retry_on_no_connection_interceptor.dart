import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

// TODO: Maybe make it work and propagate errors correctly
// Currently I'm not using it as I couldn't make it both propagate an error (without
// using getIt to get every cubit/bloc which is cumbersome and not clean for mobile to display a message
// that connection is down) and retry the connection automatically, it was either retry the connection automatically
// or display the message.

class RetryOnNoConnectionInterceptor extends Interceptor {
  RetryOnNoConnectionInterceptor({required this.requestRetrier});

  final DioConnectivityRetrier requestRetrier;

  @override
  Future onError(DioError dioError, ErrorInterceptorHandler handler) async {
    if (_shouldRetryRequest(dioError)) {
      try {
        return requestRetrier.scheduleRetryRequest(dioError, handler);
      } catch (e) {
        return e;
      }
    }

    return dioError;
  }

  bool _shouldRetryRequest(DioError dioError) =>
      dioError.type == DioErrorType.other && dioError.error != null && dioError.error is SocketException;
}

class DioConnectivityRetrier {
  const DioConnectivityRetrier({required this.dio, required this.connectivity});

  final Dio dio;
  final Connectivity connectivity;

  Future<Response> scheduleRetryRequest(DioError dioError, ErrorInterceptorHandler handler) async {
    late final StreamSubscription? streamSubscription;
    final Completer<Response> responseCompleter = Completer<Response>();
    final RequestOptions requestOptions = dioError.requestOptions;

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) async {
        if (connectivityResult != ConnectivityResult.none) {
          final Response response = await dio.request(
            requestOptions.path,
            cancelToken: requestOptions.cancelToken,
            data: requestOptions.data,
            onReceiveProgress: requestOptions.onReceiveProgress,
            onSendProgress: requestOptions.onSendProgress,
            queryParameters: requestOptions.queryParameters,
          );
          await streamSubscription?.cancel();
          handler.resolve(response);
          responseCompleter.complete(response);
        }
      },
    );

    return responseCompleter.future;
  }
}
