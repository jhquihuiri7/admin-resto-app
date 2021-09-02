class CommonFuntions {
  String transformText(String title){
    return '${title.substring(80).split('.')[0]}.${title.substring(80).split('.')[1].split('?')[0]}';
  }
}