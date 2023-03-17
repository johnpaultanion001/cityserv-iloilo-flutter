import 'package:html/parser.dart';

class HtmlHelper {
  static String removeTag({htmlString, callback}) {
    var document = parse(htmlString);
    return document.documentElement!.text;
  }
}
