void main(List<String> args) async {
  final stopWatch = Stopwatch();
  stopWatch.start();

  print('Мене звати ${await fetchName()}');

  final yearsStr = await fetchAge();
  final years = int.tryParse(yearsStr) ?? 0;

  print('Мені ${pluralizeYear(years)}');

  stopWatch.stop();
  print(stopWatch.elapsed);
  print(stopWatch.elapsed.inSeconds);

  stopWatch.reset();
  stopWatch.start();
  final List<Future> futureList = [fetchName(), fetchAge()];

  await Future.wait(futureList);

  stopWatch.stop();
  print(stopWatch.elapsed);
  print(stopWatch.elapsed.inSeconds);

  print(await delayedCountdown(qty_seconds: 5));
}

Future<String> fetchName() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Андрій';
}

Future<String> fetchAge() async {
  await Future.delayed(const Duration(milliseconds: 1500));
  return '25';
}

Future<String> delayedCountdown({required int qty_seconds}) async {
  for (var i = qty_seconds; i > 0; i--) {
    await Future.delayed(Duration(seconds: 1)).then((_) {
      print('$i...');
    });
  }
  return "Start";
}

String pluralizeYear(int count) {
  int mod10 = count % 10;
  int mod100 = count % 100;

  if (mod10 == 1 && mod100 != 11) {
    return '$count рік';
  } else if (mod10 >= 2 && mod10 <= 4 && (mod100 < 10 || mod100 >= 20)) {
    return '$count роки';
  } else {
    return '$count років';
  }
}
