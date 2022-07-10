class Metal {
  double price;
  Metal({
    required this.price,
  });

  toMap() {
    final result = <String, dynamic>{};

    result.addAll({'price': price});

    return result;
  }

  factory Metal.fromMap(map) {
    return Metal(
      price: map['price']?.toDouble() ?? 0.0,
    );
  }
}
