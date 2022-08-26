class OrdersDetail {
  final String Quantity;
  final String Category;
  final String PhotoUrl;

  OrdersDetail({
    required this.Quantity,
    required this.Category,
    required this.PhotoUrl,
  });

  Map<String, dynamic> toJson() => {
        'date': Quantity,
        'category': Category,
        'photourl': PhotoUrl,
      };
}
