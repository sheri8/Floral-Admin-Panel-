class Order {
  final String MName;
  final String MType;
  final String MColor;
  final String MDescription;
  final String MCategory;
  final String MPhotoUrl;
  final String MPrice;

  Order({
    required this.MName,
    required this.MType,
    required this.MColor,
    required this.MDescription,
    required this.MCategory,
    required this.MPhotoUrl,
    required this.MPrice,
  });

  Map<String, dynamic> toJson() => {
        'Name': MName,
        'Type': MType,
        'Color': MColor,
        'Description': MDescription,
        'Category': MCategory,
        'Photo Url': MPhotoUrl,
        'Price': MPrice,
      };
}
