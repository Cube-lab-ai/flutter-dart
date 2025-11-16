class Money {
  final double amount;
  final String currency;

  Money(this.amount, this.currency);

  Money operator +(Money other) {
    if (currency != other.currency) {
      throw ArgumentError('Cannot add amounts with different currencies');
    }
    return Money(amount + other.amount, currency);
  }

  @override
  String toString() => '$amount $currency';
}

void main() {
  var salary = Money(5000, 'USD');
  var bonus = Money(1200, 'USD');
  print(salary + bonus); // Output: 6200 USD
}
