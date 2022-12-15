import 'dart:io';

void main() async {
  List templates = [];
  templates.add("""

#GROUP_TEMPLATE data_dummy
#TEMPLATE randomImage
"@randomImage"
#END
#TEMPLATE randomImagePicasso
"@randomImagePicasso"
#END
#TEMPLATE randomName
"@randomName"
#END
#TEMPLATE randomAddress
"@randomAddress"
#END


#GROUP_TEMPLATE skip_docs
#TEMPLATE text
Text("text"),
#END
#TEMPLATE pa
padding: const EdgeInsets.all(\$1),
#END
#TEMPLATE ma
margin: const EdgeInsets.all(\$1),
#END
""");

  for (var i = 1; i <= 50; i++) {
    templates.add("""
#GROUP_TEMPLATE skip_docs

#TEMPLATE sz$i
size: $i.0,
#END

#TEMPLATE rd$i
radius: $i.0,
#END

#TEMPLATE brd$i
borderRadius: BorderRadius.circular($i.0)
#END


#TEMPLATE sw$i
const SizedBox(
  width: $i.0,
),
#END

#TEMPLATE sh$i
const SizedBox(
  height: $i.0,
),
#END

#TEMPLATE p$i
padding: const EdgeInsets.all($i.0),
#END

#TEMPLATE plr$i
padding: const EdgeInsets.only(left: $i.0, right: $i.0,),
#END

#TEMPLATE ptb$i
padding: const EdgeInsets.only(top: $i.0, bottom: $i.0,),
#END

#TEMPLATE pt$i
padding: const EdgeInsets.only(top: $i.0,),
#END

#TEMPLATE pr$i
padding: const EdgeInsets.only(right: $i.0,),
#END

#TEMPLATE pb$i
padding: const EdgeInsets.only(bottom: $i.0,),
#END

#TEMPLATE pl$i
padding: const EdgeInsets.only(left: $i.0,),
#END


#TEMPLATE m$i
margin: const EdgeInsets.all($i.0),
#END

#TEMPLATE mlr$i
margin: const EdgeInsets.only(left: $i.0, right: $i.0,),
#END

#TEMPLATE mtb$i
margin: const EdgeInsets.only(top: $i.0, bottom: $i.0,),
#END

#TEMPLATE mt$i
margin: const EdgeInsets.only(top: $i.0,),
#END

#TEMPLATE mr$i
margin: const EdgeInsets.only(right: $i.0,),
#END

#TEMPLATE mb$i
margin: const EdgeInsets.only(bottom: $i.0,),
#END

#TEMPLATE ml$i
margin: const EdgeInsets.only(left: $i.0,),
#END

#TEMPLATE mv$i
margin: const EdgeInsets.symmetric(vertical: $i.0),
#END

#TEMPLATE mh$i
margin: const EdgeInsets.symmetric(horizontal: $i.0),
#END

#TEMPLATE pv$i
padding: const EdgeInsets.symmetric(vertical: $i.0),
#END

#TEMPLATE ph$i
padding: const EdgeInsets.symmetric(horizontal: $i.0),
#END

#GROUP_TEMPLATE skip_docs

#TEMPLATE fs$i
fontSize: $i.0,
#END

#TEMPLATE text$i
Text("text",
  style: TextStyle(
    fontSize: $i.0,
  ),
),
#END

#TEMPLATE textb$i
Text("text",
  style: TextStyle(
    fontSize: $i.0,
    fontWeight: FontWeight.bold,
  ),
),
#END

"""
        .trim());
  }

  templates.add("""
//#GROUP_TEMPLATE colors
""");
  addBasicColors(templates);
  addExtraColors(templates);

  var f = File("./lib/_/common_snippet.dart");
  f.writeAsStringSync("""
/*
${templates.join("\n")}
*/
""", mode: FileMode.write);
}

void addBasicColors(List templates) {
  templates.add("""
#TEMPLATE cWhite
color: Colors.white,
#END

#TEMPLATE cBlack
color: Colors.black,
#END

#TEMPLATE cBlack12
color: Colors.black12,
#END

#TEMPLATE cBlack26
color: Colors.black26,
#END

#TEMPLATE cBlack38
color: Colors.black38,
#END

#TEMPLATE cBlack45
color: Colors.black45,
#END

#TEMPLATE cBlack54
color: Colors.black54,
#END

#TEMPLATE cBlack87
color: Colors.black87,
#END

#TEMPLATE cTransparent
color: Colors.transparent,
#END

// =======-----------

#TEMPLATE bcWhite
backgroundColor: Colors.white,
#END

#TEMPLATE bcBlack
backgroundColor: Colors.black,
#END

#TEMPLATE bcBlack12
backgroundColor: Colors.black12,
#END

#TEMPLATE bcBlack26
backgroundColor: Colors.black26,
#END

#TEMPLATE bcBlack38
backgroundColor: Colors.black38,
#END

#TEMPLATE bcBlack45
backgroundColor: Colors.black45,
#END

#TEMPLATE bcBlack54
backgroundColor: Colors.black54,
#END

#TEMPLATE bcBlack87
backgroundColor: Colors.black87,
#END

#TEMPLATE bcTransparent
backgroundColor: Colors.transparent,
#END
"""
      .trim());

  List index = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  List colorString = [
    "Colors.pink",
    "Colors.red",
    "Colors.deepOrange",
    "Colors.orange",
    "Colors.amber",
    "Colors.yellow",
    "Colors.lime",
    "Colors.lightGreen",
    "Colors.green",
    "Colors.cyan",
    "Colors.lightBlue",
    "Colors.blue",
    "Colors.indigo",
    "Colors.purple",
    "Colors.deepPurple",
    "Colors.blueGrey",
    "Colors.brown",
    "Colors.grey",
  ];

  for (var color in colorString) {
    var colorName = color.split(".")[1];

    templates.add("""
#TEMPLATE c${colorName.toString().firstCharacterUpper()}
color: $color,
#END

#TEMPLATE bc${colorName.toString().firstCharacterUpper()}
backgroundColor: $color,
#END
"""
        .trim());

    for (var colorValue in index) {
      templates.add("""
#TEMPLATE c${colorName.toString().firstCharacterUpper()}$colorValue
color: $color[$colorValue],
#END

#TEMPLATE bc${colorName.toString().firstCharacterUpper()}$colorValue
backgroundColor: $color[$colorValue],
#END
"""
          .trim());
    }
  }
}

void addExtraColors(List templates) {
  List index = [100, 400, 700];
  List colorString = [
    "Colors.pinkAccent",
    "Colors.redAccent",
    "Colors.deepOrangeAccent",
    "Colors.orangeAccent",
    "Colors.amberAccent",
    "Colors.yellowAccent",
    "Colors.limeAccent",
    "Colors.lightGreenAccent",
    "Colors.greenAccent",
    "Colors.tealAccent",
    "Colors.cyanAccent",
    "Colors.lightBlueAccent",
    "Colors.blueAccent",
    "Colors.indigoAccent",
    "Colors.purpleAccent",
    "Colors.deepPurpleAccent",
  ];

  for (var color in colorString) {
    var colorName = color.split(".")[1];

    templates.add("""
#TEMPLATE c${colorName.toString().firstCharacterUpper()}
color: $color,
#END

#TEMPLATE bc${colorName.toString().firstCharacterUpper()}
backgroundColor: $color,
#END
"""
        .trim());

    for (var colorValue in index) {
      templates.add("""
#TEMPLATE c${colorName.toString().firstCharacterUpper()}$colorValue
color: $color[$colorValue],
#END

#TEMPLATE bc${colorName.toString().firstCharacterUpper()}$colorValue
backgroundColor: $color[$colorValue],
#END
"""
          .trim());
    }
  }
}

extension StringCasingExtension on String {
  firstCharacterUpper() {
    var value = this;
    return value[0].toString().toUpperCase() + value.substring(1);
  }
}
