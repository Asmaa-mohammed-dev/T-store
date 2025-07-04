import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/popups/loaders.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  ///initialize the network manager and set up a stream to connectivity check the connection status
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  ///Update the connection status based on changes in connectivity and show a relevant popup for no internet connection.
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final result = results.first;
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      TLoaders.customToast(message: 'There is no connection to the internet');
    }
  }

  ///Check the internet connection status
  ///Returns 'true' if connected, 'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  ///Dispose or close the active connectivity Stream

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
