// This class will handle data loading from FireBase

import 'package:gra_terenowa/extras/statics.dart';

enum TripPropertyType {
  time,
  age,
  distance,
  rating,
}

enum StepType {
  info,
  select,
  answer,
  end,
}

class TripItem {
  TripItem({
    required this.runList,
    required this.runLength, // static length of the run (number of steps in every run) TODO: check if runList is consistent with this constant
    this.uid = "", // TODO: add uid generator
    this.imageAsset = "",
    this.title = "Title",
    this.subtitle = "Subtitle",
    this.time = "5",
    this.age = "4+",
    this.distance = "25",
    this.rating = "5.0",
    this.description = "Description",
    this.enabled = true,
  });

  String uid;
  String imageAsset;
  String title;
  String subtitle;
  String time;
  String age;
  String distance;
  String rating;
  String description;
  List<RunItem> runList;
  int runLength;
  bool enabled;

  /// timeStr = "czas"
  static const String timeStr = "czas";

  /// minuteStr = "min"
  static const String minuteStr = "min";

  /// kilometerStr = "km"
  static const String kilometerStr = "km";

  /// ageStr = "wiek"
  static const String ageStr = "wiek";

  /// distanceStr = "dystans"
  static const String distanceStr = "dystans";

  /// ratingStr = "ocena"
  static const String ratingStr = "ocena";

  static String getTypeStr(TripPropertyType type) {
    switch (type) {
      case TripPropertyType.time:
        return timeStr;
      case TripPropertyType.age:
        return ageStr;
      case TripPropertyType.distance:
        return distanceStr;
      case TripPropertyType.rating:
        return ratingStr;
      default:
        // TODO: assert here
        return "Error in getTypeStr(): unknown type";
    }
  }
}

class RunItem {
  RunItem({
    required this.stepList,
  });

  List<StepItem> stepList;
}

class StepItem {
  StepItem({
    this.imageAsset = Statics.defaultImage, // TODO: create default image
    this.title = "Title",
    this.subtitle = "subtitle",
    this.description = "Description",
    this.selection1 = "1",
    this.selection2 = "2",
    this.selection3 = "3",
    this.selection4 = "4",
    this.correctSelection = 0, // default is invalid
    this.correctAnswer = "Correct!",
    this.incorrectAnswer = "Unfortunately this is not correct.",
    this.type = StepType.info,
  });

  String imageAsset;
  String title;
  String subtitle;
  String description;
  String selection1;
  String selection2;
  String selection3;
  String selection4;
  int correctSelection; // 1-4
  String correctAnswer;
  String incorrectAnswer;
  StepType type;
}

/// Generates data for all trips
/// Future work: dynamically load data from online DB (Firebase)
List<TripItem> generateTripItems() {
  return [
    TripItem(
      uid: "01", // TODO: must fix
      runLength: 4,
      runList: <RunItem>[
        RunItem(
          stepList: <StepItem>[
            StepItem(
              type: StepType.info,
              title: "Witamy w naszym parku",
              description: "Zapraszamy do wspólnej podróży po naszym parku.",
              imageAsset: "assets/images/trip_01.png",
            ),
            StepItem(
              type: StepType.info,
              title: "Stawiamy pierwszy krok",
              description:
                  "Jeśli właśnie przyjechałeś po długiej podróży, to na pewno jesteś na parkingu. Rozprostuj nogi, pomachaj rękami i rozejrzyj się wokoło. Czy rozpoznajesz miejsce na zdjęciu? Jeśli tak, to jesteś gotowy do pierwszego zadania.",
              imageAsset: "assets/images/trip01/trip01_01.jpg",
            ),
            StepItem(
              type: StepType.info,
              title: "Ile jest miejsc?",
              description:
                  'Poszukaj niebieskiego znaku na parkingu i odpowiedz na następujące pytanie: "Ile miejsc na parkingu jest zarezerwowanych dla osób niepełnosprawnych?"',
              imageAsset: "assets/images/trip01/trip01_02.jpg",
            ),
            StepItem(
              type: StepType.select,
              selection1: "2",
              selection2: "0",
              selection3: "1",
              selection4: "3",
              imageAsset: "assets/images/trip01/trip01_02.jpg",
            ),
          ],
        ),
        RunItem(
          stepList: <StepItem>[
            StepItem(
              type: StepType.answer,
              title: "Miejsca parkingowe",
              correctSelection: 1,
              correctAnswer:
                  "Gratuluję! Rozwiązałeś pierwszą zagadkę. Możemy ruszać dalej.",
              incorrectAnswer:
                  "Niestety! To nie jest prawidłowa odpowiedź. Przypatrz się dobrze niebieskiemu znakowi. Są tam 2 miejsca dla niepełnosprawnych. Ale nie przejmuj się. Pierwszy krok jest zawsze najtrudniejszy. Jesteś gotowy do dalszej drogi?",
              imageAsset: "assets/images/trip01/trip01_03.jpg",
            ),
            StepItem(
              type: StepType.info,
              title: "Wchodzimy do parku",
              description:
                  "Teraz znajdź wejście do parku, które jest oznaczone niebieską tablicą. Jeśli już je znalazłeś, możemy rozpocząć drugie zadanie.",
              imageAsset: "assets/images/trip01/trip01_04.jpg",
            ),
            StepItem(
              type: StepType.info,
              title: "Kto to jest?",
              description:
                  "Teraz wejdź do parku i poszukaj figury pewnej osoby z krzyżem w ręku. Pod tą figurą znajduje się napis. Od jakiej literki się zaczyna?",
              imageAsset: "assets/images/trip01/trip01_05.jpg",
            ),
            StepItem(
              type: StepType.select,
              selection1: "F",
              selection2: "O",
              selection3: "B",
              selection4: "K",
              imageAsset: "assets/images/trip01/trip01_05.jpg",
            ),
          ],
        ),
        RunItem(
          stepList: <StepItem>[
            StepItem(
              type: StepType.answer,
              title: "Błogosławiony Franciszek Jordan",
              correctSelection: 3,
              correctAnswer:
                  'Wspaniale! Pierwsza literka oznacza "Błogosławiony". Ojciec Franciszek Jordan jest założycielem Zgromadzenia Salwatorianów i sióstr Salwatorianek, którzy dzisiaj zamieszkują to miejsce. Został beatyfikowany 15 maja 2021 roku.',
              incorrectAnswer:
                  "Niestety! To nie jest prawidłowa odpowiedź. Przypatrz się dobrze niebieskiemu znakowi. Są tam 2 miejsca dla niepełnosprawnych. Ale nie przejmuj się. Pierwszy krok jest zawsze najtrudniejszy. Jesteś gotowy do dalszej drogi?",
              imageAsset: "assets/images/trip01/trip01_06.jpg",
            ),
            StepItem(
              type: StepType.info,
              title: "Idziemy do altanki?",
              description:
                  "Teraz czas, aby wejść głębiej do parku. Idąc po schodkach zobaczysz po lewej stronie piękną niebieską altankę. Znalazłeś już do niej drzwi?",
              imageAsset: "assets/images/trip01/trip01_07.jpg",
            ),
            StepItem(
              type: StepType.info,
              title: "Brakuje ci już sił?",
              description:
                  "Widzę, że jesteś zmęczony(a) i chcesz troszeczkę odpocząć. Usiądź sobie wygodnie w altance. Dokończymy innym razem.",
              imageAsset: "assets/images/trip01/trip01_08.jpg",
            ),
            StepItem(
              type: StepType.end,
              title: "Do zobaczenia",
              description: "Dziękujemy za wspólną podróż i zapraszamy znowu!",
              imageAsset: "assets/images/trip_01.png",
            ),
          ],
        ),
      ],
      title: "W Parku",
      subtitle: "dla najmłodszych",
      time: "30",
      age: "6+",
      distance: "1,6",
      rating: "4,8",
      description:
          "Poznaj tajemnice klasztornego parku poprzez wyszukiwanie ciekawych miejsc i rozwiązywanie zadań.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
    ),
    TripItem(
      uid: "02", // TODO: must fix
      runLength: 4,
      runList: <RunItem>[
        RunItem(
          stepList: <StepItem>[
            StepItem(title: "Step 1"),
            StepItem(title: "Step 2"),
            StepItem(title: "Step 3"),
            StepItem(title: "Step 4"),
          ],
        ),
        RunItem(
          stepList: <StepItem>[
            StepItem(title: "Step 1"),
            StepItem(title: "Step 2"),
            StepItem(title: "Step 3"),
            StepItem(title: "Step 4"),
          ],
        ),
      ],
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      time: "45",
      age: "12+",
      distance: "0,7",
      rating: "4,5",
      description:
          "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
    ),
    TripItem(
      uid: "03", // TODO: must fix
      runLength: 14,
      runList: <RunItem>[
        RunItem(
          stepList: <StepItem>[
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 1",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 2",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 3",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 4",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 5",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 6",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 7",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 8",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 9",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 10",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 11",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 12",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 13",
            ),
            StepItem(
              imageAsset: "assets/images/trip_03.png",
              title: "Stacja 14",
            ),
          ],
        ),
      ],
      title: "Droga Krzyżowa",
      subtitle: "dla dorosłych",
      time: "60",
      age: "18+",
      distance: "1,7",
      rating: "4,7",
      description:
          "Towarzysz Panu Jezusowi na drodze krzyżowej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
    ),
  ];
}
