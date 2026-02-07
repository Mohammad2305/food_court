extension WidgetPadding on String{
  String get firstCharacterUpper {
    String result = this[0].toUpperCase();
    result += substring(1);
    return result;
  }

  String get firstCharacterLower {
    String result = this[0];
    result += substring(1).toUpperCase();
    return result;
  }

  String get characterUpper {
    return toUpperCase();
  }

  String get characterLower {
    return toLowerCase() ;
  }

  String get titleCase {
    if (isEmpty) return this;

    return split(' ')
        .map((word) =>
    word.isEmpty ? word : word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}