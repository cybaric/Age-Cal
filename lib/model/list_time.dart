import 'package:age_cal/model/funngsi.dart';

  // mencari selisih waktu (dlm thn, bln, dan hari)
  // membutuhkan 6 input (tgl, bln, thn)awal dan  (tgls, blns, thns)akhir
  // hasilnya berupa list [ htgl, hbln, hthn], (contoh [25 hari, 3 bulan, 1 tahun ])

List<int> lengkap(
      int tgls, int blns, int thns, int tgl, int bln, int thn) {
    var hasil = <int>[0, 0, 0];
    var hTgl = 0;
    var hBln = 0;
    var hThn = 0;
    if (tgls < tgl) {
      var J = funjml(blns - 1, thns);

      hTgl = tgls + J - tgl;
      blns = blns - 1;
      if (blns < bln) {
        thns = thns - 1;
        hBln = 12 + blns - bln;
        hThn = thns - thn;
        hasil[0] = hTgl;
        hasil[1] = hBln;
        hasil[2] = hThn;
        return hasil;
      }
      hBln = blns - bln;
      hThn = thns - thn;
      hasil[0] = hTgl;
      hasil[1] = hBln;
      hasil[2] = hThn;
      return hasil;
    }
    hTgl = tgls - tgl;
    if (blns < bln) {
      thns = thns - 1;
      hBln = 12 + blns - bln;
      hThn = thns - thn;
      hasil[0] = hTgl;
      hasil[1] = hBln;
      hasil[2] = hThn;
      return hasil;
    }
    hBln = blns - bln;
    hThn = thns - thn;
    hasil[0] = hTgl;
    hasil[1] = hBln;
    hasil[2] = hThn;
    return hasil;
  }

