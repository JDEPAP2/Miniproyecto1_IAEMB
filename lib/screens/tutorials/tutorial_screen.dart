import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_recognizer/providers/app_color_provider.dart';
import 'package:tiny_recognizer/providers/bluetooth_provider.dart';
import 'package:tiny_recognizer/screens/class/class_screen.dart';
import 'package:tiny_recognizer/utils/app_color.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:shop_app/providers/providers.dart';
// import 'package:shop_app/components/init_app_bar.dart';
// import 'package:shop_app/utils/app_color.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class TutorialScreen extends ConsumerStatefulWidget {
  const TutorialScreen({super.key});

  static String routeName = "tutorial/";

  @override
  TutorialScreenState createState() => TutorialScreenState();
}

class TutorialScreenState extends ConsumerState<TutorialScreen> {

  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      child: IntrinsicHeight(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Tutoriales", style: TextStyle(color: Colors.black,
          fontWeight: FontWeight.bold, fontSize: 30)),
        Text("Aquí podrás encontrar tutoriales de como realizar cada palabra en lenguaje de señas"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seña de Ayudar ", style: TextStyle(color: const Color.fromARGB(255, 204, 184, 4),
              fontWeight: FontWeight.bold, fontSize: 25)),
            Icon(Icons.handshake, color: const Color.fromARGB(255, 204, 184, 4), size: 35)
          ])
        ,
        InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromARGB(255, 153, 139, 11).withOpacity(0.8)
          ),
          child: Text("Ver Video", style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 15),)),
          onTap: ()async => await launchUrlString("https://www.youtube.com/watch?v=EBzdMUuqrPE"),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seña de Medico ", style: TextStyle(color: Colors.blue,
              fontWeight: FontWeight.bold, fontSize: 25)),
            Icon(Icons.health_and_safety, color: Colors.blue, size: 35)
          ]),
        InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blue.withOpacity(0.8)
          ),
          child: Text("Ver Video", style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 15),)),
          onTap: ()async => await launchUrlString("https://www.youtube.com/watch?v=9CJXWB3KDbc"),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seña de Peligroso ", style: TextStyle(color: Colors.red,
              fontWeight: FontWeight.bold, fontSize: 25)),
            Icon(Icons.dangerous, color: Colors.red, size: 35)
          ]),
        InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red.withOpacity(0.8)
          ),
          child: Text("Ver Video", style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 15),)),
          onTap: ()async => await launchUrlString("https://www.youtube.com/watch?v=C2G6mq_tOkk"),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seña de Policia ", style: TextStyle(color: Colors.green,
              fontWeight: FontWeight.bold, fontSize: 25)),
            Icon(Icons.local_police, color: Colors.green, size: 35)
          ]),
        InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green.withOpacity(0.8)
          ),
          child: Text("Ver Video", style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 15),)),
          onTap: ()async => await launchUrlString("https://www.youtube.com/watch?v=7QxXUW4Xn8k"),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seña de Salir ", style: TextStyle(color: Colors.purple,
              fontWeight: FontWeight.bold, fontSize: 25)),
            Icon(Icons.exit_to_app, color: Colors.purple, size: 35)
          ]),
        InkWell(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.purple.withOpacity(0.8)
          ),
          child: Text("Ver Video", style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold, fontSize: 15),)),
          onTap: ()async => await launchUrlString("https://www.youtube.com/watch?v=7GcGKszWPGQ"),
        ),
      ],
    )));
  }
}
