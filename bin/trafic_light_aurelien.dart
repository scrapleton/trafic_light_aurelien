import '../utils/trafic_light_color.dart';
import '../utils/drawing.dart';

void main(List<String> arguments) {
  //ANIMATION INFINITE LOOP
  while (true) {
    int carIndex = 0;
    int pedestrianIndex = 0;

    //CAR GO, PEOPLE STOP
    for (carIndex; carIndex < 12; carIndex++) {
      drawScene(
          pedestrianLight: TraficLightColor.red,
          carLight: TraficLightColor.green,
          pedestrianPosition: -1,
          carPosition: carIndex);
    }

    carIndex = 0;
    //CAR GO THEN WAIT, PEOPLE STOP
    for (carIndex; carIndex < 5; carIndex++) {
      drawScene(
          pedestrianLight: TraficLightColor.red,
          carLight:
              carIndex < 3 ? TraficLightColor.green : TraficLightColor.yellow,
          pedestrianPosition: 0,
          carPosition: carIndex);
    }

    carIndex = 5;
    //CAR STOP, PEOPLE GO
    for (pedestrianIndex; pedestrianIndex < 7; pedestrianIndex++) {
      drawScene(
          pedestrianLight: TraficLightColor.green,
          carLight: TraficLightColor.red,
          pedestrianPosition: pedestrianIndex,
          carPosition: carIndex);
    }

    //ALL STOP
    for (int wait = 0; wait < 2; wait++) {
      drawScene(
          pedestrianLight: TraficLightColor.red,
          carLight: TraficLightColor.red,
          pedestrianPosition: pedestrianIndex,
          carPosition: carIndex);
    }

    //CAR WAIT
    for (int wait = 0; wait < 2; wait++) {
      drawScene(
          pedestrianLight: TraficLightColor.red,
          carLight: TraficLightColor.yellow,
          pedestrianPosition: pedestrianIndex,
          carPosition: carIndex);
    }

    //CAR GO
    for (carIndex; carIndex < 12; carIndex++) {
      drawScene(
          pedestrianLight: TraficLightColor.red,
          carLight: TraficLightColor.green,
          pedestrianPosition: -1,
          carPosition: carIndex);
    }
  }
}
