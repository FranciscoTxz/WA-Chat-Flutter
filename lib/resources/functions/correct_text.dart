String corregir(String texto) {
  return texto.length > 25 ? '${texto.substring(0, 25)}...' : texto;
}
