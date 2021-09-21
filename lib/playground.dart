void main() {
  int x = 10;
  getLocation().then((value) => {print(value)});
}

Future<String> getLocation() async {
  String str;
  Duration duration = Duration(seconds: 3);
  await Future.delayed(duration, () {
    str = 'hek';
    print('hello world after three seconds');
  });
  return str;
}
