void main() {
  Map<String, int> scores = {'Alice': 90, 'Bob': 85, 'Charlie': 78};

  for (var entry in scores.entries) {
    print('Key: ${entry.key}, Value: ${entry.value}');
  }

  print(scores.keys);
  print(scores.entries);
}
