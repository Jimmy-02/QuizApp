class DangKyObject {
  String id;
  final String tentaikhoan;
  final String matkhau;
  final String Sdt;
  DangKyObject({
    this.id = '',
    required this.tentaikhoan,
    required this.matkhau,
    required this.Sdt,
  });
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'tentaikhoan': tentaikhoan,
      'matkhau': matkhau,
      'Sdt': Sdt,
    };
  }
}
