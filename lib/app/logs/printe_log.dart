/// Чтобы не убирать принты по всему приложение перед релизом
void printWWWW(dynamic printData) {
  assert(() {
    print(printData.toString());
    return true;
  }());
}
