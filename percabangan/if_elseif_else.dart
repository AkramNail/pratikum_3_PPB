import 'dart:io';

void main() {
  stdout.write("Masukkan Nilai Anda : ");
  var nilai1 = stdin.readLineSync();
  int nilai2 = int.parse('$nilai1');
  if (nilai2 > 90) {
    print("Grade A ");
  } else if (nilai2 > 80) {
    print("Grade B ");
  } else if (nilai2 > 70) {
    print("Grade C ");
  } else if (nilai2 > 60) {
    print("Grade D ");
  } else {
    print("Grade E ");
  }
}