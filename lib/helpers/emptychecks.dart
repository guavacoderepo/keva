checkEmpty<bool>(List datas) {
  for (var data in datas) {
    if (data.toString().isEmpty) {
      return false;
    }
  }

  return true;
}
