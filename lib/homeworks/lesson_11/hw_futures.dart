void main(List<String> args) async {
  print('Мене звати ${await fetchName()}');
}

Future<String> fetchName() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Андрій';
}
