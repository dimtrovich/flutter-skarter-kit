import 'dart:convert';

import 'package:starter_kit/core/remote/api.dart';
import 'package:starter_kit/core/remote/remote_error.dart';
import 'package:starter_kit/core/remote/remote_response.dart';
import 'package:starter_kit/core/app_ctrl.dart';

class HomeCtrl extends AppCtrl {
  bool isLoading = false;
  String? apiResult;
  String? apiError;

  Future<void> requestSampleApi() async {
    isLoading = true;
    apiResult = null;
    apiError = null;
    update();

    await Api('posts/1').get(
      onSuccess: (RemoteResponse response) {
        apiResult = const JsonEncoder.withIndent('  ').convert(response.result);
        isLoading = false;
        update();
      },
      onError: (RemoteError error) {
        apiError = error.message ?? 'Unknown error';
        isLoading = false;
        update();
      },
    );
  }
}
