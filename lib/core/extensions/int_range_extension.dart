extension IntRange on int {
  bool inRange(int start, int end) {
    return this >= start && this <= end;
  }
}
