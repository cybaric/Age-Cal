//kumpulaan fungsi aja

fugsiarah(int day, int week, int month, int year) { 
    String s = ""; // return String yg ditampilkan (1 day 6 weeks ....)
    if (day == 1) {
      s = day.toString() + " Day ";
    }
    if (day > 1) {
      s = day.toString() + " Days ";
    }
    if (week == 1) {
      s = s + week.toString() + " Week ";
    }
    if (week > 1) {
      s = s + week.toString() + " Weeks ";
    }
    if (month == 1) {
      s = s + month.toString() + " Month ";
    }
    if (month > 1) {
      s = s + month.toString() + " Months ";
    }
    if (year == 1) {
      s = s + year.toString() + " Year ";
    }
    if (year > 1) {
      s = s + year.toString() + " Years ";
    }

    return s;
  }

cektgl(int tgl, int bln, int thn){
  bool b = true; // cek input tgl pd bulan (gk bsa tgl 33)
  if(tgl>funjml(bln, thn)){
    b = false;
  }
  return b;
}

isInteger(String thni, String blni, String tgli) {
    bool x = true; // validasi agar selalu bntuk int
    try {
      int.parse(thni);
    } catch (e) {
      x = false;
    }
    try {
      int.parse(blni);
    } catch (e) {
      x = false;
    }
    try {
      int.parse(tgli);
    } catch (e) {
      x = false;
    }
    return x;
  }

int cek(text) {
  int d; // catch karakter (, . - " ")
  try {
    d = int.parse(text);
  } catch (e) {
    d = 0;
  }
  return d;
}

int nohari(String s) { // untuk mencari nama hari pd fungsi hrmaju/hrmundur
  
  if (s == "Sunday") { // digunakan pd interval (bkn now)
    return 0;
  }
  if (s == "Monday") {
    return 1;
  }
  if (s == "Tuesday") {
    return 2;
  }
  if (s == "Wednesday") {
    return 3;
  }
  if (s == "Thursday") {
    return 4;
  }
  if (s == "Friday") {
    return 5;
  }
  if (s == "Saturday") {
    return 6;
  }
  return 100;
  
}

String namaharimaju(int h, int ttl) { // digunakan pd interval (bkn now)
  // mencari nama hari dr ttl (maju)
  int jml = (h) + (ttl % 7);

  while (jml >= 7) {
    jml = jml % 7;
  }
  if (jml == 0) {
    return "Sunday";
  }
  if ((jml == 1) || (jml == -6)) {
    return "Monday";
  }
  if ((jml == 2) || (jml == -5)) {
    return "Tuesday";
  }
  if ((jml == 3) || (jml == -4)) {
    return "Wednesday";
  }
  if ((jml == 4) || (jml == -3)) {
    return "Thursday";
  }
  if ((jml == 5) || (jml == -2)) {
    return "Friday";
  }
  if ((jml == 6) || (jml == -1)) {
    return "Saturday";
  }
  return "error";
}

String namaharimundur(int h, int ttl) { // digunakan pd interval (bkn now)
  // mencari nama hari dr ttl (mundur)
  var jml = (h) - (ttl % 7);
  while (jml >= 7) {
    jml = jml % 7;
  }
  if (jml == 0) {
    return 'Sunday';
  }
  if ((jml == 1) || (jml == -6)) {
    return 'Monday';
  }
  if ((jml == 2) || (jml == -5)) {
    return 'Tuesday';
  }
  if ((jml == 3) || (jml == -4)) {
    return 'Wednesday';
  }
  if ((jml == 4) || (jml == -3)) {
    return 'Thursday';
  }
  if ((jml == 5) || (jml == -2)) {
    return 'Friday';
  }
  if ((jml == 6) || (jml == -1)) {
    return 'Saturday';
  }
  return 'error';
}

int funjml(int bulan, int tahun) {
  // 7, 2021
  // mereturn jml hari dari bln pd thn tsb
  if (bulan == 0) {
    return 31;
  }
  if (bulan == 1) {
    return 31;
  }
  if (bulan == 2) {
    if (tahun % 100 == 0) {
      if (tahun % 400 == 0) {
        return 29;
      }
      return 28;
    }
    if (tahun % 4 == 0) {
      return 29;
    }
    return 28;
  }
  if (bulan == 3) {
    return 31;
  }
  if (bulan == 4) {
    return 30;
  }
  if (bulan == 5) {
    return 31;
  }
  if (bulan == 6) {
    return 30;
  }
  if (bulan == 7) {
    return 31;
  }
  if (bulan == 8) {
    return 31;
  }
  if (bulan == 9) {
    return 30;
  }
  if (bulan == 10) {
    return 31;
  }
  if (bulan == 11) {
    return 30;
  }
  if (bulan == 12) {
    return 31;
  }
  return 0;
}
