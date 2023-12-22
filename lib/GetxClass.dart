import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetXClass extends GetxController {
  static SharedPreferences? prefs;
  static RxInt index = 0.obs;
  static RxList status = [].obs;
  static RxString answer = "".obs;
  static RxInt skipTimer = 0.obs;

  static List<String> hints = [
    "10",
    "25",
    "6",
    "14",
    "128",
    "7",
    "50",
    "1025",
    "100",
    "3",
    "212",
    "3011",
    "14",
    "16",
    "1",
    "2",
    "44",
    "45",
    "625",
    "1",
    "13",
    "47",
  ];
  static List<String> finalAnswer = [
    "Sum,5+5=10",
    "multiplication",
    "multiply by the previous digit",
    "You have to count the number of squares",
    "Digit square multiplied by 2",
    "Difference between numbers is an increasing multiple of 5",
    "Apply BODMAS",
    "the first digit is the sum of two digits, the second digit is the multiplication of two digits.",
    "(1+1)*(1+1)=4",
    "Each digit is the diagonal sum of the two numbers",
    "First digit is the subtraction of given numbers the second number is the addition on numbers",
    "the first digit is the multiplication of given numbers",
    "Apply Bodmas",
    "Left most digit is Square of the division of bottom number",
    "each row sum is increased by 5",
    "difference of two number is increasing multiple of 5",
    "subtract the second digit from reverse of two digits",
    "21-12=9",
    "first box contains square of 1 2 3 4 5",
    "The sum two numbers give the next number in upper or lower line like",
    "Count the number of triangles",
    "A*B+(B-1)",
  ];

  Future<void> getPrefrence() async {
    prefs = await SharedPreferences.getInstance();
    index.value = prefs!.getInt('level') ?? 0;
    setStatus();
  }

  void setStatus() {
    status.value = [];
    for (int i = 0; i <= 74; i++) {
      status.add(prefs!.getString("$i") ?? "panding");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPrefrence();
  }


}
