import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer/providers/app_color_provider.dart';
import 'package:tiny_recognizer/providers/bluetooth_provider.dart';
import 'package:tiny_recognizer/utils/app_color.dart';
// import 'package:shop_app/providers/providers.dart';
// import 'package:shop_app/components/init_app_bar.dart';
// import 'package:shop_app/utils/app_color.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "home/";

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final blueProvider = ref.watch(bluetoothProvider);
    AppColor appColor = ref.watch(appColorProvider);
    return Center(child: Container(child: blueProvider.when(
      data: (data) => ListView.separated(itemBuilder: (context, index) => Row(children: [
        Container(
          child: Text(data[index].device.name),
        )
      ]), 
      separatorBuilder: (context, index) => SizedBox(height: 2), 
      itemCount: data.length), 
      error: (error, stackTrace) => Text("Cargando"), 
      loading: () => SizedBox.shrink())));
  }
}
