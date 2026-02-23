import 'dart:io';

main() {
  print("LAMPU LALU LINTAS");
  stdout.write("Warna : ");
  var warna = stdin.readLineSync()?.toLowerCase();
  
  String arti;
  switch (warna) {
    case "merah":
      {
        arti = "Berhenti";
        break;
      }
    case "kuning":
      {
        arti = "hati-Hati";
        break;
      }
    case "hijau":
      {
        arti = "Maju";
        break;
      }
    default:
      {
        arti = "Gak ada Warna itu...!";
      }
  }
  print(warna);
  print(arti);
}