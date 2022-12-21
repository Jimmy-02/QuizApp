class DangKyuserObject {
  String id;
  final String tennguoichoi;
  final String kimcuong;
  final String email;
  final int diem;
  DangKyuserObject(
      {this.id = '',
      required this.tennguoichoi,
      this.kimcuong = '0',
      required this.email,
      this.diem = 0});
  Map<String, Object?> toJson() {
    return {
      'id': id,
      'ten': tennguoichoi,
      'email': email,
      'kimcuong': kimcuong,
      'diem': diem
    };
  }
}
