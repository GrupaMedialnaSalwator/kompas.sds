/// This class will handle data loading from FireBase

import 'package:gra_terenowa/statics/constants.dart';

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

/// API for Trip data
///
class TripItem {
  TripItem({
    this.uid = "", // TODO: add uid generator
    this.imageAsset = "",
    this.title = "Title",
    this.subtitle = "Subtitle",
    this.time = "5",
    this.age = "4+",
    this.distance = "25",
    this.rating = "5.0",
    this.description = "Description",
    this.stepList = const [],
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
  List<StepItem> stepList;
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
        assert(false,
            'getTypeStr(TripPropertyType type) must switch on predefined types');
        return "Error in getTypeStr(): unknown type";
    }
  }
}

/// API for step data
class StepItem {
  StepItem({
    this.type = StepType.info,
    this.imageAsset = Constants.defaultImage, // TODO: create default image
    this.title = "Title",
    this.subtitle = "subtitle",
    this.description = "Description",
    this.selection = const [],
    this.correctSelection =
        0, // TODO: run tests to check if this variable is set the same for select and answer steps
    this.correctAnswer = "Correct!",
    this.incorrectAnswer = "Unfortunately this is not correct.",
    this.previousStep = -1,
    this.nextStep = -1,
  });

  StepType type;
  String imageAsset;
  String title;
  String subtitle;
  String description;
  List<SelectionItem> selection;
  int correctSelection;
  String correctAnswer;
  String incorrectAnswer;
  int previousStep;
  int nextStep;
}

/// API for selection data
class SelectionItem {
  SelectionItem({
    this.text = "?",
    this.stepLink = -1,
  });

  String text;
  int stepLink;
}

/// Generates data for all trips
/// Future work: dynamically load data from online DB (Firebase)
List<TripItem> generateTripItems() {
  return [
    TripItem(
      uid: "01", // TODO: must fix
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
      stepList: <StepItem>[
        StepItem(
          type: StepType.info,
          title: "Witamy w naszym parku",
          description: "Zapraszamy do wspólnej podróży po naszym parku.",
          imageAsset: "assets/images/trip_01.png",
          nextStep: 1,
        ),
        StepItem(
          type: StepType.info,
          title: "Stawiamy pierwszy krok",
          description:
              "Jeśli właśnie przyjechałeś po długiej podróży, to na pewno jesteś na parkingu. Rozprostuj nogi, pomachaj rękami i rozejrzyj się wokoło. Czy rozpoznajesz miejsce na zdjęciu? Jeśli tak, to jesteś gotowy do pierwszego zadania.",
          imageAsset: "assets/images/trip01/trip01_01.jpg",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile jest miejsc?",
          description:
              'Poszukaj niebieskiego znaku na parkingu i odpowiedz na następujące pytanie: "Ile miejsc na parkingu jest zarezerwowanych dla osób niepełnosprawnych?"',
          imageAsset: "assets/images/trip01/trip01_02.jpg",
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "2", stepLink: 4),
            SelectionItem(text: "0", stepLink: 4),
            SelectionItem(text: "1", stepLink: 4),
            SelectionItem(text: "3", stepLink: 4),
          ],
          correctSelection: 0,
          imageAsset: "assets/images/trip01/trip01_02.jpg",
          previousStep: 2,
        ),
        StepItem(
          type: StepType.answer,
          title: "Miejsca parkingowe",
          correctSelection: 0,
          correctAnswer:
              "Gratuluję! Rozwiązałeś pierwszą zagadkę. Możemy ruszać dalej.",
          incorrectAnswer:
              "Niestety! To nie jest prawidłowa odpowiedź. Przypatrz się dobrze niebieskiemu znakowi. Są tam 2 miejsca dla niepełnosprawnych. Ale nie przejmuj się. Pierwszy krok jest zawsze najtrudniejszy. Jesteś gotowy do dalszej drogi?",
          imageAsset: "assets/images/trip01/trip01_03.jpg",
          nextStep: 5,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do parku",
          description:
              "Teraz znajdź wejście do parku, które jest oznaczone niebieską tablicą. Jeśli już je znalazłeś, możemy rozpocząć drugie zadanie.",
          imageAsset: "assets/images/trip01/trip01_04.jpg",
          nextStep: 6,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to jest?",
          description:
              "Teraz wejdź do parku i poszukaj figury pewnej osoby z krzyżem w ręku. Pod tą figurą znajduje się napis. Od jakiej literki się zaczyna?",
          imageAsset: "assets/images/trip01/trip01_05.jpg",
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "F", stepLink: 8),
            SelectionItem(text: "O", stepLink: 8),
            SelectionItem(text: "B", stepLink: 8),
            SelectionItem(text: "K", stepLink: 8),
          ],
          correctSelection: 2,
          imageAsset: "assets/images/trip01/trip01_05.jpg",
          previousStep: 6,
        ),
        StepItem(
          type: StepType.answer,
          title: "Błogosławiony Franciszek Jordan",
          correctSelection: 2,
          correctAnswer:
              'Wspaniale! Pierwsza literka oznacza "Błogosławiony". Ojciec Franciszek Jordan jest założycielem Zgromadzenia Salwatorianów i sióstr Salwatorianek, którzy dzisiaj zamieszkują to miejsce. Został beatyfikowany 15 maja 2021 roku.',
          incorrectAnswer:
              "Niestety! To nie jest prawidłowa odpowiedź. Przypatrz się dobrze niebieskiemu znakowi. Są tam 2 miejsca dla niepełnosprawnych. Ale nie przejmuj się. Pierwszy krok jest zawsze najtrudniejszy. Jesteś gotowy do dalszej drogi?",
          imageAsset: "assets/images/trip01/trip01_06.jpg",
          nextStep: 9,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy do altanki",
          description:
              "Teraz czas, aby wejść głębiej do parku. Idąc po schodkach zobaczysz po lewej stronie piękną niebieską altankę. Znalazłeś już do niej drzwi?",
          imageAsset: "assets/images/trip01/trip01_07.jpg",
          nextStep: 10,
        ),
        StepItem(
          type: StepType.info,
          title: "Policz słupki",
          description:
              'To zadanie wymaga, abyś wszedł do altanki. A teraz popatrz przez szybę na zewnątrz i policz charakterystyczne słupki, które stoją przy alejce. Ile ich jest?',
          imageAsset: "assets/images/trip01/trip01_08.jpg",
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "6", stepLink: 12),
            SelectionItem(text: "4", stepLink: 12),
            SelectionItem(text: "5", stepLink: 12),
            SelectionItem(text: "7", stepLink: 12),
          ],
          correctSelection: 2,
          imageAsset: "assets/images/trip01/trip01_08.jpg",
          previousStep: 10,
        ),
        StepItem(
          type: StepType.answer,
          title: "Słupki z lampkami",
          correctSelection: 2,
          correctAnswer:
              'Brawo! To są słupki, które w nocy świecą, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzić pomiędzy zamkiem a ogrodem.',
          incorrectAnswer:
              'Niestety! Jest tam 5 słupków, które w nocy świecą, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzić pomiędzy zamkiem a ogrodem. Jesteś gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_09.jpg",
          nextStep: 13,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy labiryntu",
          description:
              'Z altanki jest już bardzo blisko do labiryntu. Ale czy potrafisz go odnaleźć? Idź za słupkami, które właśnie policzyłeś, a znajdziesz wejście do labiryntu',
          imageAsset: "assets/images/trip01/trip01_10.jpg",
          nextStep: 14,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to powiedział?",
          description:
              'W labiryncie łatwo się zgubić. Poszukaj drogowskazu ze zdjęcia, a obok niego będzie tabliczka z napisem: "Gdy człowiek nie wie, co zrobić, sumienie mówi mu tylko jedno: szukaj!" Pod tym napisem znajdują się imiona i nazwisko autora. Podaj jego inicjały.',
          imageAsset: "assets/images/trip01/trip01_11.jpg",
          previousStep: 13,
          nextStep: 15,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "TA", stepLink: 16),
            SelectionItem(text: "TS", stepLink: 16),
            SelectionItem(text: "A", stepLink: 16),
            SelectionItem(text: "JST", stepLink: 16),
          ],
          correctSelection: 3,
          imageAsset: "assets/images/trip01/trip01_11.jpg",
          previousStep: 14,
        ),
        StepItem(
          type: StepType.answer,
          title: "Józef Stanisław Tischner",
          correctSelection: 3,
          correctAnswer:
              'Gratuluję! Odkryłeś myśl sławnego polskiego filozofa, którą warto zapamiętać. Czy jesteś gotowy na kolejne wyzwanie?',
          incorrectAnswer:
              'Niestety! To nie jest właściwa odpowiedź. Szukaliśmy myśli sławnego polskiego filozofa - Józefa Stanisława Tischnera, którą warto zapamiętać. Czy jesteś gotowy na kolejne wyzwanie?',
          imageAsset: "assets/images/trip01/trip01_12.jpg",
          nextStep: 17,
        ),
        StepItem(
          type: StepType.info,
          title: "Kierujemy się do Matki Bożej",
          description:
              'Wychodzimy wreszcie z labiryntu, skręcamy w lewo w stronę altanki, a przy altance znowu skręcamy w lewo. Przed tobą będzie alejka, a na jej końcu coś ciekawego wisi na drzewie. Czy wiesz już co to jest?',
          imageAsset: "assets/images/trip01/trip01_13.jpg",
          nextStep: 18,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za drzewo?",
          description:
              'Salwatorianie bardzo kochają Matkę Bożą i często się do Niej modlą. Pod tą ikoną na drzewie jest napis: "Przechodząc obok, pozdrów Maryję". Czy potrafisz odgadnąć na jakim drzewie wisi ta ikona? Podpowiedź znajduje się nieopodal na małym zielonym znaczku.',
          imageAsset: "assets/images/trip01/trip01_14.jpg",
          previousStep: 17,
          nextStep: 19,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "Dąb", stepLink: 20),
            SelectionItem(text: "Buk", stepLink: 20),
            SelectionItem(text: "Sosna", stepLink: 20),
            SelectionItem(text: "Topola", stepLink: 20),
          ],
          correctSelection: 0,
          imageAsset: "assets/images/trip01/trip01_14.jpg",
          previousStep: 18,
        ),
        StepItem(
          type: StepType.answer,
          title: "Dąb szypułkowy",
          correctSelection: 0,
          correctAnswer:
              'Tak jest! Dąb to silne i wspaniałe drzewo. Jeśli się rozejrzysz, to zauważysz, że w parku znajduje się wiele ogromnych dębów.',
          incorrectAnswer:
              'Niestety! Odpowiedź to dąb - silne i wspaniałe drzewo. Jeśli się rozejrzysz, to zauważysz, że w parku znajduje się wiele ogromnych dębów.',
          imageAsset: "assets/images/trip01/trip01_15.jpg",
          nextStep: 21,
        ),
        StepItem(
          type: StepType.info,
          title: "Biegniemy do groty",
          description:
              'Jeśli się obrócisz w stronę parku, to napewno zobaczysz dużą górę kamieni. To jest grota z figurą Matki Bożej. Biegniemy do Niej?',
          imageAsset: "assets/images/trip01/trip01_16.jpg",
          nextStep: 22,
        ),
        StepItem(
          type: StepType.info,
          title: "Znajdź napis na kamieniu",
          description:
              'Jest to wyjątkowa grota na wzór tej, w której Matka Boża objawiła się małej Bernadce w Lourdes we Francji. Poleciła jej wtedy, aby modliła się na różańcu. Dlatego zakonnicy od wielu lat modlą się tutaj różaniec oraz przychodzą na nabożeństwa majowe.\nJeśli chcesz wiedzieć jak długo stoi tutaj ta grota, to spróbuj odnaleźć datę wypisaną na jednym z kamieni.',
          imageAsset: "assets/images/trip01/trip01_17.jpg",
          previousStep: 21,
          nextStep: 23,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "1953", stepLink: 24),
            SelectionItem(text: "1918", stepLink: 24),
            SelectionItem(text: "1932", stepLink: 24),
            SelectionItem(text: "1939", stepLink: 24),
          ],
          correctSelection: 2,
          imageAsset: "assets/images/trip01/trip01_17.jpg",
          previousStep: 22,
        ),
        StepItem(
          type: StepType.answer,
          title: "Rok budowy groty",
          correctSelection: 2,
          correctAnswer:
              'Masz rację. Już w 1932 roku Salwatorianie niemieccy wybudowali tutaj tę grotę i modlili się w jej cieniu. Jeśli jesteś zmęczony możesz usiąść sobie na ławce, popatrzeć trochę na figurę Matki Bożej i odmówić znaną ci modlitwę.\nNie myśl jednak, że to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          incorrectAnswer:
              'Niestety pojawił się gdzieś błąd. Poprawna odpowiedź to rok 1932, kiedy Salwatorianie niemieccy wybudowali tutaj tę grotę i modlili się w jej cieniu. Jeśli jesteś zmęczony możesz usiąść sobie na ławce, popatrzeć trochę na figurę Matki Bożej i odmówić znaną ci modlitwę.\nNie myśl jednak, że to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          imageAsset: "assets/images/trip01/trip01_18.jpg",
          nextStep: 25,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stronę zamku",
          description:
              'Popatrz po raz ostatni na figurę Matki Bożej i obróć się. Czy widzisz już duży zamek za krzewem rododendronu? Tam znajdziesz kolejną ciekawostkę.',
          imageAsset: "assets/images/trip01/trip01_19.jpg",
          nextStep: 26,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za postacie?",
          description:
              'Kiedy patrzysz na taki ładny zamek może się dziwisz, że mieszkają w nim zakonnicy. Jak to się stało? Historia tego zamku jest długa i bardzo ciekawa, ale opowiem ci ją innym razem.\nTeraz popatrz na dwie białe figury. Jedna trzyma w ręku klucze, a druga miecz. Są to Apostołowie. Czy rozpoznajesz już jak się nazywają? Napisz tutaj pierwsze litery ich imion.',
          imageAsset: "assets/images/trip01/trip01_20.jpg",
          previousStep: 25,
          nextStep: 27,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "PA", stepLink: 28),
            SelectionItem(text: "PJ", stepLink: 28),
            SelectionItem(text: "PT", stepLink: 28),
            SelectionItem(text: "PP", stepLink: 28),
          ],
          correctSelection: 3,
          imageAsset: "assets/images/trip01/trip01_20.jpg",
          previousStep: 26,
        ),
        StepItem(
          type: StepType.answer,
          title: "Apostołowie Piotr i Paweł",
          correctSelection: 3,
          correctAnswer:
              'Zgadza się! Są to święty Piotr z kluczami i święty Paweł z mieczem. Przypominają nam, że każdy z nas jest powołany do bycia apostołem Pana Jezusa.\nA teraz w tył zwrot. Czeka nas długa droga w sam środek parku.',
          incorrectAnswer:
              'Niestety nie! Są to święty Piotr z kluczami i święty Paweł z mieczem. Przypominają nam, że każdy z nas jest powołany do bycia apostołem Pana Jezusa.\nA teraz w tył zwrot. Czeka nas długa droga w sam środek parku.',
          imageAsset: "assets/images/trip01/trip01_21.jpg",
          nextStep: 29,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do diaspory",
          description:
              'Wróć teraz do groty i przejdź obok niej mijając ją po prawej stronie. Czy widzisz w oddali małą drewnianą kapliczkę? Nazywa się diaspora. Tam właśnie idziemy!',
          imageAsset: "assets/images/trip01/trip01_22.jpg",
          nextStep: 30,
        ),
        StepItem(
          type: StepType.info,
          title: "Ciekawe co jest w środku?",
          description:
              'Możesz wejść do środka. Jest tam zazwyczaj dosyć ciemno, więc zapal światło. Włącznik znajduje się po prawej stronie. Myślę, że teraz z łatwością zobaczysz w centrum figurę Matki Bożej z Dzieciątkiem.\nCo Matka Boża trzyma w ręku razem z Dzieciątkiem?',
          imageAsset: "assets/images/trip01/trip01_23.jpg",
          previousStep: 29,
          nextStep: 31,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "Różaniec", stepLink: 32),
            SelectionItem(text: "Krzyż", stepLink: 32),
            SelectionItem(text: "Kwiaty", stepLink: 32),
            SelectionItem(text: "Chustkę", stepLink: 32),
          ],
          correctSelection: 0,
          imageAsset: "assets/images/trip01/trip01_23.jpg",
          previousStep: 30,
        ),
        StepItem(
          type: StepType.answer,
          title: "Różaniec",
          correctSelection: 0,
          correctAnswer:
              'Oczywiście! Matka Boża i Dzieciątko razem trzymają w ręku różaniec. Była to ulubiona modlitwa błogosławionego Franciszka Jordana, którego spotkaliśmy na początku naszej podróży. Gdziekolwiek szedł, zawsze w kieszeni przesuwał paciorki różańca.\nA czy ty potrafisz modlić się na różańcu?',
          incorrectAnswer:
              'Jesteś pewien? Matka Boża i Dzieciątko razem trzymają w ręku różaniec. Była to ulubiona modlitwa błogosławionego Franciszka Jordana, którego spotkaliśmy na początku naszej podróży. Gdziekolwiek szedł, zawsze w kieszeni przesuwał paciorki różańca.\nA czy ty potrafisz modlić się na różańcu?',
          imageAsset: "assets/images/trip01/trip01_24.jpg",
          nextStep: 33,
        ),
        StepItem(
          type: StepType.info,
          title: "Chcemy zobaczyć obelisk",
          description:
              'Po wyjściu z diaspory idź ścieżką na prawo aż zobaczysz w oddali ciekawy obelisk. Jest on na końcu parku. Doszedłeś już tam?',
          imageAsset: "assets/images/trip01/trip01_25.jpg",
          nextStep: 34,
        ),
        StepItem(
          type: StepType.info,
          title: "Co tam jest napisane?",
          description:
              'Ten obelisk postawili tutaj salwatorianie niemieccy jeszcze przed wojną. Przypomina on najważniejsze zasady każdego salwatorianina, czyli śluby zakonne. Są wypisane w języku łacińskim na czterech stronach obelisku. Jaka jest pełna nazwa ślubu na literę "C"?',
          imageAsset: "assets/images/trip01/trip01_26.jpg",
          previousStep: 33,
          nextStep: 35,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "Crux", stepLink: 36),
            SelectionItem(text: "Caritas", stepLink: 36),
            SelectionItem(text: "Castitas", stepLink: 36),
            SelectionItem(text: "Coelus", stepLink: 36),
          ],
          correctSelection: 2,
          imageAsset: "assets/images/trip01/trip01_26.jpg",
          previousStep: 34,
        ),
        StepItem(
          type: StepType.answer,
          title: "Czystość",
          correctSelection: 2,
          correctAnswer:
              'Tak jest - CASTITAS. To oznacza w języku łacińskim ślub bezżennej czystości. Nie chodzi tu oczywiście o częste mycie rąk, ale o oddanie całego siebie Panu Bogu. Dlatego właśnie zakonnicy nie zakładają rodzin, aby całkowicie poświęcić się Bogu i służyć wszystkim.\nDalej już nie pójdziemy. Musimy tu zawrócić. Jesteś gotowy?',
          incorrectAnswer:
              'Gdzieś pojawił się błąd! Poprawna nazwa to - CASTITAS. To oznacza w języku łacińskim ślub bezżennej czystości. Nie chodzi tu oczywiście o częste mycie rąk, ale o oddanie całego siebie Panu Bogu. Dlatego właśnie zakonnicy nie zakładają rodzin, aby całkowicie poświęcić się Bogu i służyć wszystkim.\nDalej już nie pójdziemy. Musimy tu zawrócić. Jesteś gotowy?',
          imageAsset: "assets/images/trip01/trip01_27.jpg",
          nextStep: 37,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy niezwykłego drzewa",
          description:
              'Pewno jesteś już zmęczony, ale jeszcze trochę wytrzymaj. Stojąc tyłem do obelisku powolutku idź w lewą stronę wzdłuż płotu. Przejdziesz przez mały mostek, aż dotrzesz do końca ścieżki. Po lewej stronie będzie duży ceglany dom - to jest nowicjat. Tam mieszkają kandydaci do życia zakonnego.\nTy jednak skręć w prawo, a po kilkunastu krokach zobaczysz po prawej stronie niezwykłe drzewo.',
          imageAsset: "assets/images/trip01/trip01_28.jpg",
          nextStep: 38,
        ),
        StepItem(
          type: StepType.info,
          title: "Literka na czerwonym tle",
          description:
              'I co? Jak ci się podoba?\nMożesz sobie odpocząć w cieniu tego starego drzewa i wyobrazić stare dzieje zakonne. Kiedy będziesz gotowy, poszukaj pewnej literki na czerwonym tle. Jest niedaleko.\nJaka to literka?',
          imageAsset: "assets/images/trip01/trip01_29.jpg",
          previousStep: 37,
          nextStep: 39,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "H", stepLink: 40),
            SelectionItem(text: "G", stepLink: 40),
            SelectionItem(text: "T", stepLink: 40),
            SelectionItem(text: "S", stepLink: 40),
          ],
          correctSelection: 0,
          imageAsset: "assets/images/trip01/trip01_29.jpg",
          previousStep: 38,
        ),
        StepItem(
          type: StepType.answer,
          title: "Hydrant",
          correctSelection: 0,
          correctAnswer:
              'Bardzo dobrze! Ta literka oznacza Hydrant, czyli miejsce podłączenia do wody. W razie pożaru strażacy będą mogli tam podpiąć swój sprzęt i ugasić ogień. Miejmy nadzieję, że nigdy nie będą musieli tego robić.\nTo co? Jesteś gotowy do dalszej drogi?',
          incorrectAnswer:
              'Oj, niedobrze! Ta literka to "H" i oznacza Hydrant, czyli miejsce podłączenia do wody. W razie pożaru strażacy będą mogli tam podpiąć swój sprzęt i ugasić ogień. Miejmy nadzieję, że nigdy nie będą musieli tego robić.\nTo co? Jesteś gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_30.jpg",
          nextStep: 41,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stronę stawu",
          description:
              'Jeśli jeszcze jesteś przy hydrancie i patrzysz w stronę zamku, to idź w lewą stronę. Dojdziesz do stawu, a jeśli będziesz miał szczęście, to zobaczysz kaczki, czerwone karpie, albo nawet czaplę.',
          imageAsset: "assets/images/trip01/trip01_31.jpg",
          nextStep: 42,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile lat ma seminarium?",
          description:
              'Teraz idź w stronę dziedzińca zamkowego przechodząc pod zabytkowym łukiem. W środku dziedzińca zobaczysz fontannę, a jeszcze dalej wejście do klasztoru, czyli furtę klasztorną. Jest to miejsce, gdzie zakonnik pełni dyżur i przyjmuje gości. Tam też możesz skorzystać z toalety.\nA teraz zadanie! Obok drewnianych drzwi jest mosiężna jubileuszowa tablica, na której napisany jest rok powstania seminarium. Jaki to rok?',
          imageAsset: "assets/images/trip01/trip01_32.jpg",
          previousStep: 41,
          nextStep: 43,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "1918", stepLink: 44),
            SelectionItem(text: "1953", stepLink: 44),
            SelectionItem(text: "1932", stepLink: 44),
            SelectionItem(text: "1939", stepLink: 44),
          ],
          correctSelection: 1,
          imageAsset: "assets/images/trip01/trip01_32.jpg",
          previousStep: 42,
        ),
        StepItem(
          type: StepType.answer,
          title: "Rok założenia seminarium",
          correctSelection: 1,
          correctAnswer:
              'Wspaniale! W roku 1953 powstało w tym zamku Wyższe Seminarium Duchowne Salwatorianów. Jest to taka szkoła, w której młodzi klerycy uczą się, aby w przyszłości zostać księżmi. Być może miałeś okazję spotkać jakiegoś kleryka w czarnym habicie podczas naszej podróży po parku.\nNo to pomału będziemy kończyć. Pozostało nam jeszcze tylko jedno miejsce. Jesteś gotowy?',
          incorrectAnswer:
              'Nie do końca! Chodzi o rok 1953, w którym powstało w tym zamku Wyższe Seminarium Duchowne Salwatorianów. Jest to taka szkoła, w której młodzi klerycy uczą się, aby w przyszłości zostać księżmi. Być może miałeś okazję spotkać jakiegoś kleryka w czarnym habicie podczas naszej podróży po parku.\nNo to pomału będziemy kończyć. Pozostało nam jeszcze tylko jedno miejsce. Jesteś gotowy?',
          imageAsset: "assets/images/trip01/trip01_33.jpg",
          nextStep: 45,
        ),
        StepItem(
          type: StepType.info,
          title: "Wracamy na parking",
          description:
              'Jeśli idziesz spod furty po schodach na dół, kieruj się na prawo. Tam właśnie jest parking, skąd rozpoczęliśmy naszą wędrówkę.\nNie myśl jednak, że to już koniec. Pozostało nam przecież ostatnie zadanie.',
          imageAsset: "assets/images/trip01/trip01_34.jpg",
          nextStep: 46,
        ),
        StepItem(
          type: StepType.info,
          title: "Jaki skrót mają Salwatorianie?",
          description:
              'Idąc w stronę parkingu będziesz przechodził przez zieloną bramę, która zawsze jest otwarta. Na tej bramie znajduje się skrót Salwatorianów. Są to trzy białe literki. Widzisz już je?',
          imageAsset: "assets/images/trip01/trip01_35.jpg",
          previousStep: 45,
          nextStep: 47,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "SSD", stepLink: 48),
            SelectionItem(text: "SDB", stepLink: 48),
            SelectionItem(text: "SDS", stepLink: 48),
            SelectionItem(text: "SJ", stepLink: 48),
          ],
          correctSelection: 2,
          imageAsset: "assets/images/trip01/trip01_35.jpg",
          previousStep: 46,
        ),
        StepItem(
          type: StepType.answer,
          title: "Salwatorianie",
          correctSelection: 2,
          correctAnswer:
              'Gratuluję! SDS to skrót łacińskiej nazwy "Societas Divini Salvatoris", czyli po polsku "Towarzystwo Boskiego Zbawiciela" - Salwatorianie.\nW ten sposób zakończyłeś pomyślnie ostatnie zadanie i naszą podróż. Jestem z ciebie dumny.',
          incorrectAnswer:
              'No prawie! Chodziło o SDS - skrót łacińskiej nazwy "Societas Divini Salvatoris", czyli po polsku "Towarzystwo Boskiego Zbawiciela" - Salwatorianie.\nW ten sposób zakończyłeś pomyślnie ostatnie zadanie i naszą podróż. Jestem z ciebie dumny.',
          imageAsset: "assets/images/trip01/trip01_36.jpg",
          nextStep: 49,
        ),
        StepItem(
          type: StepType.end,
          title: "Gratuluję Odkrywco!",
          description:
              'Spisałeś się na medal i ukończyłeś pierwszą podróż po naszym klasztorze. Znasz już park i okolice zamku, ale wiele tajemnic jeszcze przed tobą.\n\nJeśli znowu do nas przyjedziesz, to zapraszam do kolejnej podróży.\n\nDo zobaczenia!',
          imageAsset: "assets/images/trip_01.png",
          previousStep: -1,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "02", // TODO: must fix
      stepList: <StepItem>[
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 1",
          nextStep: 1,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 2",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 3",
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 4",
          previousStep: 2,
          nextStep: 4,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 5",
          previousStep: 3,
          nextStep: 5,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 6",
          previousStep: 4,
          nextStep: 6,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 7",
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 8",
          previousStep: 6,
          nextStep: 8,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 9",
          previousStep: 7,
          nextStep: 9,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 10",
          previousStep: 8,
          nextStep: 10,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 11",
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 12",
          previousStep: 10,
          nextStep: 12,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 13",
          previousStep: 11,
          nextStep: 13,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Stacja 14",
          previousStep: 12,
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
    TripItem(
      uid: "03", // TODO: must fix
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      time: "45",
      age: "12+",
      distance: "0,7",
      rating: "4,5",
      description:
          "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_02.png",
      enabled: false,
      stepList: <StepItem>[
        StepItem(
          title: "Step 1",
          nextStep: 1,
        ),
        StepItem(
          title: "Step 2",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          title: "Step 3",
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          title: "Step 4",
          previousStep: 2,
        ),
      ],
    ),
  ];
}
