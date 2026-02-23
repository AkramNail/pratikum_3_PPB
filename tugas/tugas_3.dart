
import 'dart:io';

class Buku {
  String id;
  String judul;
  String penerbit;
  int stock;

  Buku(this.id, this.judul, this.penerbit, this.stock);
}

class Mahasiswa{
  String nim;
  String nama;

  Mahasiswa(this.nim, this.nama);
}

class Peminjaman{
  String nim;
  String nama;
  String id;
  String judul;

  Peminjaman(this.nim, this.nama, this.id, this.judul);
}

bool menambahDataBuku(List<Buku> listBuku, String judul, String penerbit, int stock){
    
  var id = "001";

  if(!listBuku.isEmpty){
    for(var buku in listBuku) {
      if(buku.judul == judul) {
        print("Judul buku tersebut sudah ada harap isi yang lain");
        return false;
      } 
    };

    //perhitungan untuk id
    id = listBuku[listBuku.length - 1].id;
    var nilaiId = int.parse('$id') + 1;
    id = int.parse('$id').toString();
    switch (id.length){
      case 1:
        id = "00${nilaiId}";
      break;
      case 2:
        id = "0${nilaiId}";
      break;
      default:
        id = nilaiId.toString();
      break;
    }
  }else{
    id = "001";
  }
  if(stock < 2){
    print("Mohon maaf buku harus memiliki minimal 2 stock");
    return false;
  }

  listBuku.add(new Buku(id, judul, penerbit, stock));
  return true;
}

void menuTambahDataBuku(List<Buku> listBuku){

  bool isTambahBukuSukses = false;

  while (isTambahBukuSukses == false){
    var judul;
    var penerbit;
    var stock;

    print("Masukan judul buku: ");
    judul = stdin.readLineSync();
    if(judul.isEmpty){
      print("Mohon maaf judul buku tidak bisa kosong");
      continue;
    }

    print("Masukan penerbit buku: ");
    penerbit = stdin.readLineSync();
    if(penerbit.isEmpty){
      print("Mohon maaf penerbit buku tidak bisa kosong");
      continue;
    }

    print("Masukan stock buku: ");
    stock = stdin.readLineSync();
    if(stock.isEmpty){
      print("Mohon maaf stock buku tidak bisa kosong");
      continue;
    }
  
    try{
      int hasilStock = int.parse('$stock');
      isTambahBukuSukses = menambahDataBuku(listBuku, judul, penerbit, hasilStock);
      continue;
    } catch (e){
      print("Mohon isi stock dengan angka");
      continue;
    }
  }
}

bool menambahDataMahasiswa(List<Mahasiswa> listMahasiswa, String nim,String nama){

  for(var mahasiswa in listMahasiswa) {
    if(mahasiswa.nim == nim){
      print("mohon maaf nim yang ada masukan sudah dipakai");
      return false;
    }
    if(mahasiswa.nama == nama){
      print("mohon maaf nama tidak bisa sama");
      return false;
    }
  }
  
  try{
    int hasilNim = int.parse('$nim');
  }catch (e){
    print("nampaknya anda tidak memasukan angka di nim");
    print("harap masukan nim sebagai angka");
    return false;
  }

  listMahasiswa.add(new Mahasiswa(nim, nama));
  return true;
}

void menuTambahDataMahasiswa(List<Mahasiswa> listMahasiswa){
  var nim;
  var nama;
  bool isTambahMahasiswaSukses = false;

  while(isTambahMahasiswaSukses == false){

    print("Masukan nim mahasiswa: ");
    nim = stdin.readLineSync();
    if(nim.isEmpty){
      print("Mohon maaf nim mahasiswa tidak bisa kosong");
      continue;
    }

    print("Masukan nama mahasiswa: ");
    nama = stdin.readLineSync();
    if(nama.isEmpty){
      print("Mohon maaf nama mahasiswa tidak bisa kosong");
      continue;
    }

    isTambahMahasiswaSukses = menambahDataMahasiswa(listMahasiswa, nim, nama);
  }

}

bool menambahDataPeminjam(List<Peminjaman> listPeminjaman, Buku buku, Mahasiswa mahasiswa){

  int jumlahBukuYangDipinjam = 0;
  bool isBukuSudahDipinjam = false;
  for(var peminjam in listPeminjaman){
    if(peminjam.nim == mahasiswa.nim){
      jumlahBukuYangDipinjam += 1;
      if(peminjam.judul == buku.judul){
        isBukuSudahDipinjam = true;
      }
    }
  }

  //cek buku sudah dipinjam
  if(isBukuSudahDipinjam == true){
    print("mohon maaf buku ini sudah dipinjam oleh mahasiswa yang sama");
    return false;
  }

  //cek maksimal jumlah pinjam
  if(jumlahBukuYangDipinjam >= 2){
    print("mohon maaf kouta peminjaman buku mahsiswa tersebut sudah mencapai jumlah maksimal");
    return false;
  }

  //cek buku ada stock atau enggak
  if(buku.stock == 1){
    print("mohon maaf buku ini tidak bisa dipinjam karena stocknya terbatas");
    return false;
  }

  listPeminjaman.add(new Peminjaman(mahasiswa.nim, mahasiswa.nama, buku.id, buku.judul));
  return true;

}

void menuTambahDataPeminjam(List<Peminjaman> listPeminjaman, List<Buku> listBuku, List<Mahasiswa> listMahasiswa){

  Buku buku;
  Mahasiswa mahasiswa;
  bool isTambahPeminjamSukses = false;

  if(listBuku.isEmpty){
    print("mohon tambahkan data buku terlebih dahulu");
    return;
  }
  if(listMahasiswa.isEmpty){
    print("mohon tambahkan data mahasiswa terlebih dahulu");
    return;
  }

  while(isTambahPeminjamSukses == false){

    //data mahasiswa
    int indexMahasiswa = 0;
    listMahasiswa.forEach((mahasiswaDiList){
      indexMahasiswa += 1;
      print("${indexMahasiswa}.Nama mahasiswa: ${mahasiswaDiList.nama}");
    });
    print("masukan nomer urut dari data mahasiswa diatas: ");
    var inputNomerMahasiswa = stdin.readLineSync();
    try{
      int hasilNomerMahasiswa = int.parse('$inputNomerMahasiswa');
      mahasiswa = listMahasiswa[hasilNomerMahasiswa - 1];
    }catch (e){
      print("mohon masukan nomer urut dengan benar");
      continue;
    }
    
    //data buku
    int indexBuku = 0;
    listBuku.forEach((bukuDiList){
      indexBuku += 1;
      print("${indexBuku}.Judul buku: ${bukuDiList.judul}");
    });
    print("masukan nomer urut dari data buku diatas: ");
    var inputNomerBuku = stdin.readLineSync();
    try{
      int hasilNomerBuku = int.parse('$inputNomerBuku');
      buku = listBuku[hasilNomerBuku - 1];
    }catch (e){
      print("mohon masukan nomer urut dengan benar");
      continue;
    }

    //resolt
    isTambahPeminjamSukses = menambahDataPeminjam(listPeminjaman, buku, mahasiswa);
  }
  
}

void mengembalikanBuku(List<Peminjaman> listPeminjaman, Buku buku, Mahasiswa mahasiswa){
  int index = 0;
  int indexHasil = 0;
  listPeminjaman.forEach((data){
    if(data.id == buku.id && data.nim == mahasiswa.nim){
      indexHasil = index;
    }
    index++;
  });
  listPeminjaman.removeAt(indexHasil);
}

void menuMengembalikanBuku(List<Peminjaman> listPeminjaman, List<Buku> listBuku, List<Mahasiswa> listMahasiswa){

  Mahasiswa mahasiswa;
  Buku buku;
  Peminjaman peminjaman;

  //Cek ada data peminjam atau tidak
  if(listPeminjaman.isEmpty){
    print("mohon maaf belum ada buku yang dipinjam");
    return;
  }

  //menampilkan data mahasiswa
  int indexMahasiswa = 0;
  listMahasiswa.forEach((mahasiswa){
    indexMahasiswa += 1;
    print("${indexMahasiswa}.Dengan nama: ${mahasiswa.nama}");
  });
  //memilih data mahasiswa
  print("pilih nomer dari nama mahasiswa, yang ingin menyimpan buku");
  var nomerMahasiswa = stdin.readLineSync();
  int hasilNomerMahasiswa = 0;
  try{
    hasilNomerMahasiswa = int.parse('$nomerMahasiswa');
  }catch (e){
    print("mohon isi nomber dengan benar");
    return;
  }
  //menyimpan data tersebut di variabel
  mahasiswa = listMahasiswa[hasilNomerMahasiswa - 1];

  //menampilkan buku yang dipinjam mahasiswa tersebut
  List<int> listIndexBukuYangDipinjam = [];
  bool isKetemuDataPeminjaman = false;
  int nomor = 0;
  int indexBuku = 0;
  listPeminjaman.forEach((data){
    if(data.nim == mahasiswa.nim){
      nomor += 1;
      print("${nomor}.Judul Buku: ${data.judul}");
      listIndexBukuYangDipinjam.add(indexBuku);
      isKetemuDataPeminjaman = true;
    }
    indexBuku += 1;
  });

  //memberikan informasi apabila mahasiswa tersebut belum meminjam buku
  if(isKetemuDataPeminjaman == false){
    print("nampaknya mahasiswa tersebut belum pernah meminjam buku coba cek mahasiswa lain");
    return;
  }

  //Memilih buku
  print("pilih nomor buku yang akan dikembalikan");
  var nomerBuku = stdin.readLineSync();
  int hasilNomerBuku = 0;
  try{
    hasilNomerBuku = int.parse('$nomerBuku');
  }catch (e){
    print("mohon isi nomber dengan benar");
    return;
  }

  //menyimpan data buku
  peminjaman = listPeminjaman[listIndexBukuYangDipinjam[hasilNomerBuku - 1]];
  listBuku.forEach((element){
    if(element.id == peminjaman.id){
      buku = element;
      //menghapus data peminjam
      mengembalikanBuku(listPeminjaman, buku, mahasiswa);
    }
  });

}

void menuMenampilkanListMahasiswa(List<Mahasiswa> listMahasiswa){
  int index = 0;
  listMahasiswa.forEach((Mahasiswa){
    
    index++;

    String nomor = "$index.".padLeft(3);
    String nama = "nama".padRight(6);
    String nim = "NIM".padRight(6);

    print("$nomor$nama: ${Mahasiswa.nama}");
    print("   $nim: ${Mahasiswa.nim}");

  });
  if(index == 0){
    print("sepertinya belum ada data mahasiswa harap tambah data mahasiswa terlebih dahulu");
  }
}

void menuMenampilkanListBuku(List<Buku> listBuku){
  int index = 0;
  listBuku.forEach((buku){
    
    index++;
    
    String nomor = "$index.".padLeft(3);
    String id = "id".padRight(12);
    String judul = "judul".padRight(12);
    String penerbit = "penerbit".padRight(12);
    String stock = "stock".padRight(12);

    print("$nomor$id: ${buku.id}");
    print("   $judul: ${buku.judul}");
    print("   $penerbit: ${buku.penerbit}");
    print("   $stock: ${buku.stock}");

  });
  if(index == 0){
    print("sepertinya belum ada data buku harap tambah data buku terlebih dahulu");
  }
}

void menuMenampilkanListPeminjam(List<Peminjaman> listPeminjaman){
  int index = 0;

  listPeminjaman.forEach((peminjam){
  
    index++;

    String nomor = "$index.".padLeft(3);
    String nim = "nim".padRight(12);
    String nama = "nama".padRight(12);
    String id = "id".padRight(12);
    String judul = "judul".padRight(12);

    print("$nomor$nim: ${peminjam.nim}");
    print("   $nama: ${peminjam.nama}");
    print("   $id: ${peminjam.id}");
    print("   $judul: ${peminjam.judul}");
  });
  if(index == 0){
    print("sepertinya belum ada data peminjaman harap tambah data peminjaman terlebih dahulu");
  }
}

bool menampilkanDaftarMenu(List<Peminjaman> listPeminjaman, List<Mahasiswa> listMahasiswa, List<Buku> listBuku){

  print("=========================================");
  print("Berikut daftar menu yang dapat digunakan");
  print("1. Menampilkan list peminjam");
  print("2. Menampilkan list mahsiswa");
  print("3. Menampilkan list buku");
  print("4. Tambah data peminjam");
  print("5. Tambah data mahasiswa");
  print("6. Tambah data buku");
  print("7. Mengembalikan buku");
  print("8. Keluar");


  print("Masuk nomor dari menu yanga ingin anda gunakan: ");

  var pilihan = stdin.readLineSync();
  int hasilPilihan;

  try{
    hasilPilihan = int.parse('$pilihan');
  } catch(e){
    return false;
  }

  switch (hasilPilihan){

    case(1):
      menuMenampilkanListPeminjam(listPeminjaman);
    break;
    case(2):
      menuMenampilkanListMahasiswa(listMahasiswa);
    break;
    case(3):
      menuMenampilkanListBuku(listBuku);
    break;
    case(4):
      menuTambahDataPeminjam(listPeminjaman, listBuku, listMahasiswa);
    break;
    case(5):
      menuTambahDataMahasiswa(listMahasiswa);
    break;
    case(6):
      menuTambahDataBuku(listBuku);
    break;
    case(7):
      menuMengembalikanBuku(listPeminjaman, listBuku, listMahasiswa);
    break;
    case(8):
      return true;

    default:
      print("tolong pilih nomber yang benar");
    return false;
    
  }

  return false;

}

void main(){
  
  /*
  List<Buku> listBuku = [
    new Buku("001", "RTX", "Yanto", 15),
    new Buku("002", "Death man", "Asep", 16),
    new Buku("003", "Life in GTA", "Si imut", 15),
  ];
  List<Mahasiswa> listMahasiswa = [
    new Mahasiswa("01389", "si imut"),
    new Mahasiswa("01380", "Dustin"),
  ];
  List<Peminjaman> listPeminjaman = [
    new Peminjaman("01380", "Dustin", "003", "Life in GTA"),
    new Peminjaman("01389", "si imut", "002", "Death man"),
    new Peminjaman("01380", "Dustin", "001", "RTX"),
  ];
  */

  bool isNotStillInMenu = false;
  List<Buku> listBuku = [];
  List<Mahasiswa> listMahasiswa = [];
  List<Peminjaman> listPeminjaman = [];

  while(isNotStillInMenu == false){
    isNotStillInMenu = menampilkanDaftarMenu(listPeminjaman, listMahasiswa, listBuku);
  }
}