import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer/providers/app_color_provider.dart';
import 'package:tiny_recognizer/providers/bluetooth_provider.dart';
import 'package:tiny_recognizer/providers/class_provider.dart';
import 'package:tiny_recognizer/utils/app_color.dart';
// import 'package:shop_app/providers/providers.dart';
// import 'package:shop_app/components/init_app_bar.dart';
// import 'package:shop_app/utils/app_color.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class ClassScreen extends ConsumerStatefulWidget {
  const ClassScreen({super.key});

  static String routeName = "class/";

  @override
  ClassScreenState createState() => ClassScreenState();
}

class ClassScreenState extends ConsumerState<ClassScreen> {
  @override
  void initState() {
    super.initState();
  }

  String getName(int v){
    switch(v){
      case 1:
        return "Ayudar";
      case 2:
        return "Medico";
      case 3:
        return "Peligroso";
      case 4:
        return "Policia";
      case 5:
        return "Salir";
      default:
        return "Sin Reconocer";
    }
  }

  IconData getIcon(int v){
    switch(v){
      case 1:
        return Icons.handshake;
      case 2:
        return Icons.health_and_safety;
      case 3:
        return Icons.dangerous;
      case 4:
        return Icons.local_police;
      case 5:
        return Icons.exit_to_app;
      default:
        return Icons.help_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final classProv = ref.watch(classProvider);
    AppColor appColor = ref.watch(appColorProvider);
    return Scaffold(
      // backgroundColor: appColor.primary,
      body: Container(
        decoration: BoxDecoration(
          gradient: appColor.gradient
        ),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(classProv.when(data: (data) => getName(data), error: (error, stackTrace) => "Error", loading: ()=>"Cargando"),
            style: TextStyle(color: appColor.getContrastColor(), fontSize: 40, fontWeight: FontWeight.bold))
          ),
          SizedBox(height: 10),
          Center(
            child: classProv.when(data: (data) => Icon(getIcon(data),
            color: appColor.getContrastColor(),
            size: 120),error: (error, stackTrace) => SizedBox.shrink(),
            loading: () => CircularProgressIndicator(color: appColor.getContrastColor())),
          ),
          SizedBox(height: 200),
          Center(
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: appColor.getContrastColor()
                ),
                child: Text("Volver", style: TextStyle(color: appColor.secondary, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              onTap: (){
                ref.read(bluetoothDeviceProvider.notifier).stopRead();
                Navigator.of(context).maybePop();
              },
            ),
          )
        ],
      ),
      ),
      ),
    );
  }
}
