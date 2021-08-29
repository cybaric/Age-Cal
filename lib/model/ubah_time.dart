import 'package:age_cal/model/funngsi.dart';
 // mengubah ke total hari ke total minggu + sisa hari

List<int> totalHariMaju(int hTgl, int hBln, int hThn, int bln, int thn) {
    var result = <int>[0, 0, 0, 0];
    var jbln = hBln + 12 * hThn; // mengubah tahun dan bulan, ke jml bulan
    var jhri = ubahMaju(bln, jbln, thn); // mengubah jml bulan ke hari maju (hanya dari selisih)
    var hrTotal = (hTgl + jhri); // jumlah hari total (selisih + tgl)
    var mngu = ((hTgl + jhri) / 7).floor(); // kovert ke jml minggu + sisa hr
    var sisa = (hTgl + jhri) % 7;
    result[0] = hrTotal; // jml hari dari konversi bln & thn
    result[1] = mngu; // jml konversi minggu
    result[2] = sisa; // sisa pembagian dgn 7
    result[3] = jhri; // konversi hari seluruhnya
    return result;
  }

  int ubahMaju(int blns, int jmlhbln, int thns) {
    // mengubah bulan ke hari (maju)
    var hr = 0;
    while (jmlhbln > 0) {
      hr = hr + funjml(blns, thns);
      blns++;
      jmlhbln--;
      while (blns > 12) {
        blns = blns - 12;
        thns++;
      }
    }
    return hr; // return String nama hari
  }

  int ubahMundur (int blns, int jmlbln, int thns) {
        // mengubah bulan ke hari (mundur)
        int hr = 0;
        while (jmlbln > 0) {
            hr = hr + funjml(blns-1, thns);
            blns--;
            jmlbln--;
            while (blns <= 0) {
                blns = blns + 12;
                thns--;
            }
        }
        return hr; // return String nama hari
    }

  