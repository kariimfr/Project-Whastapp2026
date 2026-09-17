void sapaanSaya(String nama) {
  print("First Dart, $nama");
}

void hitungNilai(double nilai) {
  if (nilai >= 90) {
    print("Nilai A");
  } else if (nilai >= 80) {
    print("Nilai B");
  } else if (nilai >= 70) {
    print("Nilai C");
  } else if (nilai >= 60) {
    print("Nilai D");
  } else {
    print("Nilai E");
  }
}

void main() {
  sapaanSaya("kariim");
  hitungNilai(70.0);
}
