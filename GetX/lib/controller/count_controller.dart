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
  // life cycle - init
  @override
  void onInit() {
    super.onInit();
    // Worker
    // 반응형 상태 값의 변화가 발생하였을 때, 이를 감지하고 특정 콜백 함수를 호출할 수 있도록 해줌
    // Worker는 컨트롤러 혹은 클래스가 생성될 때만 사용할 수 있음(onInit, initState 안에서 정의해야함)
    ever(count, (_) => print('called every update')); // 반응형 상태값이 변경될 때마다 호출됨
    once(count, (_) => print('called once')); // 반응형 상태값이 최초로 변경될 때 한 번만 호출됨
    debounce(count, (_) => print('called after 1 second after last change'), time: const Duration(seconds: 1)); // 마지막 변경 이후 특정 시간동안 변경이 없으면 호출됨
    interval(count, (_)=> print('called every second during the value is changed'), time: const Duration(seconds: 1));  // 반응형 상태값이 변경되는 동안, 일정 간격으로 호출됨
  }

  // life cycle - init
  @override
  void onClose() {
    super.onClose();
  }

  final count = 0.obs;

  void increment(){
    // Get.isRegistered
    // 사용하고자 하는 컨트롤러가 등록되어 있는지 확인할 수 있음
    print(Get.isRegistered<CountController>());

    // 두가지 방법
    count.value++;
    // count(count.value + 1);
  }
}