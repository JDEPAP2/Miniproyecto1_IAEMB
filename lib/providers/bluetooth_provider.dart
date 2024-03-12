import 'dart:developer';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer/utils/bluetooth.dart';

final bluetoothProvider = StateNotifierProvider<BluetoothController, AsyncValue<List<ScanResult>>>((ref) => BluetoothController(ref: ref));

class BluetoothController extends StateNotifier<AsyncValue<List<ScanResult>>>{
  StateNotifierProviderRef<BluetoothController, AsyncValue<List<ScanResult>>> ref;
  BluetoothController({required this.ref}): super(const AsyncData([])){
    getAllDevices();
  }
  FlutterBlue flutterBlue = FlutterBlue.instance;
  
  Future<void> updateProviders() async {
    // await ref.read(recordsPersonControllerProvider.notifier).getAllRecords();
    // await ref.read(recordsGroupControllerProvider.notifier).getAllRecords();
  }

  Future<void> getAllDevices() async {
    state = const AsyncLoading();
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    final newState = await AsyncValue.guard(() =>  flutterBlue.scanResults.last);

    if(mounted){
      state = newState;
      await updateProviders();
    }
  }
}


final bluetoothDeviceProvider = StateNotifierProvider<BluetoothDeviceController, AsyncValue<BluetoothDevice?>>((ref) => BluetoothDeviceController(ref: ref));

class BluetoothDeviceController extends StateNotifier<AsyncValue<BluetoothDevice?>>{
  StateNotifierProviderRef<BluetoothDeviceController, AsyncValue<BluetoothDevice?>> ref;
  BluetoothDeviceController({required this.ref}): super(const AsyncData(null));
  FlutterBlue flutterBlue = FlutterBlue.instance;
  
  Future<void> updateProviders() async {
    // await ref.read(recordsPersonControllerProvider.notifier).getAllRecords();
    // await ref.read(recordsGroupControllerProvider.notifier).getAllRecords();
  }

  Future<void> connectDevice(BluetoothDevice device) async{
    state = const AsyncLoading();
    await device.connect();
    if((await flutterBlue.connectedDevices).contains(device)){
      state = AsyncData(device);
    }else{
      state = AsyncData(null);
  }


  Future<void> read() async{
    if(state.hasValue){
      var device = state.value;
      if(device != null){
        List<BluetoothService> services = await device.discoverServices();
        services.forEach((service) {
            var chars = service.characteristics;
            chars.forEach((element) async => log((await element.read()).toString()));
        });
      }
    }
  }
  }

  // Future<void> getAllDevices() async {
  //   state = const AsyncLoading();
  //   flutterBlue.startScan(timeout: Duration(seconds: 4));

  //   final newState = await AsyncValue.guard(() =>  flutterBlue.scanResults.last);

  //   if(mounted){
  //     state = newState;
  //     await updateProviders();
  //   }
  // }
}