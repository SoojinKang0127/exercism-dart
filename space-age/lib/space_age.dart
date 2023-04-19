class SpaceAge {
  num earthSeconds = 31557600;
  double age({required String planet, required double seconds}){
    if(planet == 'Earth'){
      return double.parse((seconds / earthSeconds).toStringAsFixed(2));
    }else{
      return 0;
    }
  }
}
