import 'dart:io';

void main(){
  print("Masukan anak ayam: ");
  var inputAnakAyam = stdin.readLineSync();
  int hasilAnakAyam = int.parse('$inputAnakAyam');

  print("Anak ayam turun ${hasilAnakAyam}");
  for(int i = hasilAnakAyam; i > 0; i--){
    if(i != 1){
      print("Anak ayam turun ${i}, mati satu tinggal ${i-1}");
    }else{
      print("Anak ayam turun ${i}, mati satu tinggal induknya");
    }
  }

}