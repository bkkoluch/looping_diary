extension ListExtensions<T> on List<T> {
  void addOrUpdateIfExists(List<T> list, T object) {
    final int index = list.indexOf(object);

    if (index >= 0) {
      list[index] = object;
    } else {
      list.add(object);
    }
  }
}
