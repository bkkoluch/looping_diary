extension ListExtensions<T> on List<T> {
  void addOrUpdateIfExists(List<T> list, int Function() indexLocator, T object) {
    final int index = indexLocator();

    if (index >= 0) {
      list[index] = object;
    } else {
      list.add(object);
    }
  }
}
