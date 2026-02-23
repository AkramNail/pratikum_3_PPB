import 'dart:io';

void main() {

  bool pertayaanJumlahBelanjaSelesai = false;
  bool pertayaanKartuSelesai = false;
  int? totalBelanja;
  bool? punyaKartu;
  int? hasil;
  var inputBelanja;
  var inputKartu;

  while (pertayaanJumlahBelanjaSelesai == false) {
    print("Masukkan Nilai Belanjaan Anda: ");
    inputBelanja = stdin.readLineSync();
    try{
      totalBelanja = int.parse('$inputBelanja');
      pertayaanJumlahBelanjaSelesai = true;
    }catch (e){
      print("nampaknya apa yang adan isi bukan angka");
      print("harap isi dengan angka");
    }
  }

  while (pertayaanKartuSelesai == false){
    print("Apakah Anda Memiliki Kartu(ya/tidak) :");
    inputKartu = stdin.readLineSync();
    if(inputKartu == "ya"){
      pertayaanKartuSelesai = true;
      punyaKartu = true;
    }else if(inputKartu == "tidak"){
      pertayaanKartuSelesai = true;
      punyaKartu = false;
    }else{
      print("Mohon jawab dengan benar");
    }
  }

  if(punyaKartu == true){
    if(totalBelanja! > 500000){
      hasil = totalBelanja - 50000; 
    }else if(totalBelanja > 100000){
      hasil = totalBelanja - 15000;
    }else{
      hasil = totalBelanja;
    }
  }else{
    if(totalBelanja! > 100000){
      hasil = totalBelanja - 5000;
    }else{
      hasil = totalBelanja;
    }
  }

  print("Anda harus bayar sekian: ${hasil}");

}