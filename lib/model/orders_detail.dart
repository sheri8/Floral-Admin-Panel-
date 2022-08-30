class OrdersDetail {
  final String Quantity;
  final String Category;
  final String PhotoUrl;
  bool checked;

  OrdersDetail(
      {required this.Quantity,
      required this.Category,
      required this.PhotoUrl,
      required this.checked});

  Map<String, dynamic> toJson() => {
        'date': Quantity,
        'category': Category,
        'photourl': PhotoUrl,
        'checked': checked
      };
}
