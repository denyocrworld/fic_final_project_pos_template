import 'dart:io';

void main() async {
  var list = Directory(".\\lib\\module").listSync(
    recursive: true,
  );
  for (var f in list) {
    if (f is File) {
      f.renameSync(f.absolute.path.replaceAll("gj_", ""));
    }
    if (f is Directory) {
      f.renameSync(f.absolute.path.replaceAll("gj_", ""));
    }

    print(f.absolute.path);
  }
}
