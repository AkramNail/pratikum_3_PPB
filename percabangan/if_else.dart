import 'dart:io';

void main() {
  stdout.write("Masukkan Nilai Anda : ");
  var nilai1 = stdin.readLineSync();
  int nilai2 = int.parse('$nilai1');
  if (nilai2 > 70) {
    print("Anda Lulus ");
  } else {
    print("Anda Gagal ");
  }
}