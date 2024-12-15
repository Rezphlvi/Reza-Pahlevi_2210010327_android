class Gaji {
  String? golongan;
  String? status;
  int masaKerja = 0;

  void setGolongan(String? gol) {
    golongan = gol;
  }

  void setStatus(String? sts) {
    status = sts;
  }

  void setMasaKerja(int masa) {
    masaKerja = masa;
  }

  int tunjGapok() {
    int tunjangan = 0;
    if (golongan == "I") {
      tunjangan = 2500000;
    } else if (golongan == "II") {
      tunjangan = 3000000;
    } else if (golongan == "III") {
      tunjangan = 3500000;
    } else {
      tunjangan = 4000000;
    }
    return tunjangan;
  }

  int tunjStatus() {
    int tunjangan = 0;
    if (status == "Menikah") {
      tunjangan = 1000000;
    } else {
      tunjangan = 500000;
    }
    return tunjangan;
  }

  int tunjMasaKerja() {
    int tunjangan = 0;
    if (masaKerja > 0 && masaKerja <= 3) {
      tunjangan = 1000000;
    } else if (masaKerja > 3 && masaKerja <= 6) {
      tunjangan = 1500000;
    } else {
      tunjangan = 2000000;
    }
    return tunjangan;
  }

  int gajiTotal() {
    return tunjGapok() + tunjStatus() + tunjMasaKerja();
  }
}