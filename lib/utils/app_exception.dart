import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shopi/utils/app_snack.dart';
import 'package:shopi/utils/utils.dart';

class AppExceptions {
  static void errorHandler(Object e) {
    if (e is PlatformException) {
      AppToast.showToast('Platform Error Occured', errorColor);
    }
    if (e is SocketException) {
      AppToast.showToast('No Internet Connection', errorColor);
    } else if (e is TimeoutException) {
      AppToast.showToast('Connection Timedout', errorColor);
    } else if (e is MissingPluginException) {
      AppToast.showToast('Plugin error occured', errorColor);
    } else if (e is DioError) {
      if (e.response?.statusCode == 403 &&
          e.response?.data['message'] == 'forbidden') {
        log('refresh token expired so loging out');
      }
      if (e.response?.data['message'] != null) {
        AppToast.showToast(e.response!.data['message'].toString(), errorColor);
      } else if (e.type == DioErrorType.connectTimeout) {
        AppToast.showToast('Connection timedout', errorColor);
      } else if (e.type == DioErrorType.receiveTimeout) {
        AppToast.showToast('Response timedout', errorColor);
      } else if (e.type == DioErrorType.cancel) {
        AppToast.showToast('Request cancelled', errorColor);
      } else if (e.type == DioErrorType.sendTimeout) {
        AppToast.showToast('Request timedout', errorColor);
      } else if (e.error is SocketException) {
        AppToast.showToast('No Internet Connection', errorColor);
      } else if (e.type == DioErrorType.other) {
        AppToast.showToast('Something went wrong', errorColor);
      }
    }
  }
}
