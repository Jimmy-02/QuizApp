class DiemObject {
  final int id;
  final int Diem;
  DiemObject(this.id, this.Diem);
  DiemObject.fromJson(Map<String, dynamic> r)
      : id = r['taikhoan']['id'],
        Diem = r['taikhoan']['Diem'];
}
