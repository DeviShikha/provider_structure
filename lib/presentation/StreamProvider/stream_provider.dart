Stream<int> counterStream() async* {
  int count = 0;

  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    count++;
    yield count;
  }
}