const BaseIcons = require("../../resource/icons/baseIcons");

class Icons {
  static getIconByName(name) {
    if(BaseIcons.hasOwnProperty(name)) {
      return BaseIcons[name];
    }

    return null;
  }

  static findIconByName(name) {
    var baseIcon = Icons.findBaseIconByName(name);
    if(baseIcon != null) {
      return baseIcon;
    }

    return null;
  }

  static findBaseIconByName(name) {
    var icon = Icons._find(name, BaseIcons);

    if(icon != null) {
      return icon;
    }

    return null;
  }

  static _find(name, icons) {


    for(var item in icons) {
      var icon = icons[item];
      var pattern = new RegExp("\\b" + item + "\\b", "gi");

      if(pattern.test(name)) {
        return icon;
      }
    }

    return null;
  }
}

module.exports = Icons;
