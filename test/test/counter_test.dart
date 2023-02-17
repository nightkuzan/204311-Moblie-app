import 'package:test/test.dart';
import 'package:testing/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.count, 1);
  });

  test('Counter value should be decremented', () {
    final counter = Counter();
    counter.decrement();
    expect(counter.count, -1);
  });
}
