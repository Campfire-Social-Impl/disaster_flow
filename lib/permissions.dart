import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> getLocationPermission() async {
  final status = await Permission.location.request();
  debugPrint("status: $status");
  if (!status.isGranted) {
    return false;
  }

  final statusForAlways = await Permission.locationAlways.request();
  debugPrint("statusForAlways: $statusForAlways");
  if (!statusForAlways.isGranted) {
    return false;
  }

  return true;
}
