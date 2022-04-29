/// This class will handle data loading from FireBase

import 'package:kompas/statics/constants.dart';

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
    this.countPoints = true,
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
  bool countPoints;

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
        assert(false, 'getTypeStr(TripPropertyType type) must switch on predefined types');
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
    this.caption = "",
    this.description = "Description",
    this.selection = const [],
    this.correctSelection = 0, // TODO: run tests to check if this variable is set the same for select and answer steps
    this.correctAnswer = "Correct!",
    this.incorrectAnswer = "Unfortunately this is not correct.",
    this.previousStep = -1,
    this.nextStep = -1,
  });

  StepType type;
  String imageAsset;
  String caption;
  String title;
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
      subtitle: "dla całej rodziny",
      time: "40",
      age: "6+",
      distance: "1,2",
      rating: "4,8",
      description: "Poznaj tajemnice klasztornego parku odkrywając ciekawe miejsca i rozwiązując zadania.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
      countPoints: true,
      stepList: <StepItem>[
        StepItem(
          type: StepType.info,
          title: "Witam serdecznie w naszym parku",
          description:
              "Zapraszam Cię, Drogi Podróżniku, do wspólnej przygody dla całej rodziny - od najmłodszego do najstarszego.\n\nPodczas naszej podróży po klasztornym parku poznasz wiele pięknych i ciekawych miejsc. Czekają tam również na Ciebie zagadki i zadania, z którymi na pewno świetnie sobie poradzisz.\n\nZacznijmy jednak od początku, a więc od parkingu przy wjeździe do naszego klasztoru.",
          imageAsset: "assets/images/trip_01.png",
          nextStep: 1,
        ),
        StepItem(
          type: StepType.info,
          title: "Stawiamy pierwszy krok",
          description:
              "Skoro jesteś na parkingu, to na pewno masz za sobą długą podróż.\n\nRozprostuj nogi, pomachaj rękami i rozejrzyj się wokoło. Czy rozpoznajesz miejsce na zdjęciu?\n\nJeśli tak, to jesteś gotowy do pierwszego zadania.",
          imageAsset: "assets/images/trip01/trip01_01.jpg",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile jest miejsc?",
          description:
              'Poszukaj niebieskiego znaku na parkingu i odpowiedz na następujące pytanie:\n\n„Ile miejsc na parkingu jest zarezerwowanych dla osób niepełnosprawnych?”',
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
          correctAnswer: "Gratuluję! Rozwiązałeś pierwszą zagadkę.\n\nMożemy ruszać dalej.",
          incorrectAnswer:
              "Niestety! To nie jest prawidłowa odpowiedź.\n\nPrzypatrz się dobrze niebieskiemu znakowi. Są tam dwa miejsca dla niepełnosprawnych. Ale nie przejmuj się. Pierwszy krok jest zawsze najtrudniejszy.\n\nJesteś gotowy do dalszej drogi?",
          imageAsset: "assets/images/trip01/trip01_03.jpg",
          nextStep: 5,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do parku",
          description:
              "Teraz znajdź wejście do parku, które jest oznaczone niebieską tablicą.\n\nJeśli już je znalazłeś, możemy rozpocząć drugie zadanie.",
          imageAsset: "assets/images/trip01/trip01_04.jpg",
          nextStep: 6,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to jest?",
          description:
              "Teraz wejdź do parku i poszukaj figury pewnej osoby z krzyżem w ręku. Pod tą figurą znajduje się napis.\n\nOd jakiej literki się zaczyna?",
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
              'Wspaniale! Pierwsza literka oznacza „Błogosławiony”.\n\nOjciec Franciszek Jordan jest założycielem Zgromadzenia Salwatorianów i sióstr Salwatorianek, którzy dzisiaj zamieszkują to miejsce.\n\nZostał beatyfikowany 15 maja 2021 roku.',
          incorrectAnswer:
              'Niestety! To nie jest prawidłowa odpowiedź. Pierwsza literka to „B” i oznacza „Błogosławiony”.\n\nOjciec Franciszek Jordan jest założycielem Zgromadzenia Salwatorianów i sióstr Salwatorianek, którzy dzisiaj zamieszkują to miejsce.\n\nZostał beatyfikowany 15 maja 2021 roku.',
          imageAsset: "assets/images/trip01/trip01_06.jpg",
          nextStep: 9,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy do altanki",
          description:
              "Teraz czas, aby wejść głębiej do parku.\n\nIdąc po schodkach zobaczysz po lewej stronie piękną niebieską altankę. Znalazłeś już do niej drzwi?",
          imageAsset: "assets/images/trip01/trip01_07.jpg",
          nextStep: 10,
        ),
        StepItem(
          type: StepType.info,
          title: "Policz słupki",
          description:
              'To zadanie wymaga, abyś wszedł do altanki.\n\nA teraz popatrz przez szybę na zewnątrz i policz charakterystyczne srebrne słupki, które stoją przy alejce.\n\nIle ich jest?',
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
              'Brawo!\n\nTo są słupki, które w nocy świecą, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzić pomiędzy zamkiem a ogrodem.\n\nJesteś gotowy do dalszej drogi?',
          incorrectAnswer:
              'Niestety! Jest tam 5 słupków, które w nocy świecą, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzić pomiędzy zamkiem a ogrodem.\n\nJesteś gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_09.jpg",
          nextStep: 13,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy labiryntu",
          description:
              'Z altanki jest już bardzo blisko do labiryntu. Ale czy potrafisz go odnaleźć?\n\nIdź za słupkami, które właśnie policzyłeś, a znajdziesz do niego wejście.',
          imageAsset: "assets/images/trip01/trip01_10.jpg",
          nextStep: 14,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to powiedział?",
          description:
              'W labiryncie łatwo się zgubić.\n\nPoszukaj drogowskazu ze zdjęcia, a obok niego będzie tabliczka z napisem: „Gdy człowiek nie wie, co zrobić, sumienie mówi mu tylko jedno: szukaj!”\n\nPod tym napisem znajdują się imiona i nazwisko autora. Podaj jego inicjały.',
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
              'Gratuluję! Odkryłeś myśl sławnego polskiego filozofa, którą warto zapamiętać.\n\nCzy jesteś gotowy na kolejne wyzwanie?',
          incorrectAnswer:
              'Niestety! To nie jest właściwa odpowiedź. Szukaliśmy myśli sławnego polskiego filozofa - Józefa Stanisława Tischnera, którą warto zapamiętać.\n\nCzy jesteś gotowy na kolejne wyzwanie?',
          imageAsset: "assets/images/trip01/trip01_12.jpg",
          nextStep: 17,
        ),
        StepItem(
          type: StepType.info,
          title: "Kierujemy się do Matki Bożej",
          description:
              'Wychodzimy wreszcie z labiryntu, skręcamy w lewo w stronę altanki, a przy altance znowu skręcamy w lewo.\n\nPrzed Tobą będzie alejka, a na jej końcu coś ciekawego wisi na drzewie.\n\nCzy wiesz już co to jest?',
          imageAsset: "assets/images/trip01/trip01_13.jpg",
          nextStep: 18,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za drzewo?",
          description:
              'Salwatorianie bardzo kochają Matkę Bożą i często się do Niej modlą. Pod tą ikoną na drzewie jest napis: „Przechodząc obok, pozdrów Maryję”.\n\nCzy potrafisz odgadnąć na jakim drzewie wisi ta ikona? Podpowiedź znajduje się nieopodal na małym zielonym znaczku.',
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
              'Tak jest!\n\nDąb to silne i wspaniałe drzewo. Jeśli się rozejrzysz, to zauważysz, że w parku znajduje się wiele ogromnych dębów.',
          incorrectAnswer:
              'Niestety! Odpowiedź to dąb - silne i wspaniałe drzewo.\n\nJeśli się rozejrzysz, to zauważysz, że w parku znajduje się wiele ogromnych dębów.',
          imageAsset: "assets/images/trip01/trip01_15.jpg",
          nextStep: 21,
        ),
        StepItem(
          type: StepType.info,
          title: "Biegniemy do groty",
          description:
              'Jeśli się obrócisz w stronę parku, to napewno zobaczysz dużą górę kamieni. To jest grota z figurą Matki Bożej.\n\nBiegniemy do Niej?',
          imageAsset: "assets/images/trip01/trip01_16.jpg",
          nextStep: 22,
        ),
        StepItem(
          type: StepType.info,
          title: "Znajdź napis na kamieniu",
          description:
              'Jesteśmy przy wyjątkowej grocie na wzór tej, w której Matka Boża objawiła się małej Bernadce w Lourdes we Francji. Poleciła jej wtedy, aby modliła się na różańcu. Dlatego zakonnicy od wielu lat modlą się tutaj różaniec oraz przychodzą na nabożeństwa majowe.\n\nJeśli chcesz wiedzieć jak długo stoi tutaj ta grota, to spróbuj odnaleźć datę wypisaną na jednym z kamieni.',
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
              'Masz rację. Już w 1932 roku Salwatorianie niemieccy wybudowali tutaj tę grotę i modlili się w jej cieniu.\n\nJeśli jesteś zmęczony możesz usiąść sobie na ławce, popatrzeć trochę na figurę Matki Bożej i odmówić znaną ci modlitwę.\n\nNie myśl jednak, że to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          incorrectAnswer:
              'Niestety pojawił się gdzieś błąd. Poprawna odpowiedź to rok 1932, kiedy Salwatorianie niemieccy wybudowali tutaj tę grotę i modlili się w jej cieniu.\n\nJeśli jesteś zmęczony możesz usiąść sobie na ławce, popatrzeć trochę na figurę Matki Bożej i odmówić znaną ci modlitwę.\n\nNie myśl jednak, że to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          imageAsset: "assets/images/trip01/trip01_18.jpg",
          nextStep: 25,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stronę zamku",
          description:
              'Popatrz po raz ostatni na figurę Matki Bożej i obróć się.\n\nCzy widzisz już duży zamek za krzewem rododendronu?\n\nTam znajdziesz kolejną ciekawostkę.',
          imageAsset: "assets/images/trip01/trip01_19.jpg",
          nextStep: 26,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za postacie?",
          description:
              'Kiedy patrzysz na taki ładny zamek może się dziwisz, że mieszkają w nim zakonnicy. Jak to się stało? Historia tego zamku jest długa i bardzo ciekawa, ale opowiem Ci ją innym razem.\n\nTeraz popatrz na dwie białe figury. Jedna trzyma w ręku klucze, a druga miecz. Są to Apostołowie. Czy rozpoznajesz już jak się nazywają?\n\nWybierz odpowiedź z pierwszymi literami ich imion.',
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
              'Zgadza się! Są to święty Piotr z kluczami i święty Paweł z mieczem. Przypominają nam, że każdy z nas jest powołany do bycia apostołem Pana Jezusa.\n\nA teraz w tył zwrot. Czeka nas długa droga w sam środek parku.',
          incorrectAnswer:
              'Niestety nie! Są to święty Piotr z kluczami i święty Paweł z mieczem. Przypominają nam, że każdy z nas jest powołany do bycia apostołem Pana Jezusa.\n\nA teraz w tył zwrot. Czeka nas długa droga w sam środek parku.',
          imageAsset: "assets/images/trip01/trip01_21.jpg",
          nextStep: 29,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do diaspory",
          description:
              'Wróć teraz do groty i przejdź obok niej mijając ją po prawej stronie.\n\nCzy widzisz w oddali małą drewnianą kapliczkę? Nazywa się diaspora. Tam właśnie idziemy!',
          imageAsset: "assets/images/trip01/trip01_22.jpg",
          nextStep: 30,
        ),
        StepItem(
          type: StepType.info,
          title: "Ciekawe co jest w środku?",
          description:
              'Możesz wejść do środka. Jest tam zazwyczaj dosyć ciemno, więc zapal światło. Włącznik znajduje się po prawej stronie.\n\nMyślę, że teraz z łatwością zobaczysz w centrum figurę Matki Bożej z Dzieciątkiem.\n\nCo Matka Boża trzyma w ręku razem z Dzieciątkiem?',
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
              'Oczywiście! Matka Boża i Dzieciątko razem trzymają w ręku różaniec.\n\nByła to ulubiona modlitwa błogosławionego Franciszka Jordana, którego spotkaliśmy na początku naszej podróży. Gdziekolwiek szedł, zawsze w kieszeni przesuwał paciorki różańca.\n\nA czy Ty potrafisz modlić się na różańcu?',
          incorrectAnswer:
              'Jesteś pewien? Matka Boża i Dzieciątko razem trzymają w ręku różaniec.\n\nByła to ulubiona modlitwa błogosławionego Franciszka Jordana, którego spotkaliśmy na początku naszej podróży. Gdziekolwiek szedł, zawsze w kieszeni przesuwał paciorki różańca.\n\nA czy Ty potrafisz modlić się na różańcu?',
          imageAsset: "assets/images/trip01/trip01_24.jpg",
          nextStep: 33,
        ),
        StepItem(
          type: StepType.info,
          title: "Zobaczmy obelisk",
          description:
              'Po wyjściu z diaspory idź ścieżką na prawo. Na skrzyżowaniu dróg skręć w prawo i idź dalej, aż zobaczysz w oddali ciekawy obelisk. Jest on przy narożniku parku.\n\nDoszedłeś już tam?',
          imageAsset: "assets/images/trip01/trip01_25.jpg",
          nextStep: 34,
        ),
        StepItem(
          type: StepType.info,
          title: "Co jest tutaj napisane?",
          description:
              'Ten obelisk postawili tutaj Salwatorianie niemieccy jeszcze przed drugą wojną światową.\n\nPrzypomina on najważniejsze zasady każdego Salwatorianina, czyli śluby zakonne. Są wypisane w języku łacińskim na czterech stronach obelisku.\n\nJaka jest pełna nazwa ślubu na literę „C”?',
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
              'Tak jest - CASTITAS. To oznacza w języku łacińskim ślub bezżennej czystości.\n\nNie chodzi tu oczywiście o częste mycie rąk, ale o oddanie całego siebie Panu Bogu. Dlatego właśnie zakonnicy nie zakładają rodzin, aby całkowicie poświęcić się Bogu i służyć wszystkim.\n\nDalej już nie pójdziemy. Musimy tu zawrócić. Jesteś gotowy?',
          incorrectAnswer:
              'Gdzieś pojawił się błąd! Poprawna nazwa to - CASTITAS. To oznacza w języku łacińskim ślub bezżennej czystości.\n\nNie chodzi tu oczywiście o częste mycie rąk, ale o oddanie całego siebie Panu Bogu. Dlatego właśnie zakonnicy nie zakładają rodzin, aby całkowicie poświęcić się Bogu i służyć wszystkim.\n\nDalej już nie pójdziemy. Musimy tu zawrócić. Jesteś gotowy?',
          imageAsset: "assets/images/trip01/trip01_27.jpg",
          nextStep: 37,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy niezwykłego drzewa",
          description:
              'Pewno jesteś już zmęczony, ale jeszcze trochę wytrzymaj.\n\nStojąc tyłem do obelisku, idź lewą stroną wzdłuż płotu. Przejdziesz przez mały mostek, aż dotrzesz do końca ścieżki.\n\nPo lewej stronie będzie duży ceglany dom - to jest nowicjat. Tam mieszkają kandydaci do życia zakonnego.\n\nTy jednak skręć w prawo, a po kilkunastu krokach zobaczysz po prawej stronie niezwykłe drzewo.',
          imageAsset: "assets/images/trip01/trip01_28.jpg",
          nextStep: 38,
        ),
        StepItem(
          type: StepType.info,
          title: "Literka na czerwonym tle",
          description:
              'I co? Jak Ci się podoba?\n\nMożesz sobie odpocząć w cieniu tego ogromnego drzewa i wyobrazić sobie stare dzieje zakonne. Kiedy będziesz gotowy, poszukaj pewnej literki na czerwonym tle. Jest niedaleko.\n\nJaka to literka?',
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
              'Bardzo dobrze! Ta literka oznacza hydrant, czyli miejsce podłączenia do wody.\n\nW razie pożaru strażacy będą mogli tam podpiąć swój sprzęt i ugasić ogień. Miejmy nadzieję, że nigdy nie będą musieli tego robić.\n\nTo co? Jesteś gotowy do dalszej drogi?',
          incorrectAnswer:
              'Oj, niedobrze! Ta literka to „H” i oznacza hydrant, czyli miejsce podłączenia do wody.\n\nW razie pożaru strażacy będą mogli tam podpiąć swój sprzęt i ugasić ogień. Miejmy nadzieję, że nigdy nie będą musieli tego robić.\n\nTo co? Jesteś gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_30.jpg",
          nextStep: 41,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stronę stawu",
          description:
              'Jeśli jeszcze jesteś przy hydrancie i patrzysz w stronę zamku, to idź w lewo.\n\nDojdziesz do stawu, a jeśli będziesz miał szczęście, to zobaczysz kaczki, czerwone karasie, albo nawet czaplę.',
          imageAsset: "assets/images/trip01/trip01_31.jpg",
          nextStep: 42,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile lat ma seminarium?",
          description:
              'Teraz idź w stronę dziedzińca zamkowego przechodząc pod zabytkowym łukiem.\n\nW środku dziedzińca zobaczysz fontannę, a jeszcze dalej wejście do klasztoru, czyli furtę klasztorną. Jest to miejsce, gdzie zakonnik pełni dyżur i przyjmuje gości. Tam też możesz skorzystać z toalety.\n\nA teraz zadanie! Obok drewnianych drzwi jest mosiężna jubileuszowa tablica, na której napisany jest rok powstania seminarium. Jaki to rok?',
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
              'Wspaniale! W roku 1953 powstało w tym zamku Wyższe Seminarium Duchowne Salwatorianów.\n\nJest to taka szkoła, w której młodzi klerycy uczą się, aby w przyszłości zostać księżmi. Być może miałeś okazję spotkać jakiegoś kleryka w czarnym habicie podczas naszej podróży po parku.\n\nNo to pomału będziemy kończyć. Pozostało nam jeszcze tylko jedno miejsce. Jesteś gotowy?',
          incorrectAnswer:
              'Nie do końca! Chodzi o rok 1953, w którym powstało w tym zamku Wyższe Seminarium Duchowne Salwatorianów.\n\nJest to taka szkoła, w której młodzi klerycy uczą się, aby w przyszłości zostać księżmi. Być może miałeś okazję spotkać jakiegoś kleryka w czarnym habicie podczas naszej podróży po parku.\n\nNo to pomału będziemy kończyć. Pozostało nam jeszcze tylko jedno miejsce. Jesteś gotowy?',
          imageAsset: "assets/images/trip01/trip01_33.jpg",
          nextStep: 45,
        ),
        StepItem(
          type: StepType.info,
          title: "Wracamy na parking",
          description:
              'Jeśli idziesz spod furty po schodach na dół, kieruj się na prawo. Tam właśnie jest parking, skąd rozpoczęliśmy naszą wędrówkę.\n\nNie myśl jednak, że to już koniec. Pozostało nam przecież ostatnie zadanie.',
          imageAsset: "assets/images/trip01/trip01_34.jpg",
          nextStep: 46,
        ),
        StepItem(
          type: StepType.info,
          title: "Jaki skrót mają Salwatorianie?",
          description:
              'Idąc w stronę parkingu będziesz przechodził przez zieloną bramę, która zawsze jest otwarta.\n\nNa tej bramie znajduje się skrót Salwatorianów. Są to trzy białe literki.\n\nWidzisz już je?',
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
              'Gratuluję! SDS to skrót łacińskiej nazwy „Societas Divini Salvatoris”, czyli po polsku „Towarzystwo Boskiego Zbawiciela” - Salwatorianie.\n\nW ten sposób zakończyłeś pomyślnie ostatnie zadanie i naszą podróż. Jestem z Ciebie dumny.',
          incorrectAnswer:
              'No prawie! Chodziło o SDS - skrót łacińskiej nazwy „Societas Divini Salvatoris”, czyli po polsku „Towarzystwo Boskiego Zbawiciela” - Salwatorianie.\n\nW ten sposób zakończyłeś pomyślnie ostatnie zadanie i naszą podróż. Jestem z Ciebie dumny.',
          imageAsset: "assets/images/trip01/trip01_36.jpg",
          nextStep: 49,
        ),
        StepItem(
          type: StepType.end,
          title: "Gratuluję Odkrywco!",
          description:
              'Spisałeś się na medal i ukończyłeś pierwszą podróż po naszym klasztorze. Znasz już park i okolice zamku, ale wiele tajemnic jeszcze przed Tobą.\n\nJeśli znowu do nas przyjedziesz, to zapraszam do kolejnej podróży.\n\nDo zobaczenia!',
          imageAsset: "assets/images/trip_01.png",
          previousStep: 48,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "02", // TODO: must fix
      title: "Droga Krzyżowa",
      subtitle: "dla wszystkich",
      time: "60",
      age: "18+",
      distance: "1,7",
      rating: "4,7",
      description: "Towarzysz Panu Jezusowi na drodze krzyżowej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
      countPoints: false,
      stepList: <StepItem>[
        StepItem(
          imageAsset: "assets/images/trip02/trip02_mapka.jpg",
          title: "Początek drogi ...",
          description:
              'Ta wyjątkowa droga krzyżowa ma swój początek w centralnej części naszego parku, po lewej stronie groty Matki Bożej. Jeśli jesteś u nas po raz pierwszy, warto skorzystać z mapki, która jest częścią tej aplikacji.\n\nPójście drogą krzyżową razem z Panem Jezusem wymaga ciszy i skupienia. Drogi Przyjacielu, niech piękno i spokój naszego parku pomogą Ci w wyjątkowy sposób przeżyć każdą stację tej drogi krzyżowej.',
          nextStep: 1,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_01.jpg",
          caption:
              "Rajska jabłoń (malus pumila)\nSymbol grzechu pierworodnego. Jezus przyszedł dla odkupienia wszystkich naszych grzechów.",
          title: "Stacja I\nJezus na śmierć skazany",
          description:
              """„Jakaż to istota otoczona tak wielkim poważaniem otrzyma istnienie? Jest nią człowiek, wielka i wspaniała postać żyjąca, cenniejsza w oczach Bożych niż całe stworzenie. Jest nią człowiek, dla niego istnieje niebo i ziemia, morze i całe stworzenie. Do jego zbawienia Bóg przywiązał taką wagę, że dla niego nie oszczędził nawet swego jedynego Syna. Bóg nie przestał czynić wszystkiego, by doprowadzić człowieka do siebie i posadzić go po swojej prawicy” (św. Jan Chryzostom).\n\nKrzyżu święty, nade wszystko, drzewo przenajszlachetniejsze!\nW żadnym lesie takie nie jest, jedno, na którym sam Bóg jest.\nSłodkie drzewo, słodkie gwoździe, rozkoszny owoc nosiło.""",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_02.jpg",
          caption:
              "Sosna limba (pinus cembra)\nTo drzewo skazane jest na samotne zmaganie się z przeciwnościami losu, z wichrami i śnieżycami. Jezus został odrzucony przez swój naród. Analizy drzewa krzyża wykazały, że Jezusowy krzyż wykonany został właśnie z sosny.",
          title: "Stacja II\nJezus bierze Krzyż na swoje ramiona",
          description:
              """„Krzyż według oceny powierzchownej może wydawać się czymś straszliwym. Gdy jednak wnikamy w jego treść, zrozumiemy, że powinniśmy gorąco go pragnąć. W doczesnym widzeniu rysuje się on przed nami jako drzewo śmierci, natomiast według oceny wiekuistej Chrystusa Pana, który na nim zawisł, jaśnieje nam jako drzewo życia. Narzędzie śmierci stało się dla nas źródłem życia. Krzyż jest drzewem łaski zapewniającej życie” (św. Bonawentura).\n\nSkłoń gałązki, drzewo święte, ulżyj członkom tak rozpiętym.\nOdmień teraz oną srogość, którąś miało z urodzenia.\nSpuść lekuchno i cichuchno ciało Króla niebieskiego.""",
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_03.jpg",
          caption:
              "Głóg dwuszyjkowy (crategus laevigata)\nTen ciernisty krzew symbolizuje cierpienie, ból i krew, zaś głóg - nadzieję.",
          title: "Stacja III\nJezus upada pod Krzyżem",
          description:
              """„Lepiej utracić honor, wszystkie dobra i życie, niż obrazić Boga choćby lekkim grzechem, bo grzech jest złem nieskończenie większym” (św. Maksymilian Maria Kolbe).\n\nTyś samo było dostojne, nosić światowe Zbawienie.\nPrzez cię przewóz jest naprawion, światu, który był zagubion;\nktóry święta Krew polała, co z Baranka wypłynęła.""",
          previousStep: 2,
          nextStep: 4,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_04.jpg",
          caption:
              "Lipa drobnolistna (tilla cordata)\nWedług pobożnych legend lipa stała się schronieniem Świętej Rodziny podczas ucieczki do Egiptu.",
          title: "Stacja IV\nJezus spotyka swoją matkę",
          description:
              """„Stając się Matką Jezusa, prawdziwego Boga i prawdziwego człowieka, Maryja stała się również naszą Matką. Jezus w swoim wielkim miłosierdziu zechciał nazwać nas swoimi braćmi i takim imieniem ustanawia nas wszystkich adoptowanymi dziećmi Maryi” (św. Jan Bosko).\n\nW jasełkach leżąc, gdy płakał, już tam był wszystko oglądał,\niż tak haniebnie umrzeć miał, gdy wszystek świat odkupić chciał;\nw on czas między zwierzętami, a teraz między łotrami.""",
          previousStep: 3,
          nextStep: 5,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_05.jpg",
          caption:
              "Bluszcz pospolity (hedera felix)\nBluszcz na podporze symbolizuje pomoc i wsparcie okazywane bliźnim.",
          title: "Stacja V\nSzymon Cyrenejczyk pomaga nieść Krzyż Jezusowi",
          description:
              """„Nie doszliśmy jeszcze do Boga, ale mamy z sobą naszego bliźniego. Weźmij więc na siebie tego, który ci towarzyszy w drodze, abyś doszedł do Tego, z którym pragniesz przebywać” (św. Augustyn).\n\nNiesłychana to jest dobroć, za kogo na krzyżu umrzeć.\nKtóż to może dzisiaj zdziałać, za kogo swoją duszę dać?\nSam to Pan Jezus wykonał, bo nas wiernie umiłował.""",
          previousStep: 4,
          nextStep: 6,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_06.jpg",
          caption:
              "Jaśmin (jasminum)\nRoślina oblepiona wiosną białymi kwiatami, a później kulkami owoców, na całe miesiące uosabia swym kolorem i zapachem prostą dobroć. Kwiaty jaśminu symbolizują białą chustę.",
          title: "Stacja VI\nWeronika ociera twarz Chrystusowi",
          description:
              """„Powinno się być dobrym jak chleb. Powinno się być dobrym jak chleb, który dla wszystkich leży na stole, z którego każdy może dla siebie kęs odkroić, nakarmić się, jeśli jest głodny” (św. Brat Albert).\n\nNędzne by to serce było, co by dziś nie zapłakało,\nwidząc Stworzyciela swego na krzyżu zawieszonego,\nna słońcu upieczonego, Baranka wielkanocnego.""",
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_07.jpg",
          caption:
              "Ognik szkarłatny, odmiana czerwonoowocowa (pyracantha coccinea)\nCięty na wysokość 1,5 m; grona czerwonych kulek - owoce tego ciernistego krzewu przypominają o krwawej ofierze Jezusa, o Jego cierpieniu i bólu.",
          title: "Stacja VII\nJezus upada po raz drugi",
          description:
              """„Wydaje mi się, że w głębi mojego serca Bóg umieścił wiele łaski współczucia dla cierpień innych, a szczególnie dla ludzi ubogich i potrzebujących. Współczucie rodzi w mym sercu pragnienie przyjścia im z pomocą” (św. Ojciec Pio).\n\nMaryja, matka patrzyła na członki, co powijała;\npowijając całowała, z tego wielką radość miała.\nTeraz je widzi sczerniałe, żyły, stawy w Nim porwane.""",
          previousStep: 6,
          nextStep: 8,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_08.jpg",
          caption:
              "Trzy brzozy brodawkowate (betula pendula)\nBrzoza, gdy trzeba, jest drzewem radosnym, ale też potrafi delikatnie zwieszać gałązki ku ziemi. Brzoza symbolizuje kobiecość. Jej zwisające gałązki, obłamane wiosną - płaczą (wydzielają kroplami sok).",
          title: "Stacja VIII\nJezus pociesza płaczące niewiasty",
          description:
              """„Kobieta, jak uczy doświadczenie, jest nade wszystko sercem wspólnoty rodzinnej. Ona daje życie - i ona też pierwsza wychowuje. Oczywiście wspomagana przez męża i dzieląc z nim systematycznie cały zakres powinności rodzicielskich i wychowawczych. Jednakże wiadomo, że organizm ludzki przestaje żyć, gdy zabraknie pracy serca. Analogia jest dość przejrzysta” (św. Jan Paweł II).\n\nNie był taki, ani będzie żadnemu smutek na świecie,\njaki czysta Panna miała wonczas, kiedy narzekała:\nNędzna ja sierota dzisiaj, do kogóż ja się skłonić mam?""",
          previousStep: 7,
          nextStep: 9,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_09.jpg",
          caption:
              "Głóg ostrogłowy (crategus crus galli)\nProwadzony jako drzewko. Znów krwawe jagody, znów kolce korony cierniowej. Cierpienie, ból.",
          title: "Stacja IX\nJezus upada po raz trzeci",
          description:
              """„Każdy dobry chrześcijanin winien być bardziej skory do ocalenia wypowiedzi bliźniego niż do jej potępienia. A jeśli nie może jej ocalić, niech spyta go, jak on ją rozumie, a jeśli on rozumie ją źle, niech go poprawi z miłością. A jeśli to nie wystarcza, niech szuka wszelkich środków stosownych do tego, aby on, dobrze ją rozumiejąc, mógł się ocalić” (św. Ignacy Loyola).\n\nJednegom Synaczka miała, com Go z nieba być poznała,\ni tegom już postradała, jenom sama się została.\nCiężki ból cierpi me serce, od żalu mi się rozpaść chce.""",
          previousStep: 8,
          nextStep: 10,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_10.jpg",
          caption:
              "Czerwona pnąca róża (rosa)\nKrew, kolce. Róża jest symbolem czystości; czerwona symbolizuje miłość i uwielbienie, a pnącze - chęć ukrycia nagości.",
          title: "Stacja X\nJezus z szat obnażony",
          description:
              """„Nie powinniśmy oceniać ubogich według ich odzienia lub wyglądu ani według przymiotów ducha, które wydają się posiadać, skoro najczęściej są ludźmi niewykształconymi i prostymi. Gdy jednak popatrzycie na nich w świetle wiary, wtedy ujrzycie, że zastępują oni Syna Bożego, który zechciał być ubogim. W czasie swej męki nie miał prawie wyglądu człowieka. Poganom wydawał się szalonym, dla Żydów był kamieniem obrazy” (św. Wincenty a Paulo).\n\nW radościm Go porodziła, smutku żadnego nie miała.\nA teraz wszystkie boleści dręczą mnie dziś bez litości;\nobymże Ja to mogła mieć, żebym mogła teraz umrzeć.""",
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_11.jpg",
          caption:
              "Buk pospolity w odmianie purpurowej (fagus silvatica purpurea)\nKrwistoczerwone liście symbolizują krew Chrystusa.",
          title: "Stacja XI\nJezus do Krzyża przybity",
          description:
              """„Ludzie potrzebują naszych rąk, by im służyły. Naszych nóg, by ich odwiedzały. Naszych ust, by życzliwie do nich mówiły. Naszych serc, by kochały. Kwiat rozwija się, gdy świeci słońce, a człowiek rozwija się, gdy kocha” (św. Matka Teresa z Kalkuty).\n\nByś mi, Synu, nisko wisiał, wżdybyś ze mnie pomoc miał;\ngłowę bym Twoją podparła, krew zsiadłą z lica otarła.\nAle Cię nie mogę dosiąc, Tobie, Synu, nic dopomóc.""",
          previousStep: 10,
          nextStep: 12,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_12.jpg",
          caption:
              "Bez czarny (sambucus nigra)\nForma drzewiasta. Kwitnie niewinnie, biało, ale jego owoce mają wygląd skrzepniętej krwi. Czarny bez symbolizuje śmierć.",
          title: "Stacja XII\nJezus umiera na Krzyżu",
          description:
              """„Tobie chwała, Chryste! Tobie, który krzyż uczyniłeś mostem ponad śmiercią, aby po nim dusze mogły przejść z krainy śmierci do krainy życia” (św. Ireneusz).\n\nAnielskie się słowa mienią, Symeonowe się pełnią;\nAnioł rzekł: Pełnaś miłości, a jam dziś pełna gorzkości.\nSymeon mi to powiedział, iż me serce miecz przebóść miał.""",
          previousStep: 11,
          nextStep: 13,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_13.jpg",
          caption:
              "Jasion wyniosły, odmiana zwisająca (faximus excelsior pendulae)\nU Hebrajczyków sok z jesionu służył do przemywania ran.",
          title: "Stacja XIII\nJezus z Krzyża zdjęty",
          description:
              """„O Święta Matko, miecz naprawdę przeniknął Twoją duszę. Jedynie przenikając duszę Matki, mógł dosięgnąć ciała Syna. Umarłemu Jezusowi, któremu nie mogła już zaszkodzić niemiłosierna włócznia, otworzyła bok, Tobie zaś przeszyła serce. Jego duszy już tam nie było, a Twoja nie mogła się stamtąd oderwać. Straszny ból przeszył Twoją duszę, toteż zupełnie słusznie nazywamy Cię więcej niż Męczennicą, ponieważ ból współcierpienia przewyższa udrękę ciała” (św. Bernard).\n\nNi ja ojca, matki, brata, ni żadnego przyjaciela;\nskądże pocieszenie mam mieć? Wolałabym stokroć umrzeć,\nniż widzieć żołnierza złego, co przebił bok Syna mego.""",
          previousStep: 12,
          nextStep: 14,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_14.jpg",
          caption:
              "Dąb szypułkowy (quercus robur)\nDrzewo to niebawem rozrośnie się potężnie jak dzieło Chrystusa. U Żydów panował zwyczaj chowania zmarłych pod dębami.",
          title: "Stacja XIV\nJezus złożony do grobu",
          description:
              """„Śmierć nie oddziela nas od siebie, ponieważ wszyscy zdążamy tą samą drogą i odnajdziemy się w tym samym miejscu. Nie będziemy nigdy rozłączeni, ponieważ żyjemy dla Chrystusa i teraz jesteśmy złączeni z Chrystusem, idąc ku Niemu. Wszyscy razem będziemy kiedyś z Chrystusem” (św. Szymon z Tesalonik).\n\nMatki, co synaczki macie, a jako się w nich wy kochacie,\nkiedy wam z nich jeden umrze, ciężki ból ma serce wasze;\ncóż ja, com miała jednego, już nie mogę mieć inszego.""",
          previousStep: 13,
          nextStep: 15,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_15.jpg",
          caption:
              "Drobne sadzonki ostrokrzewu (ilex)\nOstrokrzew symbolizuje ojcostwo, a jako roślina wiecznie zielona - nieśmiertelność.",
          title: "Stacja XV\nZmartwychwstanie Jezusa",
          description:
              """„Potrzebujemy małych i większych nadziei, które dzień po dniu podtrzymują nas w drodze. Jednak bez wielkiej nadziei, która musi przewyższać pozostałe, są one niewystarczające. Tą wielką nadzieją może być jedynie Bóg, który ogarnia wszechświat i który może nam zaproponować i dać to, czego sami nie możemy osiągnąć. Bóg jest fundamentem nadziei, nie jakikolwiek bóg, ale ten Bóg, który ma ludzkie oblicze i umiłował nas aż do końca: każdą jednostkę i ludzkość w całości” (papież Benedykt XVI).\n\nO, niestetyż, miły Panie, toć nie małe rozłączenie;\nprzedtem było miłowanie, a teraz ciężkie wzdychanie.\nCzemuż, Boże Ojcze, nie dbasz, o Synaczka pieczy nie masz?""",
          previousStep: 14,
          nextStep: 16,
        ),
        StepItem(
          type: StepType.end,
          title: "Zakończenie",
          description:
              '„Ukrzyżowany Jezus jest wielkim «odpustem» ofiarowanym przez Ojca ludzkości jako przebaczenie win i zaproszenie do synowskiego życia w Duchu Świętym” (św. Jan Paweł II).\n\nDo nabożeństwa drogi krzyżowej przywiązana jest łaska odpustu zupełnego pod zwykłymi warunkami: komunia święta, modlitwa w intencjach papieskich oraz brak przywiązania do grzechu. Odpust można uzyskać dla siebie lub dla jednej osoby zmarłej.\n\nMedytowanie cierpień Chrystusa podczas drogi krzyżowej jest jednym z najpiękniejszych chrześcijańskich ćwiczeń duchowych, pozwalającym pełniej uczestniczyć w Ofierze naszego Zbawiciela.',
          imageAsset: "assets/images/trip_02.png",
          previousStep: 15,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "03", // TODO: must fix
      title: "W Labiryncie",
      subtitle: "dla młodzieży",
      time: "45",
      age: "12+",
      distance: "0,7",
      rating: "4,5",
      description: "Wejdź do klasztornego labiryntu i odkrywaj mądrości starożytnych filozofów.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
      countPoints: false,
      stepList: <StepItem>[
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Wejście do labiryntu",
          description:
              'Labirynt to miejsce, do którego łatwo wejść, ale trudniej wyjść. Jeśli jednak jesteś tu po raz pierwszy, możesz mieć trudności z odnalezieniem również wejścia.\n\nWarto więc skorzystać z mapki, która jest częścią tej aplikacji. Pomoże Ci ona znaleźć to miejsce nieopodal altanki filozofów.\n\nZapraszamy do podróży!',
          nextStep: 1,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Ogród Filozofów",
          description:
              'Filozofia to nauka, która przybiera tyle odcieni, ile jest osób ją uprawiających. Zawsze pozostaje jednak tym, na co wskazuje jej grecka nazwa - phileo-sophia, czyli umiłowanie mądrości.\n\nJest ona „przygodą” w poszukiwaniu prawdy, która pociągnęła i zafascynowała wielu ludzi. Nieliczni z nich wspominani są na tych stronicach.\n\nNie jest ona jednak „przygodą” dla wybranych - każdy z nas może stawiać sobie pytania filozoficzne, dociekać tego, co leży u podstaw postrzeganej przez nas rzeczywistości. Przed każdym człowiekiem uczciwie poszukującym prawdy otwiera się droga do poznania siebie, świata i Boga.\n\nŚcieżek wiodących przez filozofię jest wiele. Nie zniechęcaj się, Drogi Przyjacielu, ich różnorodnością, ale otwórz się na głos mądrości, przemawiający przez każdą z nich.',
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          title: "Legenda",
          description:
              'Ogród założony został na bazie labiryntu z krzewów cisa pospolitego.\n\nZaprojektowano 14 placów, z których każdy poświęcony jest jednemu z filozofów:\n\n  1. Sokrates\n  2. Platon\n  3. Arystoteles\n  4. Augustyn z Hippony\n  5. Tomasz z Akwinu\n  6. Kartezjusz\n  7. Immanuel Kant\n  8. Gottfried Wilhelm Leibniz\n  9. Georg Wilhelm Friedrich Hegel\n 10. Søren Kierkegaard\n 11. Józef Stanisław Tischner\n 12. Jan Paweł II (Karol Wojtyła)\n 13. Leszek Kołakowski\n 14. Tadeusz Styczeń',
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '„Poznaj samego siebie, a stanie przed tobą otworem cały świat”\n - Sokrates (469-399 r. p.n.e.)',
          title: "1. Sokrates",
          description:
              'Sokrates zapisał się w historii jako wzór filozofa. Pytał napotykanych ludzi, co wiedzą o sprawiedliwości, pobożności, bądź też odwadze. Uważał, że poznanie istoty tych cnót prowadzi do cnotliwego życia. Niestrudzenie prowokował dyskusje, dlatego został Sokrates fałszywie skazany na śmierć za psucie młodzieży. Zginął, wypijając truciznę - cykutę.\n\nPlacyk wybrukowany białymi kamieniami. Kamień symbolizuje istnienie. Kamień koloru białego to także symbol szczęścia, zwycięstwa.',
          previousStep: 2,
          nextStep: 4,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Myśleć to co prawdziwe, czuć to co piękne i kochać co dobre - w tym cel rozumnego życia”\n - Platon (427-347 r. p.n.e.)',
          title: "2. Platon",
          description:
              'Pochodzący z arystokracji Platon, uczeń Sokratesa, był bardzo płodnym i przenikliwym umysłem. W „Dialogach” spisał swoje poglądy - uważał, że istnieje odrębny „świat idei”, w którym idee „człowieka”, „dobra”, „światła” istnieją w sposób doskonały. Konkretni ludzie, konkretne przykłady dobra itp. są tylko cieniami w porównaniu z pięknem doskonałych idei. Dusza ludzka przypomina sobie te idee, gdyż kiedyś, nie będąc uwięziona w ciele, oglądała je „na własne oczy”.\n\nPlacyk wybrukowany zielonymi kamieniami. Zieleń to symbol nadziei, błogostanu, dobroci.',
          previousStep: 3,
          nextStep: 5,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '„U początku filozofii stoi - zdziwienie”\n - Arystoteles (384-322 r. p.n.e.)',
          title: "3. Arystoteles",
          description:
              'Uczeń Akademii Platona. Przyrodnik i lekarz, nauczyciel Aleksandra Wielkiego. Dokonał podziału nauk na praktyczne i teoretyczne. W poznawaniu świata uznawał za pierwszorzędny czynnik empiryczny - zmysłowy, który jednak musi być poddany rozumowaniu. Wyodrębnił z filozofii logikę, jako „organon” - narzędzie jej służące. Na gruncie tzw. filozofii pierwszej, tj. metafizyki, dowodził m.in. istnienie Boga - Absolutu. Człowieka uważał za jedność duszy i ciała, nie zaś jak jego nauczyciel, za duszę uwięzioną w ciele.\n\nNa placyku znajduje się studnia, a obok niej rośnie grusza wierzbolistna (Pyrus salicifolia Pall.) przypominająca swoim wyglądem bardziej wierzbę niż gruszę. Drzewo pochyla się nad studnią jakby chciało zobaczyć, co kryje się w jej wnętrzu i niejako dziwi się, widząc na dnie studni bryły z zielonego szkła zamiast wody. Z owego „zdziwienia” rodzi owoce - „gruszki na wierzbie”.',
          previousStep: 4,
          nextStep: 6,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '„Kochaj i rób co chcesz”\n - Augustyn z Hippony (354-430 r.)',
          title: "4. Augustyn z Hippony",
          description:
              'Urodzony w Tagaście w Afryce Północnej, z początku zwolennik herezji manicheizmu, następnie, po nawróceniu, biskup Hippony. W swej filozofii pierwszeństwo przyznawał poznaniu siebie samego oraz Boga. Prawdami, które poznaje się najpewniej są, według niego, prawdy wieczne - podobne do platońskich idei, lecz zawarte w umyśle Boga. Poznanie ich możliwe jest tylko dzięki iluminacji - oświeceniu przez łaskę Bożą. Bóg jest Stwórcą całego świata, dlatego stworzony świat jest dobry. Augustyn powiada - „Bóg nie stworzył zła”.\n\nNa placyku uwagę przyciąga rosnący krzew róży. Czerwona róża jest powszechnie uznawana za symbol prawdziwej miłości. Prawdziwa miłość zawsze afirmuje i nigdy nie krzywdzi.',
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Człowiek nie jest duszą używającą ciała, lecz kompozycją duszy i ciała”\n - Tomasz z Akwinu (1225-1274 r.)',
          title: "5. Tomasz z Akwinu",
          description:
              'Urodzony we włoskiej rodzinie arystokratycznej, studiował w klasztorze Monte Cassino, zaś w 1243 został dominikaninem, wybitnym pisarzem filozoficznym (Summa contra gentiles) i teologicznym (Summa theologiae). Uważał, że filozofia i teologia nie są sobie przeciwne, lecz mogą się uzupełniać. On dokonał przystosowania myśli Arystotelesa do wymogów średniowiecznej filozofii, wzbogacając tę myśl o zagadnienie „istnienia”. Dowodził istnienia Boga na wiele sposobów (słynnych pięć dróg św. Tomasza). Mówił, że istotą Boga jest istnienie.\n\nPlacyk wybrukowany na wzór szachownicy z czarnych i czerwonych kamyków. Szachownicę tę oplata roślina wykonana z białych kamyków symbolizująca ludzką duszę.',
          previousStep: 6,
          nextStep: 8,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '„Myślę, więc jestem”\n - Kartezjusz (1596-1650 r.)',
          title: "6. Kartezjusz",
          description:
              'Wychowanek szkół jezuickich, uczony podróżnik i obserwator. Rozpoczął swoisty „przewrót kopernikański” w filozofii. Zawiedziony dotychczasową wiedzą, chciał uzyskać wiedzę jasną i wyraźną - nieuwarunkowaną wcześniejszymi poglądami. W tym celu wybrał drogę metodycznego sceptycyzmu - wątpił we wszystko, szukając takiej prawdy, w którą nie można zwątpić. Odnalazł ją w słynnym „cogito, ergo sum” - myślę, więc jestem. Od tej prawdy wychodząc, starał się skonstruować filozofię nieomylną na wzór matematyki.\n\nNa placyku wybrukowanym granitową kostką usytuowany jest sześcian a na nim kula. Sześcian to symbol symetrii, równowagi, stałości, harmonii. Kula zaś jest symbolem prawidłowości, piękna, doskonałości. Granitowa kostka brukowa, symbolizująca myśli, tworzy kręgi począwszy od punktu „zero”, który znajduje się pod figurami geometrycznymi dającymi niejako początek myślenia.',
          previousStep: 7,
          nextStep: 9,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Niebo gwiaździste nade mną i prawo moralne we mnie. Są to dla mnie dowody, że jest Bóg nade mną i Bóg we mnie”\n - Immanuel Kant (1724-1804 r.)',
          title: "7. Immanuel Kant",
          description:
              'Urodzony w Królewcu (obecnie Kaliningrad), tam przeżył całe swe życie. Dopiero w późniejszym okresie życia wygłosił nową filozofię tzw. krytyczną. Doprowadziła ona do końca „przewrót kopernikański” Kartezjusza. Kant twierdził, że ludzie w poznawaniu świata nie poznają tak naprawdę rzeczy „samych w sobie”, ale widzą je tak, jak „każe” je im widzieć ich umysł. W swej etyce Kant wypracował tzw. imperatyw kategoryczny - dostępną dla każdego zasadę postępowania, nakazującą czynić to, co chciałoby się, aby i inni nam czynili.\n\nBruk tego placyku przypomina ciemną galaktykę z jasnymi gwiazdami, które ją rozświetlają. ',
          previousStep: 8,
          nextStep: 10,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Gdyby ten świat nie był najdoskonalszy z możliwych, Bóg by go nie stworzył”\n - Gottfried Wilhelm Leibniz (1646-1716 r.)',
          title: "8. Gottfried Wilhelm Leibniz",
          description:
              'Powiedziano o nim „ostatni człowiek na świecie, który wiedział wszystko”. Wszechstronny umysł, obeznany z polityką Europy, poświęcił się zagadnieniom związanym z Bogiem i światem. Bóg według niego stworzył ten świat i już u jego zarania ustanowił w nim „zaprogramowaną harmonię” - łac. harmonia praestabilita - miała być to odpowiedź na problem istnienia zła. Świat według Leibniza składa się z monad - podstawowego tworzywa rzeczywistości, których wielość i różnorodność odpowiedzialna jest za różnorodność, którą widzimy w świecie.\n\nPlacyk wybrukowany na wzór symetrycznych kręgów rozchodzących się z jednego punktu. Zataczane kręgi ułożone są z różnorodnej kostki brukowej począwszy od tej o najmniejszych wymiarach i najjaśniejszych kolorach do coraz większych i ciemniejszych. Całość sprawia wrażenie przemyślanego i dokładnie zaplanowanego dzieła.',
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„To co jest wytworzone z formy czystej myśli, a nie mocą autorytetu, tylko to należy do filozofii”\n - Georg Wilhelm Friedrich Hegel (1770-1831 r.)',
          title: "9. Georg Wilhelm Friedrich Hegel",
          description:
              'Filozof ten był myślicielem trudnym w odbiorze - poziom abstrakcji jego myślenia skutecznie aż do dziś uniemożliwia niektórym odbiór jego nauczania. Nie miał on jednak równych sobie w dziedzinie historii dziejów - uważał ją za nieustanny, postępujący na zasadzie ewolucji, rozwój ducha myśli ludzkiej, przejawiającej się w kolejnych etapach. Głównym prawem rozwoju ducha miało być złączenie dwóch różnych skrajności - teza i antyteza, miały razem prowadzić do syntezy - jest to tzw. prawo dialektyki. Rozwinął także problem państwa, jako „boskiej idei istniejącej na ziemi”.\n\nPlacyk wybrukowany granitową kostką, pomiędzy którą wkomponowane są bryły szkła symbolizujące formę czystej myśli.',
          previousStep: 10,
          nextStep: 12,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Człowiek jest syntezą nieskończoności i skończoności, doczesności i wieczności, wolności i konieczności, jednym słowem, syntezą”\n - Søren Kierkegaard (1813-1855 r.)',
          title: "10. Søren Kierkegaard",
          description:
              'Nazwany ojcem egzystencjalizmu, kierunku w filozofii, który skupia się nie na oderwanych od życia spekulacjach, ale właśnie na codziennym doświadczeniu człowieka. Nieobca była mu zaduma nad małością i kruchością człowieka wobec Boga. Rozważał zagadnienia związane z religią, np. analizował biblijny zapis o Abrahamie i Izaaku, zastanawiając się nad kwestią zaufania Bogu. Uznał, że życie ludzkie można podzielić na trzy etapy - estetyczny (poszukiwanie przyjemności), etyczny (poszukiwanie dobra) i religijny (uznanie swojej grzeszności i zwrócenie się do Boga).\n\nPlacyk wybrukowany kamieniami o różnych rozmiarach, kształtach i kolorach. Ukazany został w ten sposób symbol pewnej syntezy.',
          previousStep: 11,
          nextStep: 13,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Gdy człowiek nie wie, co zrobić, sumienie mówi mu tylko jedno: szukaj”\n - Józef Stanisław Tischner (1931-2000 r.)',
          title: "11. Józef Stanisław Tischner",
          description:
              'Znany polski kapłan, filozof, kapelan Związku Podhalan, kawaler Orderu Orła Białego. W swojej filozofii, którą określił mianem „filozofii dramatu” zawarł szczególną cechę charakterystyczną - chciał patrzeć na człowieka nie poprzez pryzmat założeń systemu myśli, ale niemalże jako na aktora, grającego na scenie życia swój największy dramat. Stąd też wiele tematów poruszanych przez Tischnera miało związek z życiem codziennym - zastanawiał się nad nowym ładem społecznym. Wskazywał na „dialog” - jako podstawową zasadę spotkania z drugim człowiekiem.\n\nPlacyk swym układem przypomina wybrukowany górski szlak, przy którym rośnie kosodrzewina i znajduje się symboliczny drogowskaz pomagający odszukać drogę zagubionym. ',
          previousStep: 12,
          nextStep: 14,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Wczoraj do ciebie nie należy. Jutro niepewne... Tylko dziś jest twoje”\n - Jan Paweł II (Karol Wojtyła) (1920-2005 r.)',
          title: "12. Jan Paweł II (Karol Wojtyła)",
          description:
              'Karol Wojtyła jako filozof dał się poznać jako przedstawiciel nurtu zwanego personalizmem. Dodatkowo w jego myśli da się odczytać wpływ myśli św. Tomasza z Akwinu. Personalizm, głoszony przez niego stawia człowieka i jego godność jako osoby za podstawę wszelkiej oceny moralnej. Człowiek najpełniej wyraża się w swoim świadomym i wolnym czynie (stąd tytuł znaczącej książki Wojtyły „Osoba i czyn”). Filozoficzna fascynacja człowiekiem jako posiadającym niezwykłą wartość, wpłynęła także w znacznym stopniu na teologiczne poglądy Karola Wojtyły.\n\nPlacyk wybrukowany kamieniami w trzech kolorach: czarny - symbolizujący przeszłość, biały - teraźniejszość, zielony - przyszłość. Na placyku po stronie zielonego bruku (przyszłości) znajduje się taboret (tron). Jest on stosunkowo wysoki, dlatego stojąc przy nim można poczuć się jak dziecko stojące przy taborecie dla osoby dorosłej. Aby usiąść na nim, trzeba się wspiąć albo podciągnąć. Jest to symboliczne ukazanie, iż do myśli Karola Wojtyły trzeba nam „dorastać”, by ją w przyszłości móc w pełni zrozumieć.',
          previousStep: 13,
          nextStep: 15,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Własną śmiercią można własne życie tylko potwierdzić, ale zaprzeczyć mu nie można, ponieważ nasza śmierć czyni dopiero nasze życie ostatecznie nieodmiennym”\n - Leszek Kołakowski (1927-2009 r.)',
          title: "13. Leszek Kołakowski",
          description:
              'W pierwszym okresie swojej działalności (mniej więcej do 1966 roku) pisał dzieła o charakterze marksistowskim, wspierając tym samym ideologię władz PRL-u. Dopiero później zaczął podejmować tematy związane z szeroko pojętą myślą chrześcijańską i historią filozofii, jednocześnie poddając krytyce ideologię marksistowską. Z tego powodu musiał emigrować z kraju - osiadł w Oksfordzie, gdzie mieszkał aż do śmierci.\n\nNa szaro-czarnym bruku tego placyku znajdują się części połamanych zabytkowych kolumn kamiennych symbolizujących nieuchronność śmierci.',
          previousStep: 14,
          nextStep: 16,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '„Miłować prawdę - wszelką i we wszystkim - to dla człowieka być samym sobą i ocalić samego siebie”\n - Tadeusz Styczeń (1931-2010 r.)',
          title: "14. Tadeusz Styczeń",
          description:
              'Salwatorianin, etyk i wieloletni przyjaciel Karola Wojtyły oraz jego następca na katedrze Etyki KUL-u, odznaczony Orderem Odrodzenia Polski. Podejmował zagadnienia związane z ludzkim postępowaniem, które według niego powinno zawsze pozostawać wierne prawdzie rozpoznanej przez człowieka - wyjaśniał ten mechanizm m.in. na przykładzie bohaterki antycznego dramatu - Antygony. Innym z podejmowanych przezeń tematów, było usytuowanie etyki wśród wielu różnych dziedzin wiedzy jako dyscypliny naukowej.\n\nPlacyk wybrukowany małymi otoczakami, pośród których znajduje się solidnie osadzony duży głaz. Głaz ten symbolizuje prawdę, która jest jedna, stała i pewna. Tylko życie w prawdzie sprawia, że człowiek staje się prawdziwie wolny („Poznacie prawdę, a prawda was wyzwoli” J 8,32).',
          previousStep: 15,
          nextStep: 17,
        ),
        StepItem(
          type: StepType.end,
          title: "Dziękujemy",
          description:
              'To już koniec podróży po ogrodzie filozofów, ale przygoda poszukiwania mądrości trwa przez całe życie.\n\nŻyczymy Ci, Drogi Przyjacielu, aby to spotkanie z filozofami z przeszłości zrodziło w Tobie nowe pytania i zapał do szukania na nie odpowiedzi.',
          imageAsset: "assets/images/trip_03.png",
          previousStep: 16,
          nextStep: -1,
        ),
      ],
    ),
  ];
}
