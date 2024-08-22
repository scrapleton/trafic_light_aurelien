import 'string_color.dart';
import 'trafic_light_color.dart';
import 'dart:io';

//Clear the terminal
clearTerminal() {
  stdout.write("\x1B[2J\x1B[0;0H");
}

//Draw the title of the App
drawHeader() {
  stdout.write(coloredString("+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+\n",
      color: StringColor.blue));
  stdout.write(coloredString("||", color: StringColor.blue));
  stdout.write(
      coloredString(" 🚥  TRAFFIC LIGHT 3000!  🚥 ", color: StringColor.white));
  stdout.write(coloredString("||\n", color: StringColor.blue));
  stdout.write(coloredString("+===============================+\n",
      color: StringColor.blue));
}

//Draw the traffic lights
drawTraficLights(TraficLightColor pedestrianColor, TraficLightColor carColor) {
  stdout.write(coloredString("||                             ||\n"));

  //FIRST LIGHTS
  stdout.write(coloredString("||       | "));

  stdout.write(coloredString("◉",
      color: pedestrianColor == TraficLightColor.red
          ? StringColor.red
          : StringColor.grey));

  stdout.write(coloredString(" |    | "));

  stdout.write(coloredString("◉",
      color: carColor == TraficLightColor.red
          ? StringColor.red
          : StringColor.grey));

  stdout.write(coloredString(" |        ||\n"));

  //SECOND LIGHTS
  stdout.write(coloredString("||       | "));

  stdout.write(coloredString("◉",
      color: pedestrianColor == TraficLightColor.green
          ? StringColor.green
          : StringColor.grey));

  stdout.write(coloredString(" |    | "));

  stdout.write(coloredString("◉",
      color: carColor == TraficLightColor.yellow
          ? StringColor.yellow
          : StringColor.grey));

  stdout.write(coloredString(" |        ||\n"));

  //THIRD LIGHTS
  stdout.write(coloredString("||                | "));

  stdout.write(coloredString("◉",
      color: carColor == TraficLightColor.green
          ? StringColor.green
          : StringColor.grey));
  stdout.write(coloredString(" |        ||\n"));

  //LAYER
  stdout.write(coloredString("||                             ||\n"));
  stdout.write(coloredString("+=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=+\n\n",
      color: StringColor.blue));
}

//Draw the crossroad
drawCrossroad({int carPosition = 0, int pedestrianPosition = 0}) {
  if (pedestrianPosition == 6) {
    stdout.write(coloredString("             🧍\n"));
  } else {
    stdout.write(coloredString("\n"));
  }

  if (pedestrianPosition == 5) {
    stdout.write(coloredString("  ---------■■🧍■■--------------\n"));
  } else {
    stdout.write(coloredString("  ---------■■■■■■--------------\n"));
  }

  switch (carPosition) {
    case 0:
      stdout.write(coloredString("           ■■■■■■              \n"));
    case 1:
      stdout.write(coloredString("           ■■■■■■            🚗\n"));
    case 2:
      stdout.write(coloredString("           ■■■■■■         🚗\n"));
    case 3:
      stdout.write(coloredString("           ■■■■■■      🚗\n"));
    case 4:
      stdout.write(coloredString("           ■■■■■■   🚗\n"));
    case 5:
      if (pedestrianPosition == 4) {
        stdout.write(coloredString("           ■■🧍■■🚗\n"));
      } else {
        stdout.write(coloredString("           ■■■■■■🚗\n"));
      }
    case 6:
      stdout.write(coloredString("           ■■■■🚗\n"));
    case 7:
      stdout.write(coloredString("           ■■🚗■■\n"));
    case 8:
      stdout.write(coloredString("           🚗■■■■\n"));
    case 9:
      stdout.write(coloredString("         🚗■■■■■■\n"));
    case 10:
      stdout.write(coloredString("      🚗   ■■■■■■\n"));
    case 11:
      stdout.write(coloredString("   🚗      ■■■■■■\n"));
    case 12:
      stdout.write(coloredString("🚗         ■■■■■■\n"));
  }

  if (pedestrianPosition == 3) {
    stdout.write(coloredString("    --  -- ", color: StringColor.grey));
    stdout.write(coloredString("■■🧍■■", color: StringColor.white));
    stdout.write(coloredString(" --  --  --  -\n", color: StringColor.grey));
  } else {
    stdout.write(coloredString("    --  -- ", color: StringColor.grey));
    stdout.write(coloredString("■■■■■■", color: StringColor.white));
    stdout.write(coloredString(" --  --  --  -\n", color: StringColor.grey));
  }

  if (pedestrianPosition == 2) {
    stdout.write(coloredString("           ■■🧍■■\n"));
  } else {
    stdout.write(coloredString("           ■■■■■■\n"));
  }

  if (pedestrianPosition == 1) {
    stdout.write(coloredString("  ---------■■🧍■■--------------\n"));
  } else {
    stdout.write(coloredString("  ---------■■■■■■--------------\n"));
  }

  if (pedestrianPosition == 0) {
    stdout.write(coloredString("             🧍\n"));
  } else {
    stdout.write(coloredString("\n"));
  }
}

//Draw the full scene (clear, header, traffic lights, crossroad), given both traffic lights status and both actors position.
drawScene(
    {TraficLightColor pedestrianLight = TraficLightColor.green,
    TraficLightColor carLight = TraficLightColor.red,
    int pedestrianPosition = 0,
    int carPosition = 0}) {
  clearTerminal();
  drawHeader();
  drawTraficLights(pedestrianLight, carLight);
  drawCrossroad(
      carPosition: carPosition, pedestrianPosition: pedestrianPosition);
  sleep(Duration(milliseconds: 500));
}
