import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_management_system/models/keterangan/keterangan_model.dart';
import 'package:mockito/mockito.dart';

// Mock for Dummy Data
class DataKeterangan extends Mock implements KeteranganModel {}

void main() {
  test("Testing Keterangan >>", () {
    final mock = DataKeterangan();

    when(mock.id).thenReturn(2);
    when(mock.namaPasien).thenReturn("Genjo");
    when(mock.keterangan).thenReturn("Sakit");
    when(mock.tanggal).thenReturn("01-07-2021");

    var dataKeterangan = KeteranganModel(
      id: mock.id,
      namaPasien: mock.namaPasien,
      keterangan: mock.keterangan,
      tanggal: mock.tanggal,
    );

    expect(mock.id, dataKeterangan.id);
    expect(mock.namaPasien, dataKeterangan.namaPasien);
    expect(mock.keterangan, dataKeterangan.keterangan);
    expect(mock.tanggal, dataKeterangan.tanggal);

    expect(dataKeterangan.toJson(), isA<Map<String, dynamic>>());
  });
}
