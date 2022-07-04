import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/services/perfs_service.dart';

import '../../models/openCardDetail_model.dart';

class HomeProvider extends ChangeNotifier {
  String? lastOpenDataPasien;
  String? lastOpenDataDokterPerawat;
  String? lastOpenDataRawatJalan;

  HomeProvider() {
    getChoseCard();
  }

  actionChoseCardPasien() {
    lastOpenDataPasien = 'Dibuka pada ${formatDate(DateTime.now(), [
          dd,
          ' ',
          MM,
          ' ',
          yyyy,
          ' '
        ])}';
    UserPreferences().saveOpenCardDetail(lastOpenDataPasien ?? '...',
        lastOpenDataDokterPerawat ?? '...', lastOpenDataRawatJalan ?? '...');
    notifyListeners();
  }

  actionChoseCardRawat() {
    lastOpenDataRawatJalan = 'Dibuka pada ${formatDate(DateTime.now(), [
          dd,
          ' ',
          MM,
          ' ',
          yyyy,
          ' '
        ])}';
    UserPreferences().saveOpenCardDetail(lastOpenDataPasien ?? '...',
        lastOpenDataDokterPerawat ?? '...', lastOpenDataRawatJalan ?? '...');
    notifyListeners();
  }

  actionChoseCardDokter() {
    lastOpenDataDokterPerawat = 'Dibuka pada ${formatDate(DateTime.now(), [
          dd,
          ' ',
          MM,
          ' ',
          yyyy,
          ' '
        ])}';
    UserPreferences().saveOpenCardDetail(lastOpenDataPasien ?? '...',
        lastOpenDataDokterPerawat ?? '...', lastOpenDataRawatJalan ?? '...');
    notifyListeners();
  }

  getChoseCard() async {
    OpenCardDetail putStorage = await (UserPreferences().getOpenCardDetail());

    lastOpenDataPasien = putStorage.cardPasien;
    lastOpenDataDokterPerawat = putStorage.cardDokter;
    lastOpenDataRawatJalan = putStorage.cardRawat;
    notifyListeners();
  }
}
