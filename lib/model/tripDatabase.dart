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
      subtitle: "dla ca??ej rodziny",
      time: "40",
      age: "6+",
      distance: "1,3",
      rating: "4,8",
      description: "Poznaj tajemnice klasztornego parku odkrywaj??c ciekawe miejsca i rozwi??zuj??c zadania.",
      imageAsset: "assets/images/trip_01.png",
      enabled: true,
      countPoints: true,
      stepList: <StepItem>[
        StepItem(
          type: StepType.info,
          title: "Witam serdecznie w naszym parku",
          description:
              "Zapraszam Ci??, Drogi Podr????niku, do wsp??lnej przygody dla ca??ej rodziny - od najm??odszego do najstarszego.\n\nPodczas naszej podr????y po klasztornym parku poznasz wiele pi??knych i ciekawych miejsc. Czekaj?? tam r??wnie?? na Ciebie zagadki i zadania, z kt??rymi na pewno ??wietnie sobie poradzisz.\n\nZacznijmy jednak od pocz??tku, a wi??c od parkingu przy wje??dzie do naszego klasztoru.",
          imageAsset: "assets/images/trip_01.png",
          nextStep: 1,
        ),
        StepItem(
          type: StepType.info,
          title: "Stawiamy pierwszy krok",
          description:
              "Skoro jeste?? na parkingu, to na pewno masz za sob?? d??ug?? podr????.\n\nRozprostuj nogi, pomachaj r??kami i rozejrzyj si?? woko??o. Czy rozpoznajesz miejsce na zdj??ciu?\n\nJe??li tak, to jeste?? gotowy do pierwszego zadania.",
          imageAsset: "assets/images/trip01/trip01_01.jpg",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile jest miejsc?",
          description:
              'Poszukaj niebieskiego znaku na parkingu i odpowiedz na nast??puj??ce pytanie:\n\n???Ile miejsc na parkingu jest zarezerwowanych dla os??b niepe??nosprawnych????',
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
          correctAnswer: "Gratuluj??! Rozwi??za??e?? pierwsz?? zagadk??.\n\nMo??emy rusza?? dalej.",
          incorrectAnswer:
              "Niestety! To nie jest prawid??owa odpowied??.\n\nPrzypatrz si?? dobrze niebieskiemu znakowi. S?? tam dwa miejsca dla niepe??nosprawnych. Ale nie przejmuj si??. Pierwszy krok jest zawsze najtrudniejszy.\n\nJeste?? gotowy do dalszej drogi?",
          imageAsset: "assets/images/trip01/trip01_03.jpg",
          nextStep: 5,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do parku",
          description:
              "Teraz znajd?? wej??cie do parku, kt??re jest oznaczone niebiesk?? tablic??.\n\nJe??li ju?? je znalaz??e??, mo??emy rozpocz???? drugie zadanie.",
          imageAsset: "assets/images/trip01/trip01_04.jpg",
          nextStep: 6,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to jest?",
          description:
              "Teraz wejd?? do parku i poszukaj figury pewnej osoby z krzy??em w r??ku. Pod t?? figur?? znajduje si?? napis.\n\nOd jakiej literki si?? zaczyna?",
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
          title: "B??ogos??awiony Franciszek Jordan",
          correctSelection: 2,
          correctAnswer:
              'Wspaniale! Pierwsza literka oznacza ???B??ogos??awiony???.\n\nOjciec Franciszek Jordan jest za??o??ycielem Zgromadzenia Salwatorian??w i si??str Salwatorianek, kt??rzy dzisiaj zamieszkuj?? to miejsce.\n\nZosta?? beatyfikowany 15 maja 2021 roku.',
          incorrectAnswer:
              'Niestety! To nie jest prawid??owa odpowied??. Pierwsza literka to ???B??? i oznacza ???B??ogos??awiony???.\n\nOjciec Franciszek Jordan jest za??o??ycielem Zgromadzenia Salwatorian??w i si??str Salwatorianek, kt??rzy dzisiaj zamieszkuj?? to miejsce.\n\nZosta?? beatyfikowany 15 maja 2021 roku.',
          imageAsset: "assets/images/trip01/trip01_06.jpg",
          nextStep: 9,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy do altanki",
          description:
              "Teraz czas, aby wej???? g????biej do parku.\n\nId??c po schodkach zobaczysz po lewej stronie pi??kn?? niebiesk?? altank??. Znalaz??e?? ju?? do niej drzwi?",
          imageAsset: "assets/images/trip01/trip01_07.jpg",
          nextStep: 10,
        ),
        StepItem(
          type: StepType.info,
          title: "Policz s??upki",
          description:
              'To zadanie wymaga, aby?? wszed?? do altanki.\n\nA teraz popatrz przez szyb?? na zewn??trz i policz charakterystyczne srebrne s??upki, kt??re stoj?? przy alejce.\n\nIle ich jest?',
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
          title: "S??upki z lampkami",
          correctSelection: 2,
          correctAnswer:
              'Brawo!\n\nTo s?? s??upki, kt??re w nocy ??wiec??, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzi?? pomi??dzy zamkiem a ogrodem.\n\nJeste?? gotowy do dalszej drogi?',
          incorrectAnswer:
              'Niestety! Jest tam 5 s??upk??w, kt??re w nocy ??wiec??, aby siostry i bracia zakonni mogli w zimowe wieczory bezpiecznie przechodzi?? pomi??dzy zamkiem a ogrodem.\n\nJeste?? gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_09.jpg",
          nextStep: 13,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy labiryntu",
          description:
              'Z altanki jest ju?? bardzo blisko do labiryntu. Ale czy potrafisz go odnale?????\n\nId?? za s??upkami, kt??re w??a??nie policzy??e??, a znajdziesz do niego wej??cie.',
          imageAsset: "assets/images/trip01/trip01_10.jpg",
          nextStep: 14,
        ),
        StepItem(
          type: StepType.info,
          title: "Kto to powiedzia???",
          description:
              'W labiryncie ??atwo si?? zgubi??.\n\nPoszukaj drogowskazu ze zdj??cia, a obok niego b??dzie tabliczka z napisem: ???Gdy cz??owiek nie wie, co zrobi??, sumienie m??wi mu tylko jedno: szukaj!???\n\nPod tym napisem znajduj?? si?? imiona i nazwisko autora. Podaj jego inicja??y.',
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
          title: "J??zef Stanis??aw Tischner",
          correctSelection: 3,
          correctAnswer:
              'Gratuluj??! Odkry??e?? my??l s??awnego polskiego filozofa, kt??r?? warto zapami??ta??.\n\nCzy jeste?? gotowy na kolejne wyzwanie?',
          incorrectAnswer:
              'Niestety! To nie jest w??a??ciwa odpowied??. Szukali??my my??li s??awnego polskiego filozofa - J??zefa Stanis??awa Tischnera, kt??r?? warto zapami??ta??.\n\nCzy jeste?? gotowy na kolejne wyzwanie?',
          imageAsset: "assets/images/trip01/trip01_12.jpg",
          nextStep: 17,
        ),
        StepItem(
          type: StepType.info,
          title: "Kierujemy si?? do Matki Bo??ej",
          description:
              'Wychodzimy wreszcie z labiryntu, skr??camy w lewo w stron?? altanki, a przy altance znowu skr??camy w lewo.\n\nPrzed Tob?? b??dzie alejka, a na jej ko??cu co?? ciekawego wisi na drzewie.\n\nCzy wiesz ju?? co to jest?',
          imageAsset: "assets/images/trip01/trip01_13.jpg",
          nextStep: 18,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za drzewo?",
          description:
              'Salwatorianie bardzo kochaj?? Matk?? Bo???? i cz??sto si?? do Niej modl??. Pod t?? ikon?? na drzewie jest napis: ???Przechodz??c obok, pozdr??w Maryj?????.\n\nCzy potrafisz odgadn???? na jakim drzewie wisi ta ikona? Podpowied?? znajduje si?? nieopodal na ma??ym zielonym znaczku.',
          imageAsset: "assets/images/trip01/trip01_14.jpg",
          previousStep: 17,
          nextStep: 19,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "D??b", stepLink: 20),
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
          title: "D??b szypu??kowy",
          correctSelection: 0,
          correctAnswer:
              'Tak jest!\n\nD??b to silne i wspania??e drzewo. Je??li si?? rozejrzysz, to zauwa??ysz, ??e w parku znajduje si?? wiele ogromnych d??b??w.',
          incorrectAnswer:
              'Niestety! Odpowied?? to d??b - silne i wspania??e drzewo.\n\nJe??li si?? rozejrzysz, to zauwa??ysz, ??e w parku znajduje si?? wiele ogromnych d??b??w.',
          imageAsset: "assets/images/trip01/trip01_15.jpg",
          nextStep: 21,
        ),
        StepItem(
          type: StepType.info,
          title: "Biegniemy do groty",
          description:
              'Je??li si?? obr??cisz w stron?? parku, to napewno zobaczysz du???? g??r?? kamieni. To jest grota z figur?? Matki Bo??ej.\n\nBiegniemy do Niej?',
          imageAsset: "assets/images/trip01/trip01_16.jpg",
          nextStep: 22,
        ),
        StepItem(
          type: StepType.info,
          title: "Znajd?? napis na kamieniu",
          description:
              'Jeste??my przy wyj??tkowej grocie na wz??r tej, w kt??rej Matka Bo??a objawi??a si?? ma??ej Bernadce w Lourdes we Francji. Poleci??a jej wtedy, aby modli??a si?? na r????a??cu. Dlatego zakonnicy od wielu lat modl?? si?? tutaj r????aniec oraz przychodz?? na nabo??e??stwa majowe.\n\nJe??li chcesz wiedzie?? jak d??ugo stoi tutaj ta grota, to spr??buj odnale???? dat?? wypisan?? na jednym z kamieni.',
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
              'Masz racj??. Ju?? w 1932 roku Salwatorianie niemieccy wybudowali tutaj t?? grot?? i modlili si?? w jej cieniu.\n\nJe??li jeste?? zm??czony mo??esz usi?????? sobie na ??awce, popatrze?? troch?? na figur?? Matki Bo??ej i odm??wi?? znan?? ci modlitw??.\n\nNie my??l jednak, ??e to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          incorrectAnswer:
              'Niestety pojawi?? si?? gdzie?? b????d. Poprawna odpowied?? to rok 1932, kiedy Salwatorianie niemieccy wybudowali tutaj t?? grot?? i modlili si?? w jej cieniu.\n\nJe??li jeste?? zm??czony mo??esz usi?????? sobie na ??awce, popatrze?? troch?? na figur?? Matki Bo??ej i odm??wi?? znan?? ci modlitw??.\n\nNie my??l jednak, ??e to koniec. Czeka nas jeszcze wiele ciekawych miejsc.',
          imageAsset: "assets/images/trip01/trip01_18.jpg",
          nextStep: 25,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stron?? zamku",
          description:
              'Popatrz po raz ostatni na figur?? Matki Bo??ej i obr???? si??.\n\nCzy widzisz ju?? du??y zamek za krzewem rododendronu?\n\nTam znajdziesz kolejn?? ciekawostk??.',
          imageAsset: "assets/images/trip01/trip01_19.jpg",
          nextStep: 26,
        ),
        StepItem(
          type: StepType.info,
          title: "Co to za postacie?",
          description:
              'Kiedy patrzysz na taki ??adny zamek mo??e si?? dziwisz, ??e mieszkaj?? w nim zakonnicy. Jak to si?? sta??o? Historia tego zamku jest d??uga i bardzo ciekawa, ale opowiem Ci j?? innym razem.\n\nTeraz popatrz na dwie bia??e figury. Jedna trzyma w r??ku klucze, a druga miecz. S?? to Aposto??owie. Czy rozpoznajesz ju?? jak si?? nazywaj???\n\nWybierz odpowied?? z pierwszymi literami ich imion.',
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
          title: "Aposto??owie Piotr i Pawe??",
          correctSelection: 3,
          correctAnswer:
              'Zgadza si??! S?? to ??wi??ty Piotr z kluczami i ??wi??ty Pawe?? z mieczem. Przypominaj?? nam, ??e ka??dy z nas jest powo??any do bycia aposto??em Pana Jezusa.\n\nA teraz w ty?? zwrot. Czeka nas d??uga droga w sam ??rodek parku.',
          incorrectAnswer:
              'Niestety nie! S?? to ??wi??ty Piotr z kluczami i ??wi??ty Pawe?? z mieczem. Przypominaj?? nam, ??e ka??dy z nas jest powo??any do bycia aposto??em Pana Jezusa.\n\nA teraz w ty?? zwrot. Czeka nas d??uga droga w sam ??rodek parku.',
          imageAsset: "assets/images/trip01/trip01_21.jpg",
          nextStep: 29,
        ),
        StepItem(
          type: StepType.info,
          title: "Wchodzimy do diaspory",
          description:
              'Wr???? teraz do groty i przejd?? obok niej mijaj??c j?? po prawej stronie.\n\nCzy widzisz w oddali ma???? drewnian?? kapliczk??? Nazywa si?? diaspora. Tam w??a??nie idziemy!',
          imageAsset: "assets/images/trip01/trip01_22.jpg",
          nextStep: 30,
        ),
        StepItem(
          type: StepType.info,
          title: "Ciekawe co jest w ??rodku?",
          description:
              'Mo??esz wej???? do ??rodka. Jest tam zazwyczaj dosy?? ciemno, wi??c zapal ??wiat??o. W????cznik znajduje si?? po prawej stronie.\n\nMy??l??, ??e teraz z ??atwo??ci?? zobaczysz w centrum figur?? Matki Bo??ej z Dzieci??tkiem.\n\nCo Matka Bo??a trzyma w r??ku razem z Dzieci??tkiem?',
          imageAsset: "assets/images/trip01/trip01_23.jpg",
          previousStep: 29,
          nextStep: 31,
        ),
        StepItem(
          type: StepType.select,
          selection: [
            SelectionItem(text: "R????aniec", stepLink: 32),
            SelectionItem(text: "Krzy??", stepLink: 32),
            SelectionItem(text: "Kwiaty", stepLink: 32),
            SelectionItem(text: "Chustk??", stepLink: 32),
          ],
          correctSelection: 0,
          imageAsset: "assets/images/trip01/trip01_23.jpg",
          previousStep: 30,
        ),
        StepItem(
          type: StepType.answer,
          title: "R????aniec",
          correctSelection: 0,
          correctAnswer:
              'Oczywi??cie! Matka Bo??a i Dzieci??tko razem trzymaj?? w r??ku r????aniec.\n\nBy??a to ulubiona modlitwa b??ogos??awionego Franciszka Jordana, kt??rego spotkali??my na pocz??tku naszej podr????y. Gdziekolwiek szed??, zawsze w kieszeni przesuwa?? paciorki r????a??ca.\n\nA czy Ty potrafisz modli?? si?? na r????a??cu?',
          incorrectAnswer:
              'Jeste?? pewien? Matka Bo??a i Dzieci??tko razem trzymaj?? w r??ku r????aniec.\n\nBy??a to ulubiona modlitwa b??ogos??awionego Franciszka Jordana, kt??rego spotkali??my na pocz??tku naszej podr????y. Gdziekolwiek szed??, zawsze w kieszeni przesuwa?? paciorki r????a??ca.\n\nA czy Ty potrafisz modli?? si?? na r????a??cu?',
          imageAsset: "assets/images/trip01/trip01_24.jpg",
          nextStep: 33,
        ),
        StepItem(
          type: StepType.info,
          title: "Zobaczmy obelisk",
          description:
              'Po wyj??ciu z diaspory id?? ??cie??k?? na prawo. Na skrzy??owaniu dr??g skr???? w prawo i id?? dalej, a?? zobaczysz w oddali ciekawy obelisk. Jest on przy naro??niku parku.\n\nDoszed??e?? ju?? tam?',
          imageAsset: "assets/images/trip01/trip01_25.jpg",
          nextStep: 34,
        ),
        StepItem(
          type: StepType.info,
          title: "Co jest tutaj napisane?",
          description:
              'Ten obelisk postawili tutaj Salwatorianie niemieccy jeszcze przed drug?? wojn?? ??wiatow??.\n\nPrzypomina on najwa??niejsze zasady ka??dego Salwatorianina, czyli ??luby zakonne. S?? wypisane w j??zyku ??aci??skim na czterech stronach obelisku.\n\nJaka jest pe??na nazwa ??lubu na liter?? ???C????',
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
          title: "Czysto????",
          correctSelection: 2,
          correctAnswer:
              'Tak jest - CASTITAS. To oznacza w j??zyku ??aci??skim ??lub bez??ennej czysto??ci.\n\nNie chodzi tu oczywi??cie o cz??ste mycie r??k, ale o oddanie ca??ego siebie Panu Bogu. Dlatego w??a??nie zakonnicy nie zak??adaj?? rodzin, aby ca??kowicie po??wi??ci?? si?? Bogu i s??u??y?? wszystkim.\n\nDalej ju?? nie p??jdziemy. Musimy tu zawr??ci??. Jeste?? gotowy?',
          incorrectAnswer:
              'Gdzie?? pojawi?? si?? b????d! Poprawna nazwa to - CASTITAS. To oznacza w j??zyku ??aci??skim ??lub bez??ennej czysto??ci.\n\nNie chodzi tu oczywi??cie o cz??ste mycie r??k, ale o oddanie ca??ego siebie Panu Bogu. Dlatego w??a??nie zakonnicy nie zak??adaj?? rodzin, aby ca??kowicie po??wi??ci?? si?? Bogu i s??u??y?? wszystkim.\n\nDalej ju?? nie p??jdziemy. Musimy tu zawr??ci??. Jeste?? gotowy?',
          imageAsset: "assets/images/trip01/trip01_27.jpg",
          nextStep: 37,
        ),
        StepItem(
          type: StepType.info,
          title: "Szukamy niezwyk??ego drzewa",
          description:
              'Pewno jeste?? ju?? zm??czony, ale jeszcze troch?? wytrzymaj.\n\nStoj??c ty??em do obelisku, id?? lew?? stron?? wzd??u?? p??otu. Przejdziesz przez ma??y mostek, a?? dotrzesz do ko??ca ??cie??ki.\n\nPo lewej stronie b??dzie du??y ceglany dom - to jest nowicjat. Tam mieszkaj?? kandydaci do ??ycia zakonnego.\n\nTy jednak skr???? w prawo, a po kilkunastu krokach zobaczysz po prawej stronie niezwyk??e drzewo.',
          imageAsset: "assets/images/trip01/trip01_28.jpg",
          nextStep: 38,
        ),
        StepItem(
          type: StepType.info,
          title: "Literka na czerwonym tle",
          description:
              'I co? Jak Ci si?? podoba?\n\nMo??esz sobie odpocz???? w cieniu tego ogromnego drzewa i wyobrazi?? sobie stare dzieje zakonne. Kiedy b??dziesz gotowy, poszukaj pewnej literki na czerwonym tle. Jest niedaleko.\n\nJaka to literka?',
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
              'Bardzo dobrze! Ta literka oznacza hydrant, czyli miejsce pod????czenia do wody.\n\nW razie po??aru stra??acy b??d?? mogli tam podpi???? sw??j sprz??t i ugasi?? ogie??. Miejmy nadziej??, ??e nigdy nie b??d?? musieli tego robi??.\n\nTo co? Jeste?? gotowy do dalszej drogi?',
          incorrectAnswer:
              'Oj, niedobrze! Ta literka to ???H??? i oznacza hydrant, czyli miejsce pod????czenia do wody.\n\nW razie po??aru stra??acy b??d?? mogli tam podpi???? sw??j sprz??t i ugasi?? ogie??. Miejmy nadziej??, ??e nigdy nie b??d?? musieli tego robi??.\n\nTo co? Jeste?? gotowy do dalszej drogi?',
          imageAsset: "assets/images/trip01/trip01_30.jpg",
          nextStep: 41,
        ),
        StepItem(
          type: StepType.info,
          title: "Idziemy w stron?? stawu",
          description:
              'Je??li jeszcze jeste?? przy hydrancie i patrzysz w stron?? zamku, to id?? w lewo.\n\nDojdziesz do stawu, a je??li b??dziesz mia?? szcz????cie, to zobaczysz kaczki, czerwone karasie, albo nawet czapl??.',
          imageAsset: "assets/images/trip01/trip01_31.jpg",
          nextStep: 42,
        ),
        StepItem(
          type: StepType.info,
          title: "Ile lat ma seminarium?",
          description:
              'Teraz id?? w stron?? dziedzi??ca zamkowego przechodz??c pod zabytkowym ??ukiem.\n\nW ??rodku dziedzi??ca zobaczysz fontann??, a jeszcze dalej wej??cie do klasztoru, czyli furt?? klasztorn??. Jest to miejsce, gdzie zakonnik pe??ni dy??ur i przyjmuje go??ci. Tam te?? mo??esz skorzysta?? z toalety.\n\nA teraz zadanie! Obok drewnianych drzwi jest mosi????na jubileuszowa tablica, na kt??rej napisany jest rok powstania seminarium. Jaki to rok?',
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
          title: "Rok za??o??enia seminarium",
          correctSelection: 1,
          correctAnswer:
              'Wspaniale! W roku 1953 powsta??o w tym zamku Wy??sze Seminarium Duchowne Salwatorian??w.\n\nJest to taka szko??a, w kt??rej m??odzi klerycy ucz?? si??, aby w przysz??o??ci zosta?? ksi????mi. By?? mo??e mia??e?? okazj?? spotka?? jakiego?? kleryka w czarnym habicie podczas naszej podr????y po parku.\n\nNo to poma??u b??dziemy ko??czy??. Pozosta??o nam jeszcze tylko jedno miejsce. Jeste?? gotowy?',
          incorrectAnswer:
              'Nie do ko??ca! Chodzi o rok 1953, w kt??rym powsta??o w tym zamku Wy??sze Seminarium Duchowne Salwatorian??w.\n\nJest to taka szko??a, w kt??rej m??odzi klerycy ucz?? si??, aby w przysz??o??ci zosta?? ksi????mi. By?? mo??e mia??e?? okazj?? spotka?? jakiego?? kleryka w czarnym habicie podczas naszej podr????y po parku.\n\nNo to poma??u b??dziemy ko??czy??. Pozosta??o nam jeszcze tylko jedno miejsce. Jeste?? gotowy?',
          imageAsset: "assets/images/trip01/trip01_33.jpg",
          nextStep: 45,
        ),
        StepItem(
          type: StepType.info,
          title: "Wracamy na parking",
          description:
              'Je??li idziesz spod furty po schodach na d????, kieruj si?? na prawo. Tam w??a??nie jest parking, sk??d rozpocz??li??my nasz?? w??dr??wk??.\n\nNie my??l jednak, ??e to ju?? koniec. Pozosta??o nam przecie?? ostatnie zadanie.',
          imageAsset: "assets/images/trip01/trip01_34.jpg",
          nextStep: 46,
        ),
        StepItem(
          type: StepType.info,
          title: "Jaki skr??t maj?? Salwatorianie?",
          description:
              'Id??c w stron?? parkingu b??dziesz przechodzi?? przez zielon?? bram??, kt??ra zawsze jest otwarta.\n\nNa tej bramie znajduje si?? skr??t Salwatorian??w. S?? to trzy bia??e literki.\n\nWidzisz ju?? je?',
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
              'Gratuluj??! SDS to skr??t ??aci??skiej nazwy ???Societas Divini Salvatoris???, czyli po polsku ???Towarzystwo Boskiego Zbawiciela??? - Salwatorianie.\n\nW ten spos??b zako??czy??e?? pomy??lnie ostatnie zadanie i nasz?? podr????. Jestem z Ciebie dumny.',
          incorrectAnswer:
              'No prawie! Chodzi??o o SDS - skr??t ??aci??skiej nazwy ???Societas Divini Salvatoris???, czyli po polsku ???Towarzystwo Boskiego Zbawiciela??? - Salwatorianie.\n\nW ten spos??b zako??czy??e?? pomy??lnie ostatnie zadanie i nasz?? podr????. Jestem z Ciebie dumny.',
          imageAsset: "assets/images/trip01/trip01_36.jpg",
          nextStep: 49,
        ),
        StepItem(
          type: StepType.end,
          title: "Gratuluj?? Odkrywco!",
          description:
              'Spisa??e?? si?? na medal i uko??czy??e?? pierwsz?? podr???? po naszym klasztorze. Znasz ju?? park i okolice zamku, ale wiele tajemnic jeszcze przed Tob??.\n\nJe??li znowu do nas przyjedziesz, to zapraszam do kolejnej podr????y.\n\nDo zobaczenia!',
          imageAsset: "assets/images/trip_01.png",
          previousStep: 48,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "02", // TODO: must fix
      title: "Droga Krzy??owa",
      subtitle: "dla wszystkich",
      time: "30",
      age: "12+",
      distance: "0,7",
      rating: "4,9",
      description: "Towarzysz Panu Jezusowi na drodze krzy??owej w ciszy klasztornego parku.",
      imageAsset: "assets/images/trip_02.png",
      enabled: true,
      countPoints: false,
      stepList: <StepItem>[
        StepItem(
          imageAsset: "assets/images/trip02/trip02_mapka.jpg",
          title: "Pocz??tek drogi ...",
          description:
              'Ta wyj??tkowa droga krzy??owa ma sw??j pocz??tek w centralnej cz????ci naszego parku, po lewej stronie groty Matki Bo??ej. Je??li jeste?? u nas po raz pierwszy, warto skorzysta?? z mapki, kt??ra jest cz????ci?? tej aplikacji.\n\nP??j??cie drog?? krzy??ow?? razem z Panem Jezusem wymaga ciszy i skupienia. Drogi Przyjacielu, niech pi??kno i spok??j naszego parku pomog?? Ci w wyj??tkowy spos??b prze??y?? ka??d?? stacj?? tej drogi krzy??owej.',
          nextStep: 1,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_01.jpg",
          caption:
              "Rajska jab??o?? (malus pumila)\nSymbol grzechu pierworodnego. Jezus przyszed?? dla odkupienia wszystkich naszych grzech??w.",
          title: "Stacja I\nJezus na ??mier?? skazany",
          description:
              """???Jaka?? to istota otoczona tak wielkim powa??aniem otrzyma istnienie? Jest ni?? cz??owiek, wielka i wspania??a posta?? ??yj??ca, cenniejsza w oczach Bo??ych ni?? ca??e stworzenie. Jest ni?? cz??owiek, dla niego istnieje niebo i ziemia, morze i ca??e stworzenie. Do jego zbawienia B??g przywi??za?? tak?? wag??, ??e dla niego nie oszcz??dzi?? nawet swego jedynego Syna. B??g nie przesta?? czyni?? wszystkiego, by doprowadzi?? cz??owieka do siebie i posadzi?? go po swojej prawicy??? (??w. Jan Chryzostom).\n\nKrzy??u ??wi??ty, nade wszystko, drzewo przenajszlachetniejsze!\nW ??adnym lesie takie nie jest, jedno, na kt??rym sam B??g jest.\nS??odkie drzewo, s??odkie gwo??dzie, rozkoszny owoc nosi??o.""",
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_02.jpg",
          caption:
              "Sosna limba (pinus cembra)\nTo drzewo skazane jest na samotne zmaganie si?? z przeciwno??ciami losu, z wichrami i ??nie??ycami. Jezus zosta?? odrzucony przez sw??j nar??d. Analizy drzewa krzy??a wykaza??y, ??e Jezusowy krzy?? wykonany zosta?? w??a??nie z sosny.",
          title: "Stacja II\nJezus bierze Krzy?? na swoje ramiona",
          description:
              """???Krzy?? wed??ug oceny powierzchownej mo??e wydawa?? si?? czym?? straszliwym. Gdy jednak wnikamy w jego tre????, zrozumiemy, ??e powinni??my gor??co go pragn????. W doczesnym widzeniu rysuje si?? on przed nami jako drzewo ??mierci, natomiast wed??ug oceny wiekuistej Chrystusa Pana, kt??ry na nim zawis??, ja??nieje nam jako drzewo ??ycia. Narz??dzie ??mierci sta??o si?? dla nas ??r??d??em ??ycia. Krzy?? jest drzewem ??aski zapewniaj??cej ??ycie??? (??w. Bonawentura).\n\nSk??o?? ga????zki, drzewo ??wi??te, ul??yj cz??onkom tak rozpi??tym.\nOdmie?? teraz on?? srogo????, kt??r???? mia??o z urodzenia.\nSpu???? lekuchno i cichuchno cia??o Kr??la niebieskiego.""",
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_03.jpg",
          caption:
              "G????g dwuszyjkowy (crategus laevigata)\nTen ciernisty krzew symbolizuje cierpienie, b??l i krew, za?? g????g - nadziej??.",
          title: "Stacja III\nJezus upada pod Krzy??em",
          description:
              """???Lepiej utraci?? honor, wszystkie dobra i ??ycie, ni?? obrazi?? Boga cho??by lekkim grzechem, bo grzech jest z??em niesko??czenie wi??kszym??? (??w. Maksymilian Maria Kolbe).\n\nTy?? samo by??o dostojne, nosi?? ??wiatowe Zbawienie.\nPrzez ci?? przew??z jest naprawion, ??wiatu, kt??ry by?? zagubion;\nkt??ry ??wi??ta Krew pola??a, co z Baranka wyp??yn????a.""",
          previousStep: 2,
          nextStep: 4,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_04.jpg",
          caption:
              "Lipa drobnolistna (tilla cordata)\nWed??ug pobo??nych legend lipa sta??a si?? schronieniem ??wi??tej Rodziny podczas ucieczki do Egiptu.",
          title: "Stacja IV\nJezus spotyka swoj?? matk??",
          description:
              """???Staj??c si?? Matk?? Jezusa, prawdziwego Boga i prawdziwego cz??owieka, Maryja sta??a si?? r??wnie?? nasz?? Matk??. Jezus w swoim wielkim mi??osierdziu zechcia?? nazwa?? nas swoimi bra??mi i takim imieniem ustanawia nas wszystkich adoptowanymi dzie??mi Maryi??? (??w. Jan Bosko).\n\nW jase??kach le????c, gdy p??aka??, ju?? tam by?? wszystko ogl??da??,\ni?? tak haniebnie umrze?? mia??, gdy wszystek ??wiat odkupi?? chcia??;\nw on czas mi??dzy zwierz??tami, a teraz mi??dzy ??otrami.""",
          previousStep: 3,
          nextStep: 5,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_05.jpg",
          caption:
              "Bluszcz pospolity (hedera felix)\nBluszcz na podporze symbolizuje pomoc i wsparcie okazywane bli??nim.",
          title: "Stacja V\nSzymon Cyrenejczyk pomaga nie???? Krzy?? Jezusowi",
          description:
              """???Nie doszli??my jeszcze do Boga, ale mamy z sob?? naszego bli??niego. We??mij wi??c na siebie tego, kt??ry ci towarzyszy w drodze, aby?? doszed?? do Tego, z kt??rym pragniesz przebywa????? (??w. Augustyn).\n\nNies??ychana to jest dobro??, za kogo na krzy??u umrze??.\nKt???? to mo??e dzisiaj zdzia??a??, za kogo swoj?? dusz?? da???\nSam to Pan Jezus wykona??, bo nas wiernie umi??owa??.""",
          previousStep: 4,
          nextStep: 6,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_06.jpg",
          caption:
              "Ja??min (jasminum)\nRo??lina oblepiona wiosn?? bia??ymi kwiatami, a p????niej kulkami owoc??w, na ca??e miesi??ce uosabia swym kolorem i zapachem prost?? dobro??. Kwiaty ja??minu symbolizuj?? bia???? chust??.",
          title: "Stacja VI\nWeronika ociera twarz Chrystusowi",
          description:
              """???Powinno si?? by?? dobrym jak chleb. Powinno si?? by?? dobrym jak chleb, kt??ry dla wszystkich le??y na stole, z kt??rego ka??dy mo??e dla siebie k??s odkroi??, nakarmi?? si??, je??li jest g??odny??? (??w. Brat Albert).\n\nN??dzne by to serce by??o, co by dzi?? nie zap??aka??o,\nwidz??c Stworzyciela swego na krzy??u zawieszonego,\nna s??o??cu upieczonego, Baranka wielkanocnego.""",
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_07.jpg",
          caption:
              "Ognik szkar??atny, odmiana czerwonoowocowa (pyracantha coccinea)\nCi??ty na wysoko???? 1,5 m; grona czerwonych kulek - owoce tego ciernistego krzewu przypominaj?? o krwawej ofierze Jezusa, o Jego cierpieniu i b??lu.",
          title: "Stacja VII\nJezus upada po raz drugi",
          description:
              """???Wydaje mi si??, ??e w g????bi mojego serca B??g umie??ci?? wiele ??aski wsp????czucia dla cierpie?? innych, a szczeg??lnie dla ludzi ubogich i potrzebuj??cych. Wsp????czucie rodzi w mym sercu pragnienie przyj??cia im z pomoc????? (??w. Ojciec Pio).\n\nMaryja, matka patrzy??a na cz??onki, co powija??a;\npowijaj??c ca??owa??a, z tego wielk?? rado???? mia??a.\nTeraz je widzi sczernia??e, ??y??y, stawy w Nim porwane.""",
          previousStep: 6,
          nextStep: 8,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_08.jpg",
          caption:
              "Trzy brzozy brodawkowate (betula pendula)\nBrzoza, gdy trzeba, jest drzewem radosnym, ale te?? potrafi delikatnie zwiesza?? ga????zki ku ziemi. Brzoza symbolizuje kobieco????. Jej zwisaj??ce ga????zki, ob??amane wiosn?? - p??acz?? (wydzielaj?? kroplami sok).",
          title: "Stacja VIII\nJezus pociesza p??acz??ce niewiasty",
          description:
              """???Kobieta, jak uczy do??wiadczenie, jest nade wszystko sercem wsp??lnoty rodzinnej. Ona daje ??ycie - i ona te?? pierwsza wychowuje. Oczywi??cie wspomagana przez m????a i dziel??c z nim systematycznie ca??y zakres powinno??ci rodzicielskich i wychowawczych. Jednak??e wiadomo, ??e organizm ludzki przestaje ??y??, gdy zabraknie pracy serca. Analogia jest do???? przejrzysta??? (??w. Jan Pawe?? II).\n\nNie by?? taki, ani b??dzie ??adnemu smutek na ??wiecie,\njaki czysta Panna mia??a wonczas, kiedy narzeka??a:\nN??dzna ja sierota dzisiaj, do kog???? ja si?? sk??oni?? mam?""",
          previousStep: 7,
          nextStep: 9,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_09.jpg",
          caption:
              "G????g ostrog??owy (crategus crus galli)\nProwadzony jako drzewko. Zn??w krwawe jagody, zn??w kolce korony cierniowej. Cierpienie, b??l.",
          title: "Stacja IX\nJezus upada po raz trzeci",
          description:
              """???Ka??dy dobry chrze??cijanin winien by?? bardziej skory do ocalenia wypowiedzi bli??niego ni?? do jej pot??pienia. A je??li nie mo??e jej ocali??, niech spyta go, jak on j?? rozumie, a je??li on rozumie j?? ??le, niech go poprawi z mi??o??ci??. A je??li to nie wystarcza, niech szuka wszelkich ??rodk??w stosownych do tego, aby on, dobrze j?? rozumiej??c, m??g?? si?? ocali????? (??w. Ignacy Loyola).\n\nJednegom Synaczka mia??a, com Go z nieba by?? pozna??a,\ni tegom ju?? postrada??a, jenom sama si?? zosta??a.\nCi????ki b??l cierpi me serce, od ??alu mi si?? rozpa???? chce.""",
          previousStep: 8,
          nextStep: 10,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_10.jpg",
          caption:
              "Czerwona pn??ca r????a (rosa)\nKrew, kolce. R????a jest symbolem czysto??ci; czerwona symbolizuje mi??o???? i uwielbienie, a pn??cze - ch???? ukrycia nago??ci.",
          title: "Stacja X\nJezus z szat obna??ony",
          description:
              """???Nie powinni??my ocenia?? ubogich wed??ug ich odzienia lub wygl??du ani wed??ug przymiot??w ducha, kt??re wydaj?? si?? posiada??, skoro najcz????ciej s?? lud??mi niewykszta??conymi i prostymi. Gdy jednak popatrzycie na nich w ??wietle wiary, wtedy ujrzycie, ??e zast??puj?? oni Syna Bo??ego, kt??ry zechcia?? by?? ubogim. W czasie swej m??ki nie mia?? prawie wygl??du cz??owieka. Poganom wydawa?? si?? szalonym, dla ??yd??w by?? kamieniem obrazy??? (??w. Wincenty a Paulo).\n\nW rado??cim Go porodzi??a, smutku ??adnego nie mia??a.\nA teraz wszystkie bole??ci dr??cz?? mnie dzi?? bez lito??ci;\nobym??e Ja to mog??a mie??, ??ebym mog??a teraz umrze??.""",
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_11.jpg",
          caption:
              "Buk pospolity w odmianie purpurowej (fagus silvatica purpurea)\nKrwistoczerwone li??cie symbolizuj?? krew Chrystusa.",
          title: "Stacja XI\nJezus do Krzy??a przybity",
          description:
              """???Ludzie potrzebuj?? naszych r??k, by im s??u??y??y. Naszych n??g, by ich odwiedza??y. Naszych ust, by ??yczliwie do nich m??wi??y. Naszych serc, by kocha??y. Kwiat rozwija si??, gdy ??wieci s??o??ce, a cz??owiek rozwija si??, gdy kocha??? (??w. Matka Teresa z Kalkuty).\n\nBy?? mi, Synu, nisko wisia??, w??dyby?? ze mnie pomoc mia??;\ng??ow?? bym Twoj?? podpar??a, krew zsiad???? z lica otar??a.\nAle Ci?? nie mog?? dosi??c, Tobie, Synu, nic dopom??c.""",
          previousStep: 10,
          nextStep: 12,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_12.jpg",
          caption:
              "Bez czarny (sambucus nigra)\nForma drzewiasta. Kwitnie niewinnie, bia??o, ale jego owoce maj?? wygl??d skrzepni??tej krwi. Czarny bez symbolizuje ??mier??.",
          title: "Stacja XII\nJezus umiera na Krzy??u",
          description:
              """???Tobie chwa??a, Chryste! Tobie, kt??ry krzy?? uczyni??e?? mostem ponad ??mierci??, aby po nim dusze mog??y przej???? z krainy ??mierci do krainy ??ycia??? (??w. Ireneusz).\n\nAnielskie si?? s??owa mieni??, Symeonowe si?? pe??ni??;\nAnio?? rzek??: Pe??na?? mi??o??ci, a jam dzi?? pe??na gorzko??ci.\nSymeon mi to powiedzia??, i?? me serce miecz przeb?????? mia??.""",
          previousStep: 11,
          nextStep: 13,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_13.jpg",
          caption:
              "Jasion wynios??y, odmiana zwisaj??ca (faximus excelsior pendulae)\nU Hebrajczyk??w sok z jesionu s??u??y?? do przemywania ran.",
          title: "Stacja XIII\nJezus z Krzy??a zdj??ty",
          description:
              """???O ??wi??ta Matko, miecz naprawd?? przenikn???? Twoj?? dusz??. Jedynie przenikaj??c dusz?? Matki, m??g?? dosi??gn???? cia??a Syna. Umar??emu Jezusowi, kt??remu nie mog??a ju?? zaszkodzi?? niemi??osierna w????cznia, otworzy??a bok, Tobie za?? przeszy??a serce. Jego duszy ju?? tam nie by??o, a Twoja nie mog??a si?? stamt??d oderwa??. Straszny b??l przeszy?? Twoj?? dusz??, tote?? zupe??nie s??usznie nazywamy Ci?? wi??cej ni?? M??czennic??, poniewa?? b??l wsp????cierpienia przewy??sza udr??k?? cia??a??? (??w. Bernard).\n\nNi ja ojca, matki, brata, ni ??adnego przyjaciela;\nsk??d??e pocieszenie mam mie??? Wola??abym stokro?? umrze??,\nni?? widzie?? ??o??nierza z??ego, co przebi?? bok Syna mego.""",
          previousStep: 12,
          nextStep: 14,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_14.jpg",
          caption:
              "D??b szypu??kowy (quercus robur)\nDrzewo to niebawem rozro??nie si?? pot????nie jak dzie??o Chrystusa. U ??yd??w panowa?? zwyczaj chowania zmar??ych pod d??bami.",
          title: "Stacja XIV\nJezus z??o??ony do grobu",
          description:
              """?????mier?? nie oddziela nas od siebie, poniewa?? wszyscy zd????amy t?? sam?? drog?? i odnajdziemy si?? w tym samym miejscu. Nie b??dziemy nigdy roz????czeni, poniewa?? ??yjemy dla Chrystusa i teraz jeste??my z????czeni z Chrystusem, id??c ku Niemu. Wszyscy razem b??dziemy kiedy?? z Chrystusem??? (??w. Szymon z Tesalonik).\n\nMatki, co synaczki macie, a jako si?? w nich wy kochacie,\nkiedy wam z nich jeden umrze, ci????ki b??l ma serce wasze;\nc???? ja, com mia??a jednego, ju?? nie mog?? mie?? inszego.""",
          previousStep: 13,
          nextStep: 15,
        ),
        StepItem(
          imageAsset: "assets/images/trip02/trip02_15.jpg",
          caption:
              "Drobne sadzonki ostrokrzewu (ilex)\nOstrokrzew symbolizuje ojcostwo, a jako ro??lina wiecznie zielona - nie??miertelno????.",
          title: "Stacja XV\nZmartwychwstanie Jezusa",
          description:
              """???Potrzebujemy ma??ych i wi??kszych nadziei, kt??re dzie?? po dniu podtrzymuj?? nas w drodze. Jednak bez wielkiej nadziei, kt??ra musi przewy??sza?? pozosta??e, s?? one niewystarczaj??ce. T?? wielk?? nadziej?? mo??e by?? jedynie B??g, kt??ry ogarnia wszech??wiat i kt??ry mo??e nam zaproponowa?? i da?? to, czego sami nie mo??emy osi??gn????. B??g jest fundamentem nadziei, nie jakikolwiek b??g, ale ten B??g, kt??ry ma ludzkie oblicze i umi??owa?? nas a?? do ko??ca: ka??d?? jednostk?? i ludzko???? w ca??o??ci??? (papie?? Benedykt XVI).\n\nO, niestety??, mi??y Panie, to?? nie ma??e roz????czenie;\nprzedtem by??o mi??owanie, a teraz ci????kie wzdychanie.\nCzemu??, Bo??e Ojcze, nie dbasz, o Synaczka pieczy nie masz?""",
          previousStep: 14,
          nextStep: 16,
        ),
        StepItem(
          type: StepType.end,
          title: "Zako??czenie",
          description:
              '???Ukrzy??owany Jezus jest wielkim ??odpustem?? ofiarowanym przez Ojca ludzko??ci jako przebaczenie win i zaproszenie do synowskiego ??ycia w Duchu ??wi??tym??? (??w. Jan Pawe?? II).\n\nDo nabo??e??stwa drogi krzy??owej przywi??zana jest ??aska odpustu zupe??nego pod zwyk??ymi warunkami: komunia ??wi??ta, modlitwa w intencjach papieskich oraz brak przywi??zania do grzechu. Odpust mo??na uzyska?? dla siebie lub dla jednej osoby zmar??ej.\n\nMedytowanie cierpie?? Chrystusa podczas drogi krzy??owej jest jednym z najpi??kniejszych chrze??cija??skich ??wicze?? duchowych, pozwalaj??cym pe??niej uczestniczy?? w Ofierze naszego Zbawiciela.',
          imageAsset: "assets/images/trip_02.png",
          previousStep: 15,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "03", // TODO: must fix
      title: "W Labiryncie",
      subtitle: "dla m??odzie??y",
      time: "30",
      age: "12+",
      distance: "0,3",
      rating: "4,5",
      description: "Wejd?? do klasztornego labiryntu i odkrywaj m??dro??ci staro??ytnych filozof??w.",
      imageAsset: "assets/images/trip_03.png",
      enabled: true,
      countPoints: false,
      stepList: <StepItem>[
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Wej??cie do labiryntu",
          description:
              'Labirynt to miejsce, do kt??rego ??atwo wej????, ale trudniej wyj????. Je??li jednak jeste?? tu po raz pierwszy, mo??esz mie?? trudno??ci z odnalezieniem r??wnie?? wej??cia.\n\nWarto wi??c skorzysta?? z mapki, kt??ra jest cz????ci?? tej aplikacji. Pomo??e Ci ona znale???? to miejsce nieopodal altanki filozof??w.\n\nZapraszamy do podr????y!',
          nextStep: 1,
        ),
        StepItem(
          imageAsset: "assets/images/trip_03.png",
          title: "Ogr??d Filozof??w",
          description:
              'Filozofia to nauka, kt??ra przybiera tyle odcieni, ile jest os??b j?? uprawiaj??cych. Zawsze pozostaje jednak tym, na co wskazuje jej grecka nazwa - phileo-sophia, czyli umi??owanie m??dro??ci.\n\nJest ona ???przygod????? w poszukiwaniu prawdy, kt??ra poci??gn????a i zafascynowa??a wielu ludzi. Nieliczni z nich wspominani s?? na tych stronicach.\n\nNie jest ona jednak ???przygod????? dla wybranych - ka??dy z nas mo??e stawia?? sobie pytania filozoficzne, docieka?? tego, co le??y u podstaw postrzeganej przez nas rzeczywisto??ci. Przed ka??dym cz??owiekiem uczciwie poszukuj??cym prawdy otwiera si?? droga do poznania siebie, ??wiata i Boga.\n\n??cie??ek wiod??cych przez filozofi?? jest wiele. Nie zniech??caj si??, Drogi Przyjacielu, ich r????norodno??ci??, ale otw??rz si?? na g??os m??dro??ci, przemawiaj??cy przez ka??d?? z nich.',
          previousStep: 0,
          nextStep: 2,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          title: "Legenda",
          description:
              'Ogr??d za??o??ony zosta?? na bazie labiryntu z krzew??w cisa pospolitego.\n\nZaprojektowano 14 plac??w, z kt??rych ka??dy po??wi??cony jest jednemu z filozof??w:\n\n  1. Sokrates\n  2. Platon\n  3. Arystoteles\n  4. Augustyn z Hippony\n  5. Tomasz z Akwinu\n  6. Kartezjusz\n  7. Immanuel Kant\n  8. Gottfried Wilhelm Leibniz\n  9. Georg Wilhelm Friedrich Hegel\n 10. S??ren Kierkegaard\n 11. J??zef Stanis??aw Tischner\n 12. Jan Pawe?? II (Karol Wojty??a)\n 13. Leszek Ko??akowski\n 14. Tadeusz Stycze??',
          previousStep: 1,
          nextStep: 3,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '???Poznaj samego siebie, a stanie przed tob?? otworem ca??y ??wiat???\n - Sokrates (469-399 r. p.n.e.)',
          title: "1. Sokrates",
          description:
              'Sokrates zapisa?? si?? w historii jako wz??r filozofa. Pyta?? napotykanych ludzi, co wiedz?? o sprawiedliwo??ci, pobo??no??ci, b??d?? te?? odwadze. Uwa??a??, ??e poznanie istoty tych cn??t prowadzi do cnotliwego ??ycia. Niestrudzenie prowokowa?? dyskusje, dlatego zosta?? Sokrates fa??szywie skazany na ??mier?? za psucie m??odzie??y. Zgin????, wypijaj??c trucizn?? - cykut??.\n\nPlacyk wybrukowany bia??ymi kamieniami. Kamie?? symbolizuje istnienie. Kamie?? koloru bia??ego to tak??e symbol szcz????cia, zwyci??stwa.',
          previousStep: 2,
          nextStep: 4,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???My??le?? to co prawdziwe, czu?? to co pi??kne i kocha?? co dobre - w tym cel rozumnego ??ycia???\n - Platon (427-347 r. p.n.e.)',
          title: "2. Platon",
          description:
              'Pochodz??cy z arystokracji Platon, ucze?? Sokratesa, by?? bardzo p??odnym i przenikliwym umys??em. W ???Dialogach??? spisa?? swoje pogl??dy - uwa??a??, ??e istnieje odr??bny ?????wiat idei???, w kt??rym idee ???cz??owieka???, ???dobra???, ?????wiat??a??? istniej?? w spos??b doskona??y. Konkretni ludzie, konkretne przyk??ady dobra itp. s?? tylko cieniami w por??wnaniu z pi??knem doskona??ych idei. Dusza ludzka przypomina sobie te idee, gdy?? kiedy??, nie b??d??c uwi??ziona w ciele, ogl??da??a je ???na w??asne oczy???.\n\nPlacyk wybrukowany zielonymi kamieniami. Ziele?? to symbol nadziei, b??ogostanu, dobroci.',
          previousStep: 3,
          nextStep: 5,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '???U pocz??tku filozofii stoi - zdziwienie???\n - Arystoteles (384-322 r. p.n.e.)',
          title: "3. Arystoteles",
          description:
              'Ucze?? Akademii Platona. Przyrodnik i lekarz, nauczyciel Aleksandra Wielkiego. Dokona?? podzia??u nauk na praktyczne i teoretyczne. W poznawaniu ??wiata uznawa?? za pierwszorz??dny czynnik empiryczny - zmys??owy, kt??ry jednak musi by?? poddany rozumowaniu. Wyodr??bni?? z filozofii logik??, jako ???organon??? - narz??dzie jej s??u????ce. Na gruncie tzw. filozofii pierwszej, tj. metafizyki, dowodzi?? m.in. istnienie Boga - Absolutu. Cz??owieka uwa??a?? za jedno???? duszy i cia??a, nie za?? jak jego nauczyciel, za dusz?? uwi??zion?? w ciele.\n\nNa placyku znajduje si?? studnia, a obok niej ro??nie grusza wierzbolistna (Pyrus salicifolia Pall.) przypominaj??ca swoim wygl??dem bardziej wierzb?? ni?? grusz??. Drzewo pochyla si?? nad studni?? jakby chcia??o zobaczy??, co kryje si?? w jej wn??trzu i niejako dziwi si??, widz??c na dnie studni bry??y z zielonego szk??a zamiast wody. Z owego ???zdziwienia??? rodzi owoce - ???gruszki na wierzbie???.',
          previousStep: 4,
          nextStep: 6,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '???Kochaj i r??b co chcesz???\n - Augustyn z Hippony (354-430 r.)',
          title: "4. Augustyn z Hippony",
          description:
              'Urodzony w Taga??cie w Afryce P????nocnej, z pocz??tku zwolennik herezji manicheizmu, nast??pnie, po nawr??ceniu, biskup Hippony. W swej filozofii pierwsze??stwo przyznawa?? poznaniu siebie samego oraz Boga. Prawdami, kt??re poznaje si?? najpewniej s??, wed??ug niego, prawdy wieczne - podobne do plato??skich idei, lecz zawarte w umy??le Boga. Poznanie ich mo??liwe jest tylko dzi??ki iluminacji - o??wieceniu przez ??ask?? Bo????. B??g jest Stw??rc?? ca??ego ??wiata, dlatego stworzony ??wiat jest dobry. Augustyn powiada - ???B??g nie stworzy?? z??a???.\n\nNa placyku uwag?? przyci??ga rosn??cy krzew r????y. Czerwona r????a jest powszechnie uznawana za symbol prawdziwej mi??o??ci. Prawdziwa mi??o???? zawsze afirmuje i nigdy nie krzywdzi.',
          previousStep: 5,
          nextStep: 7,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Cz??owiek nie jest dusz?? u??ywaj??c?? cia??a, lecz kompozycj?? duszy i cia??a???\n - Tomasz z Akwinu (1225-1274 r.)',
          title: "5. Tomasz z Akwinu",
          description:
              'Urodzony we w??oskiej rodzinie arystokratycznej, studiowa?? w klasztorze Monte Cassino, za?? w 1243 roku zosta?? dominikaninem, wybitnym pisarzem filozoficznym (Summa contra gentiles) i teologicznym (Summa theologiae). Uwa??a??, ??e filozofia i teologia nie s?? sobie przeciwne, lecz mog?? si?? uzupe??nia??. On dokona?? przystosowania my??li Arystotelesa do wymog??w ??redniowiecznej filozofii, wzbogacaj??c t?? my??l o zagadnienie ???istnienia???. Dowodzi?? istnienia Boga na wiele sposob??w (s??ynnych pi???? dr??g ??w. Tomasza). M??wi??, ??e istot?? Boga jest istnienie.\n\nPlacyk wybrukowany na wz??r szachownicy z czarnych i czerwonych kamyk??w. Szachownic?? t?? oplata ro??lina wykonana z bia??ych kamyk??w symbolizuj??ca ludzk?? dusz??.',
          previousStep: 6,
          nextStep: 8,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption: '???My??l??, wi??c jestem???\n - Kartezjusz (1596-1650 r.)',
          title: "6. Kartezjusz",
          description:
              'Wychowanek szk???? jezuickich, uczony podr????nik i obserwator. Rozpocz???? swoisty ???przewr??t kopernika??ski??? w filozofii. Zawiedziony dotychczasow?? wiedz??, chcia?? uzyska?? wiedz?? jasn?? i wyra??n?? - nieuwarunkowan?? wcze??niejszymi pogl??dami. W tym celu wybra?? drog?? metodycznego sceptycyzmu - w??tpi?? we wszystko, szukaj??c takiej prawdy, w kt??r?? nie mo??na zw??tpi??. Odnalaz?? j?? w s??ynnym ???cogito, ergo sum??? - my??l??, wi??c jestem. Od tej prawdy wychodz??c, stara?? si?? skonstruowa?? filozofi?? nieomyln?? na wz??r matematyki.\n\nNa placyku wybrukowanym granitow?? kostk?? usytuowany jest sze??cian a na nim kula. Sze??cian to symbol symetrii, r??wnowagi, sta??o??ci, harmonii. Kula za?? jest symbolem prawid??owo??ci, pi??kna, doskona??o??ci. Granitowa kostka brukowa, symbolizuj??ca my??li, tworzy kr??gi pocz??wszy od punktu ???zero???, kt??ry znajduje si?? pod figurami geometrycznymi daj??cymi niejako pocz??tek my??lenia.',
          previousStep: 7,
          nextStep: 9,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Niebo gwia??dziste nade mn?? i prawo moralne we mnie. S?? to dla mnie dowody, ??e jest B??g nade mn?? i B??g we mnie???\n - Immanuel Kant (1724-1804 r.)',
          title: "7. Immanuel Kant",
          description:
              'Urodzony w Kr??lewcu (obecnie Kaliningrad), tam prze??y?? ca??e swe ??ycie. Dopiero w p????niejszym okresie ??ycia wyg??osi?? now?? filozofi?? tzw. krytyczn??. Doprowadzi??a ona do ko??ca ???przewr??t kopernika??ski??? Kartezjusza. Kant twierdzi??, ??e ludzie w poznawaniu ??wiata nie poznaj?? tak naprawd?? rzeczy ???samych w sobie???, ale widz?? je tak, jak ???ka??e??? je im widzie?? ich umys??. W swej etyce Kant wypracowa?? tzw. imperatyw kategoryczny - dost??pn?? dla ka??dego zasad?? post??powania, nakazuj??c?? czyni?? to, co chcia??oby si??, aby i inni nam czynili.\n\nBruk tego placyku przypomina ciemn?? galaktyk?? z jasnymi gwiazdami, kt??re j?? roz??wietlaj??. ',
          previousStep: 8,
          nextStep: 10,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Gdyby ten ??wiat nie by?? najdoskonalszy z mo??liwych, B??g by go nie stworzy?????\n - Gottfried Wilhelm Leibniz (1646-1716 r.)',
          title: "8. Gottfried Wilhelm Leibniz",
          description:
              'Powiedziano o nim ???ostatni cz??owiek na ??wiecie, kt??ry wiedzia?? wszystko???. Wszechstronny umys??, obeznany z polityk?? Europy, po??wi??ci?? si?? zagadnieniom zwi??zanym z Bogiem i ??wiatem. B??g wed??ug niego stworzy?? ten ??wiat i ju?? u jego zarania ustanowi?? w nim ???zaprogramowan?? harmoni????? - ??ac. harmonia praestabilita - mia??a by?? to odpowied?? na problem istnienia z??a. ??wiat wed??ug Leibniza sk??ada si?? z monad - podstawowego tworzywa rzeczywisto??ci, kt??rych wielo???? i r????norodno???? odpowiedzialna jest za r????norodno????, kt??r?? widzimy w ??wiecie.\n\nPlacyk wybrukowany na wz??r symetrycznych kr??g??w rozchodz??cych si?? z jednego punktu. Zataczane kr??gi u??o??one s?? z r????norodnej kostki brukowej pocz??wszy od tej o najmniejszych wymiarach i najja??niejszych kolorach do coraz wi??kszych i ciemniejszych. Ca??o???? sprawia wra??enie przemy??lanego i dok??adnie zaplanowanego dzie??a.',
          previousStep: 9,
          nextStep: 11,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???To co jest wytworzone z formy czystej my??li, a nie moc?? autorytetu, tylko to nale??y do filozofii???\n - Georg Wilhelm Friedrich Hegel (1770-1831 r.)',
          title: "9. Georg Wilhelm Friedrich Hegel",
          description:
              'Filozof ten by?? my??licielem trudnym w odbiorze - poziom abstrakcji jego my??lenia skutecznie a?? do dzi?? uniemo??liwia niekt??rym odbi??r jego nauczania. Nie mia?? on jednak r??wnych sobie w dziedzinie historii dziej??w - uwa??a?? j?? za nieustanny, post??puj??cy na zasadzie ewolucji, rozw??j ducha my??li ludzkiej, przejawiaj??cej si?? w kolejnych etapach. G????wnym prawem rozwoju ducha mia??o by?? z????czenie dw??ch r????nych skrajno??ci - teza i antyteza, mia??y razem prowadzi?? do syntezy - jest to tzw. prawo dialektyki. Rozwin???? tak??e problem pa??stwa, jako ???boskiej idei istniej??cej na ziemi???.\n\nPlacyk wybrukowany granitow?? kostk??, pomi??dzy kt??r?? wkomponowane s?? bry??y szk??a symbolizuj??ce form?? czystej my??li.',
          previousStep: 10,
          nextStep: 12,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Cz??owiek jest syntez?? niesko??czono??ci i sko??czono??ci, doczesno??ci i wieczno??ci, wolno??ci i konieczno??ci, jednym s??owem, syntez?????\n - S??ren Kierkegaard (1813-1855 r.)',
          title: "10. S??ren Kierkegaard",
          description:
              'Nazwany ojcem egzystencjalizmu, kierunku w filozofii, kt??ry skupia si?? nie na oderwanych od ??ycia spekulacjach, ale w??a??nie na codziennym do??wiadczeniu cz??owieka. Nieobca by??a mu zaduma nad ma??o??ci?? i krucho??ci?? cz??owieka wobec Boga. Rozwa??a?? zagadnienia zwi??zane z religi??, np. analizowa?? biblijny zapis o Abrahamie i Izaaku, zastanawiaj??c si?? nad kwesti?? zaufania Bogu. Uzna??, ??e ??ycie ludzkie mo??na podzieli?? na trzy etapy - estetyczny (poszukiwanie przyjemno??ci), etyczny (poszukiwanie dobra) i religijny (uznanie swojej grzeszno??ci i zwr??cenie si?? do Boga).\n\nPlacyk wybrukowany kamieniami o r????nych rozmiarach, kszta??tach i kolorach. Ukazany zosta?? w ten spos??b symbol pewnej syntezy.',
          previousStep: 11,
          nextStep: 13,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Gdy cz??owiek nie wie, co zrobi??, sumienie m??wi mu tylko jedno: szukaj???\n - J??zef Stanis??aw Tischner (1931-2000 r.)',
          title: "11. J??zef Stanis??aw Tischner",
          description:
              'Znany polski kap??an, filozof, kapelan Zwi??zku Podhalan, kawaler Orderu Or??a Bia??ego. W swojej filozofii, kt??r?? okre??li?? mianem ???filozofii dramatu??? zawar?? szczeg??ln?? cech?? charakterystyczn?? - chcia?? patrze?? na cz??owieka nie poprzez pryzmat za??o??e?? systemu my??li, ale niemal??e jako na aktora, graj??cego na scenie ??ycia sw??j najwi??kszy dramat. St??d te?? wiele temat??w poruszanych przez Tischnera mia??o zwi??zek z ??yciem codziennym - zastanawia?? si?? nad nowym ??adem spo??ecznym. Wskazywa?? na ???dialog??? - jako podstawow?? zasad?? spotkania z drugim cz??owiekiem.\n\nPlacyk swym uk??adem przypomina wybrukowany g??rski szlak, przy kt??rym ro??nie kosodrzewina i znajduje si?? symboliczny drogowskaz pomagaj??cy odszuka?? drog?? zagubionym. ',
          previousStep: 12,
          nextStep: 14,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Wczoraj do ciebie nie nale??y. Jutro niepewne... Tylko dzi?? jest twoje???\n - Jan Pawe?? II (Karol Wojty??a) (1920-2005 r.)',
          title: "12. Jan Pawe?? II (Karol Wojty??a)",
          description:
              'Karol Wojty??a jako filozof da?? si?? pozna?? jako przedstawiciel nurtu zwanego personalizmem. Dodatkowo w jego my??li da si?? odczyta?? wp??yw my??li ??w. Tomasza z Akwinu. Personalizm, g??oszony przez niego stawia cz??owieka i jego godno???? jako osoby za podstaw?? wszelkiej oceny moralnej. Cz??owiek najpe??niej wyra??a si?? w swoim ??wiadomym i wolnym czynie (st??d tytu?? znacz??cej ksi????ki Wojty??y ???Osoba i czyn???). Filozoficzna fascynacja cz??owiekiem jako posiadaj??cym niezwyk???? warto????, wp??yn????a tak??e w znacznym stopniu na teologiczne pogl??dy Karola Wojty??y.\n\nPlacyk wybrukowany kamieniami w trzech kolorach: czarny - symbolizuj??cy przesz??o????, bia??y - tera??niejszo????, zielony - przysz??o????. Na placyku po stronie zielonego bruku (przysz??o??ci) znajduje si?? taboret (tron). Jest on stosunkowo wysoki, dlatego stoj??c przy nim mo??na poczu?? si?? jak dziecko stoj??ce przy taborecie dla osoby doros??ej. Aby usi?????? na nim, trzeba si?? wspi???? albo podci??gn????. Jest to symboliczne ukazanie, i?? do my??li Karola Wojty??y trzeba nam ???dorasta?????, by j?? w przysz??o??ci m??c w pe??ni zrozumie??.',
          previousStep: 13,
          nextStep: 15,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???W??asn?? ??mierci?? mo??na w??asne ??ycie tylko potwierdzi??, ale zaprzeczy?? mu nie mo??na, poniewa?? nasza ??mier?? czyni dopiero nasze ??ycie ostatecznie nieodmiennym???\n - Leszek Ko??akowski (1927-2009 r.)',
          title: "13. Leszek Ko??akowski",
          description:
              'W pierwszym okresie swojej dzia??alno??ci (mniej wi??cej do 1966 roku) pisa?? dzie??a o charakterze marksistowskim, wspieraj??c tym samym ideologi?? w??adz PRL-u. Dopiero p????niej zacz???? podejmowa?? tematy zwi??zane z szeroko poj??t?? my??l?? chrze??cija??sk?? i histori?? filozofii, jednocze??nie poddaj??c krytyce ideologi?? marksistowsk??. Z tego powodu musia?? emigrowa?? z kraju - osiad?? w Oksfordzie, gdzie mieszka?? a?? do ??mierci.\n\nNa szaro-czarnym bruku tego placyku znajduj?? si?? cz????ci po??amanych zabytkowych kolumn kamiennych symbolizuj??cych nieuchronno???? ??mierci.',
          previousStep: 14,
          nextStep: 16,
        ),
        StepItem(
          imageAsset: "assets/images/trip03/trip03_mapa.png",
          caption:
              '???Mi??owa?? prawd?? - wszelk?? i we wszystkim - to dla cz??owieka by?? samym sob?? i ocali?? samego siebie???\n - Tadeusz Stycze?? (1931-2010 r.)',
          title: "14. Tadeusz Stycze??",
          description:
              'Salwatorianin, etyk i wieloletni przyjaciel Karola Wojty??y oraz jego nast??pca na katedrze Etyki KUL-u, odznaczony Orderem Odrodzenia Polski. Podejmowa?? zagadnienia zwi??zane z ludzkim post??powaniem, kt??re wed??ug niego powinno zawsze pozostawa?? wierne prawdzie rozpoznanej przez cz??owieka - wyja??nia?? ten mechanizm m.in. na przyk??adzie bohaterki antycznego dramatu - Antygony. Innym z podejmowanych przeze?? temat??w, by??o usytuowanie etyki w??r??d wielu r????nych dziedzin wiedzy jako dyscypliny naukowej.\n\nPlacyk wybrukowany ma??ymi otoczakami, po??r??d kt??rych znajduje si?? solidnie osadzony du??y g??az. G??az ten symbolizuje prawd??, kt??ra jest jedna, sta??a i pewna. Tylko ??ycie w prawdzie sprawia, ??e cz??owiek staje si?? prawdziwie wolny (???Poznacie prawd??, a prawda was wyzwoli??? J 8,32).',
          previousStep: 15,
          nextStep: 17,
        ),
        StepItem(
          type: StepType.end,
          title: "Dzi??kujemy",
          description:
              'To ju?? koniec podr????y po ogrodzie filozof??w, ale przygoda poszukiwania m??dro??ci trwa przez ca??e ??ycie.\n\n??yczymy Ci, Drogi Przyjacielu, aby to spotkanie z filozofami z przesz??o??ci zrodzi??o w Tobie nowe pytania i zapa?? do szukania na nie odpowiedzi.',
          imageAsset: "assets/images/trip_03.png",
          previousStep: 16,
          nextStep: -1,
        ),
      ],
    ),
    TripItem(
      uid: "04", // TODO: must fix
      title: "W Zamku",
      subtitle: "dla wszystkich",
      time: "50",
      age: "12+",
      distance: "0,5",
      rating: "5,0",
      description: "Wejd?? do naszego zamku i odkryj tajemnice dawnych czas??w.",
      imageAsset: "assets/images/trip_04.png",
      enabled: false,
      countPoints: false,
      stepList: <StepItem>[],
    ),
  ];
}
