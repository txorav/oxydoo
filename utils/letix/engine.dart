import 'dart:io';

class Letix {
  letixEngine(File lexFile) async {
    List content = await lexFile.readAsLines();
    List contentDecoded = [];
    for (int i = 0; i < content.length; i++) {
      contentDecoded.add(content[i].toString().split(" "));
    }
    return contentDecoded;
  }
}