import 'dart:async';

Future<void> main(List<String> args) async {
  await Task6();
  await Task7();
  await Task8();
}

Task6() async {
  final List<int> intList =
      List.generate(20, (int index) => index, growable: false).toList();

  final Stream<int> intStream = Stream.fromIterable(intList);
  print('--------await for---------------');
  await for (final val in intStream) {
    print(val);
  }
  print('--------listen---------------');
  intStream.listen((event) {
    print(event);
  });
}

Task7() {
  final Stream<int> intStrem = Stream<int>.periodic(
    const Duration(seconds: 1),
    (count) => count++,
  ).take(10);

  intStrem.listen((event) {
    print('$event...');
  });
}

Task8() {
  final controller = StreamController<String>();

  controller.stream.listen(
    (event) => print(event),
    onDone: () => print('Стрім завершено'),
  );

  controller.sink.add('Hello');

  controller.close();
}
