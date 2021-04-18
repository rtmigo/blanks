import 'package:blanks/blanks.dart';
import 'package:test/test.dart';

void main() {
  test('minimizeSpacesKeepNewlines', () {
    expect(minimizeSpacesKeepNewlines('   two  words   '), 'two words');
    expect(minimizeSpacesKeepNewlines('  line   one  \n  line  two    '), 'line one\nline two');
    expect(minimizeSpacesKeepNewlines('Paragraph  1\r\n\r\nParagraph  2'),
        'Paragraph 1\n\nParagraph 2');
    expect(minimizeSpacesKeepNewlines('\n \n\nParagraph  1\r\n\r\nParagraph  2\n \n '),
        'Paragraph 1\n\nParagraph 2');
  });

  test('nbspAfterDigits', () {
    expect(
        nbspAfterDigits('22 minutes 30 seconds').replaceAll('\xa0', '~'), '22~minutes 30~seconds');
    expect(nbspAfterDigits('22 минуты 30 секунд').replaceAll('\xa0', '~'), '22~минуты 30~секунд');
  });
}
