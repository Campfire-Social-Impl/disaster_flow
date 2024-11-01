import 'dart:async';

import 'package:disaster_flow/permissions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

class TickerNotifier extends StateNotifier<DateTime> {
  late final Timer _timer;

  /// 時刻更新周期(秒)
  static const _periodicSec = 1;

  TickerNotifier() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: _periodicSec), (_) async {
      final now = DateTime.now();
      state = now;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final locationPermissionProvider =
    FutureProvider.autoDispose<bool>((ref) async {
  final status = await getLocationPermission();
  return status;
});

final tickerProvider = StateNotifierProvider<TickerNotifier, DateTime>((ref) {
  return TickerNotifier();
});

final locationProvider = FutureProvider.autoDispose<LocationData?>((ref) async {
  final _ = ref.watch(tickerProvider);
  final permission = await ref.watch(locationPermissionProvider.future);

  if (!permission) {
    return null;
  }

  final location = Location();
  return await location.getLocation();
});

class PositionViewPage extends HookConsumerWidget {
  const PositionViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Position View"),
      ),
      body: Center(
        child: location.value != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("位置情報"),
                  Text("Latitude: ${location.value?.latitude ?? 0.0}"),
                  Text("Longitude: ${location.value?.longitude ?? 0.0}"),
                  Text("Time: ${DateTime.now().toIso8601String()}"),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
