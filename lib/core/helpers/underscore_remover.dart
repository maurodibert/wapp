String removeUnderscore(String league) {
  List<String> _splitted = league.split('_');
  String _final = _splitted.join(' ');
  return _final;
}
