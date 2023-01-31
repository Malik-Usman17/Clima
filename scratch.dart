import "dart:io";

void main() {
  performTasks();
}


// void performTasks(){
//   task1();
//   //task2();
//   String? task2Result = task2();
//   task3(task2Result);
// }

void performTasks() async {
  task1();
  String? task2Result = await task2();
  task3(task2Result);
}

void task1(){
  //String result = 'task 1 data';
  print('Task 1 completed');
}

// void task2(){
//   String result = 'task 2 data';
//   Duration threeSeconds = const Duration(seconds: 3);
//   sleep(threeSeconds);
//   print('Task 2 completed');
// }

// void task2(){
//   Duration threeSeconds = const Duration(seconds: 3);
//   Future.delayed(threeSeconds, () {
//     String result = 'task 2 data';
//     print('Task 2 completed');
//   });
// }

// String? task2(){
//   Duration threeSeconds = const Duration(seconds: 3);
//   String? result;
//
//   Future.delayed(threeSeconds, () {
//     result = 'task 2 data';
//     print('Task 2 completed');
//   });
//
//   return result;
// }

Future task2() async {
  Duration threeSeconds = const Duration(seconds: 3);
  String? result;

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 completed');
  });

  return result;
}


void task3(String? task){
  String result = 'task 3 data';
  print('Task 3 completed with $task');
}