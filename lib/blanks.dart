String minimizeSpaces(String text, {bool trim=true})
{
  // todo unit test
  if (trim) {
    return text.replaceAll(RegExp(r'^\s+|(?<=\s)\s+|\s+(?=$)', multiLine: true), '');
  } else {
    return text.replaceAll(RegExp(r'\s+', multiLine: true), ' ');
  }
}

String minimizeSpacesKeepNewlines(String text)
{
  var lines = text.split('\n').map((line)=>minimizeSpaces(line)).toList();

  // нахожу первую непустую строку (до нее все пусты)
  int lastNonEmptyLine;
  for ( lastNonEmptyLine=lines.length-1;
        lastNonEmptyLine>=0 && lines[lastNonEmptyLine].isEmpty;
        --lastNonEmptyLine ) {}

  // нахожу последнюю непустую строку (после нее все пусты)
  int firstNonEmptyLine;
  for ( firstNonEmptyLine=0;
        firstNonEmptyLine<lines.length && lines[firstNonEmptyLine].isEmpty;
        ++firstNonEmptyLine ) {}

  // отбрасываю пустые строки слева и справа
  if (lastNonEmptyLine>0 || firstNonEmptyLine<lines.length-1) {
    lines = lines.sublist(firstNonEmptyLine, lastNonEmptyLine+1);
  }

  return lines.join('\n');
}

String spacesToNbsp(String text) {
  return text.replaceAll(RegExp(r'\s+', multiLine: true, dotAll: true), '\xa0'); // todo unit test
}

String nbspAfterDigits(String text) {
  return text.replaceAll(RegExp(r'(?<=\d)\s+(?=\p{L})', multiLine: true, unicode: true, dotAll: true), '\xa0');
}