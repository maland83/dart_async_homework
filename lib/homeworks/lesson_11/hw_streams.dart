void main(List<String> args) async {
  Task6();
}

Future<void> Task6() async {
  final List<int> intList =
      List.generate(20, (int index) => index, growable: false).toList();

  final Stream<int> intStream = Stream.fromIterable(intList);

  await for (final val in intStream) {
    print(val);
  }
  print('-----------------------');
  intStream.listen((event) {
    print(event);
  });
}
