import 'package:get/get.dart';

// 단순 상태 관리
// update() 함수를 사용하여 상태가 변경되었음을 알려줌. update()를 사용하지 않으면, 상태값은 변경되지만, 화면 갱신이 일어나지 않음
// class CountController extends GetxController{
//   int count = 0;
//
//   void increment(){
//     count++;
//     update();
//   }
// }

// 반응형 상태 관리
// 내부 로직으로 값의 상태 변화를 감지하고 화면에 변경된 값을 적용함
class CountController extends GetxController{
  final count = 0.obs;

  void increment(){
    // 두가지 방법
    count.value++;
    // count(count.value + 1);
  }
}