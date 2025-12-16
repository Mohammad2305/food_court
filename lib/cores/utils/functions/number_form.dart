class NumberForm {
  static String twoCells(int number) {
    if (number < 10) {
      return "0$number";
    } else {
      return "$number";
    }
  }

  static String threeCells(int number) {
    if (number < 10) {
      return "00$number";
    } else if (number < 100 && number > 10) {
      return "0$number";
    } else {
      return "$number";
    }
  }
}
