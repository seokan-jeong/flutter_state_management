import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx/controller/count_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GetX'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CountController());
    /*
    Get.find
    Get.find를 사용하면 Get.put으로 등록한 컨트롤러를 어디에서든 접근하여 사용할 수 있음(자식 위젯에서도 사용 가능)
    중요한 점은 Get.put을 사용하여 먼저 컨트롤러를 등록한 후 사용해야 함
    만약 등록이 되지 않은 컨트롤러에 접근한다면 에러 발생함
    */

    // static get to
    Get.put(CountController());

    // 단순 상태 관리
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(title),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text('You have pushed the button this many times'),
    //         GetBuilder<CountController>(builder: (controller){
    //           return Text('${controller.count}', style: Theme.of(context).textTheme.headline4,);
    //         }),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: controller.increment,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ),
    // );

    // 반응형 상태 관리
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times'),
            Obx(
                () => Text(
                  // '${controller.count.value}',
                  // '${Get.find<CountController>().count.value}', // Get.find
                  '${CountController.to.count.value}',  // static get to
                  style: Theme.of(context).textTheme.headline4,
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: controller.increment,
        // onPressed: Get.find<CountController>().increment, // Get.find
        onPressed: CountController.to.increment,  // static get to
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

