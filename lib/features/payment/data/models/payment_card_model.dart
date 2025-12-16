class PaymentCardModel {
  PaymentCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cVV,
  });

  final String cardHolderName;
  final String cardNumber;
  final DateTime expiryDate;
  final String cVV;
}
