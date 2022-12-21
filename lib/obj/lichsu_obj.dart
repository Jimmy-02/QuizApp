class LichSuObject {
  String id;
  final int diem;
  final String ngaychoi;
  final String ten;
  LichSuObject({
    this.id = '',
    required this.diem,
    required this.ngaychoi,
    required this.ten,
  });
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'diem': diem,
      'ngaychoi': ngaychoi,
      'ten': ten,
    };
  }
}
