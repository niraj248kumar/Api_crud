// import 'dart:io';
// import 'dart:math';
//
// // void main(){
// //   var word = "Edugaon";
// //   var sum = "";
// //   for(int a =0; a<= word.length-1; a++){
// //     for(int b = 0; b<=a; b++){
// //       stdout.write(word[b]);
// //
// //     }
// //     stdout.writeln();
// //   }
// // }
// // void main(){
// //   var word = "Edugaon";
// //   var sum = "";
// //   for(int a = 0; a <= word.length-1; a++){
// //     sum = sum+word[a];
// //     // stdout.writeln(sum);
// //     print(sum);
// //   }
// //
// // }
// void main(){
//   List<dynamic> list1 = [1,2,3,4,5];
//   List<dynamic> list2 = [6,7,8,9];
//   // list1.forEach((element) {
//     list2 = list2+list1;
//
//
//   // },);
//   print(list2);
// }

// void main(){
//   var a=100;
//  do{
//    var p =0;
//    int b =1;
//    do{
//      if(a%b ==0){
//        p++;
//      }
//      b++;
//    }
//    while( b<=a);
//    if(p<=2){
//      print("$a is prime");
//    }
//    else{
//      print("$a is not prime");
//    }
//    a--;
//   } while(a>=90);
// }

// Descending

// void main(){
//   List  list =[1,8,4,7,6,2,5];
//   int a=0;
//   while( a<list.length){
//     int b=0;
//     while( b<list.length){
//       if(list[a]> list[b]){
//         var c  = list[a];
//         list[a] = list[b];
//         list[b] =c;
//       }
//       b++;
//     }
//     a++;
//   }
//   print(list);
// }

// void main(){
//   List  list =[0,-1,8,4,7,6,52,5];
//   var max = list[0];
//   int a=0;
//   while( a<list.length){
//   if(list[a]< max){
//     max = list[a];
//   }
//     a++;
//   }
//   print(max);
//
// }
import 'dart:io';

// void main() {
//   var list = "NirajKumar";
//   // var max = list[0];
//   for (int a = 0; a <= list.length-1; a++) {
//     for (int b = 0; b <=a; b++) {
//       stdout.write(list[b]);
//     }
//     stdout.writeln();
//   }
// }
// void main() {
//   var a =171;
//   var p=0;
//   var b=a;
//   while(b >0){
//     if(a%b ==0){
//       p++;
//     }
//     b--;
//   }
//   if(p<=2){
//     print("$a is prime");
//   }
//   else{
//     print("$a is not prime");
//   }
//
// }
   ///ArmStrong number
// void main(){
//   var num = 15;
//   var sum = 0;
//   var loopNum = num;
//   while(loopNum!=0){
//     var r =loopNum%10;
//     var rm  = r*r*r;
//     sum = sum+rm;
//     loopNum = loopNum~/10;
//
//   }
//   if(sum == num){
//     print("$num is armstrong number");
//   }
//   else{
//     print("$num is not armstrong number");
//
// }}

//
// void main(){
//   var num =41;
//   var result = 0;
//   var org = num;
//   while(org!=0){
//     var rem = org%10;
//     result = result*10+rem;
//     org = org~/10;
//   }
//   if(result == num){
//    print("$num is Palindrome");
//   }
//   else{
//     print("$num is not Palindrome");
//   }
// }

// for Loop
import 'dart:io';
import 'dart:math';

void main() {
  print("Hello world");
  //Table 10
  for (int a = 1; a <= 10; a++) {
    print(a);
  }
  // Table 20
  for (int a = 1; a <= 10; a++) {
    for (int b = 1; b <= 20; b++) {
      var c = a * b;
      stdout.write("$c\t");
    }
    stdout.writeln();
  }

  // Even Odd
  for (int a = 1; a <= 10; a++) {
    if (a % 2 == 0) {
      print("$a is Even");
    } else {
      print("$a is odd");
    }
  }
  // prime / Not prime
  for (int a = 1; a <= 10; a++) {
    var count = 0;
    for (int b = 1; b <= 20; b++) {
      if (a % b == 0) {
        count++;
      }
    }
    if (count <= 2) {
      print("$a is prime");
    } else {
      print("$a is not prime");
    }
  }

  // facter
  for (int a = 1; a <= 10; a++) {
    var facter = 1;
    for (int b = 1; b <= a; b++) {
      facter = facter * b;
    }
    print("$a = $facter");
  }

  //ascending Order
  List<int> list4 = [15, 45, 78, 2, 1, 96, 57];
  for (int a = 0; a < list4.length; a++) {
    for (int b = a; b < list4.length; b++) {
      if (list4[a] > list4[b]) {
        var temp = list4[a];
        list4[a] = list4[b];
        list4[b] = temp;
      }
    }
  }
  print("$list4");
  //Descending Order
  List<int> small = [15, 45, 78, 2, 1, 96, 57];
  for (int a = 0; a < small.length; a++) {
    for (int b = a; b < small.length; b++) {
      if (small[a] < small[b]) {
        var temp = small[a];
        small[a] = small[b];
        small[b] = temp;
      }
    }
  }
  print("$small");

  // Maximum number
  List<int> numbers = [15, 45, 78, 2, 1, 96, 57];
  var max = numbers[0];
  for (int a = 0; a < numbers.length; a++) {
    if (numbers[a] > max) {
      max = numbers[a];
    }
  }
  print(max);
  // Minimum number
  List<int> number = [15, 45, 78, 2, 1, 96, 57];
  var min = number[0];
  for (int a = 0; a < number.length; a++) {
    if (number[a] < min) {
      min = number[a];
    }
  }
  print(min);

  // second largest number
  List<int> largest = [15, 45, 78, 2, 1, 96, 57];
  for (int a = 0; a < largest.length; a++) {
    for (int b = a; b < largest.length; b++) {
      if (largest[a] > largest[b]) {
        var temp = largest[a];
        largest[a] = largest[b];
        largest[b] = temp;
      }
    }
  }
  print("Second largest number ${largest[largest.length - 2]}");
  // //Descending Order second small number
  List<int> SecondSmall = [15, 45, 78, 2, 1, 96, 57];
  for (int a = 0; a < SecondSmall.length; a++) {
    for (int b = a; b < SecondSmall.length; b++) {
      if (SecondSmall[a] < SecondSmall[b]) {
        var temp = SecondSmall[a];
        SecondSmall[a] = SecondSmall[b];
        SecondSmall[b] = temp;
      }
    }
  }
  print("Second Small number${SecondSmall[SecondSmall.length - 2]}");

  // Armstrong Number
  var v =153;
  var num = v;
  var numm = v;
  var result = 0;
  var digit = 0;
  while (numm != 0) {
    digit++;
    numm = numm~/ 10;
  }
  while (num != 0) {
    var rem = num % 10;
    result = result + pow(rem, digit) as int;
    num= num ~/ 10;
  }
  if (result == v) {
    print("$v has Armstrong");
  }

  // palindrome
  for(int s =1; s<=100; s++){
    var num =s;
    var org = num;
    var result =0;

    while(num != 0){
      var rem = num%10;
      result = result *10+rem;
      num = num ~/10;
    }
    if(org == result){
      print("$s is palindrome");
    }
  }

  // Armstrong use List
  var list1 = [150, 153, 1521, 78, 785, 622];
  for (int a in list1) {
    var num = a;
    var numm = a;
    var result = 0;
    var digit = 0;
    while (num != 0) {
      digit++;
      num = num ~/ 10;
    }

    while (numm != 0) {
      var rem = numm % 10;
      result = result + pow(rem, digit).toInt();
      numm = numm ~/ 10;
    }
    if (result == a) {
      print("$a is Armstrong");
    } else {
      print("$a is not Armstrong");
    }
  }
  // palindrome Use List
  var list2 = [144, 55, 87, 78, 88, 22];
  for (int a in list2) {
    var num = a;
    var result = 0;
    while (num != 0) {
      var rem = num % 10;
      result = result * 10 + rem;
      num = num ~/ 10;
      if (result == num) {
        print("$a has palindrome ");
      }
    }
  }

// check palindrome or prime ya not prime
  var list3 = [1,2,144, 55, 87, 78, 88, 22];
  for (int a in list3) {
    var num = a;
    var result = 0;
    while (num != 0) {
      var rem = num % 10;
      result = result * 10 + rem;
      num = num ~/ 10;

      if (result == a) {
        var prime =0;
        for(int b =1; b<=a; b++){
          if(a%b==0){
            prime++;
          }
        }
        if(prime<=2){
          print("$a is prime");
        }else{
          print("$a is not prime");
        }
      }
    }
  }

  // check palindrome or prime ya not prime
  var list = [1,2,144,153, 55, 87, 78, 88, 22];
  for (int a in list) {
    var num = a;
    var result = 0;
    var digit =0;
    var numm =a;
    while(numm !=0){
      digit++;
      numm = numm ~/10;
    }
    while (num != 0) {
      var rem = num % 10;
      result = result +pow(rem, digit).toInt();
      num = num ~/ 10;
      if (result == a) {
        var prime =0;
        for(int b =1; b<=a; b++){
          if(a%b==0){
            prime++;
          }
        }
        if(prime<=2){
          print("$a is prime");
        }
        print("$a is Armstrong");
      }
    }
  }
}



