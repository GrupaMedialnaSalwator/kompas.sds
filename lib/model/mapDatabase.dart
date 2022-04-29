/// This class will handle data loading from FireBase

import 'package:flutter/material.dart';
import 'package:kompas/statics/colors.dart';
import 'package:kompas/statics/constants.dart';
import 'package:line_icons/line_icons.dart';

enum MapItemType {
  block,
  building_large,
  building_small,
  chapel,
  church,
  cross,
  house,
  info,
  labyrinth,
  monument,
  parking,
  philosophy,
  pin,
  plant,
  tree,
  worship
}

class MapData {
  MapData({
    this.uid = "",
    required this.gpsMinX,
    required this.gpsMinY,
    required this.gpsMaxX,
    required this.gpsMaxY,
    required this.mapSizeX,
    required this.mapSizeY,
    this.initX = 0,
    this.initY = 0,
    required this.mapItems,
  });

  String uid;
  double gpsMinX;
  double gpsMinY;
  double gpsMaxX;
  double gpsMaxY;
  double mapSizeX;
  double mapSizeY;
  double initX;
  double initY;
  List<MapItem> mapItems;
}

/// API for map item data
///
class MapItem {
  MapItem({
    required this.locationX,
    required this.locationY,
    this.initX = 0,
    this.initY = 0,
    this.uid = "", // TODO: add uid generator
    this.imageAsset = Constants.defaultImage,
    this.type = MapItemType.house,
    this.title = "Title",
    this.subtitle = "Subtitle",
    this.rating = 5.0,
    this.description = "Description",
    this.color = AppColors.primaryNormal,
    this.tripIndexLink = -1,
    this.enabled = true,
  });

  double locationX;
  double locationY;
  double initX;
  double initY;
  String uid;
  String imageAsset;
  MapItemType type;
  String title;
  String subtitle;
  double rating;
  String description;
  Color color;
  int tripIndexLink;
  bool enabled;

  static IconData getTypeIcon(MapItemType type) {
    switch (type) {
      case MapItemType.block:
        return LineIcons.hotel;
      case MapItemType.building_large:
        return LineIcons.city;
      case MapItemType.building_small:
        return LineIcons.home;
      case MapItemType.chapel:
        return LineIcons.church;
      case MapItemType.church:
        return LineIcons.church;
      case MapItemType.cross:
        return LineIcons.cross;
      case MapItemType.house:
        return LineIcons.home;
      case MapItemType.info:
        return LineIcons.info;
      case MapItemType.labyrinth:
        return LineIcons.mapSigns;
      case MapItemType.monument:
        return LineIcons.monument;
      case MapItemType.parking:
        return LineIcons.parking;
      case MapItemType.philosophy:
        return LineIcons.school;
      case MapItemType.plant:
        return LineIcons.carrot;
      case MapItemType.tree:
        return LineIcons.tree;
      case MapItemType.worship:
        return LineIcons.prayingHands;
      case MapItemType.pin:
      default:
        return LineIcons.mapMarker;
    }
  }
}

/// Generates data for all map items
/// Future work: dynamically load data from online DB (Firebase)
MapData generateMapData() {
  return MapData(
    gpsMinX: 16.813265024669818,
    gpsMinY: 51.33952905079323,
    gpsMaxX: 16.821820563147043,
    gpsMaxY: 51.33429396425001,
    initX: 900,
    initY: 900,
    mapSizeX: 1600.0,
    mapSizeY: 1600.0,
    mapItems: [
      MapItem(
        locationX: 760,
        locationY: 790,
        uid: '01', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_01.png",
        type: MapItemType.building_large,
        title: 'Zamek',
        subtitle: 'WSD Salwatorianów',
        description:
            'Właściwie nie jest to zamek, lecz pałac, ale w nomenklaturze salwatoriańskiej przyjęło się ten piękny budynek nazywać zamkiem. Pochodzi on z XVIII wieku i obecnie znajduje się w nim Wyższe Seminarium Salwatorianów oraz klasztor. To w tym budynku mieszkają i studiują klerycy, przygotowując się do przyjęcia święceń kapłańskich.\n\nWarto poznać historię tego budynku i zwiedzić jego wnętrze. Zapraszamy w każdą niedzielę o godzinie 14:00, 15:00 i 16:00. Wystarczy wejść do środka i zapytać furtiana o możliwość oprowadzenia.\n\nZapraszamy!',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 730,
        locationY: 1190,
        uid: '02', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_02.png",
        type: MapItemType.chapel,
        title: 'Diaspora',
        subtitle: 'Kapliczka w parku',
        description:
            'Drewniana kapliczka przyjęła nazwę diaspora, co oznacza z greckiego grupę etniczną lub religijną żyjącą w odosobnieniu. Nie wiadomo do końca skąd wzięła się ta nazwa, ale prawdopodobnie kiedyś katolicy żyjący w tej miejscowości byli w mniejszości ze względu na dużą ilość protestantów.\n\nWarto wejść do środka, przyklęknąć na chwilę i pomodlić się. Można również skorzystać z koszyka z intencjami po lewej stronie od wejścia, gdzie znajdują się chlebki z wygrawerowanymi na nich numerkami. Po wyciągnięciu numerka należy sprawdzić intencję do omodlenia na przygotowanej tablicy.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 590,
        locationY: 1320,
        uid: '03', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_03.png",
        type: MapItemType.monument,
        title: 'Obelisk',
        subtitle: 'Trzy filary zakonników',
        description:
            'W tym miejscu znajduje się popiersie dwóch ważnych osób dla zgromadzenia Salwatorianów: bł. Franciszka Jordana - naszego założyciela oraz ks. Bonawentury Lüthena - jego najbliższego współpracownika i przyjaciela.\n\nZnajdują się tu także łacińskie nazwy ślubów, które składają zakonnicy na całym świecie, a więc ślub czystości (castitas), ubóstwa (paupertas) i posłuszeństwa (oboedientia).\n\nDo tych trzech ślubów Salwatorianie dodają jeszcze zaangażowanie w konkretne apostolstwo (apostolatus). Jest dla nas bardzo ważne i wyraża się w realizacji charyzmatu głoszenia Ewangelii wszystkim, wszędzie i wszelkimi możliwymi sposobami.',
        rating: 4.0,
        enabled: true,
      ),
      MapItem(
        locationX: 890,
        locationY: 960,
        uid: '04', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_04.png",
        type: MapItemType.worship,
        title: 'Grota Matki Bożej',
        subtitle: 'Miejsce modlitwy',
        description:
            'Grota Matki Bożej powstała na wzór groty z Lourdes. Jest to wyjątkowe miejsce dla wszystkich Salwatorianów, ponieważ podobnie jak nasz założyciel z całego serca czcimy Najświętszą Maryję Pannę.\n\nGrota jest miejscem, gdzie członkowie bagieńskiej wspólnoty najcześciej modlą się różańcem. W miesiącu maju odprawiane są tutaj nabożeństwa majowe, podczas których jeden z kleryków wygłasza zwyczajową egzortę wchodząc na ambonę po lewej stronie groty.\n\nWarto zaczekać do zachodu słońca, kiedy to grota Matki Bożej jest podświetlona i przedstawia niezwykle malowniczy widok.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 940,
        locationY: 990,
        uid: '05', // TODO: implement proper UID
        imageAsset: "assets/images/trip02/trip02_mapka.jpg",
        type: MapItemType.cross,
        title: 'Droga Krzyżowa',
        subtitle: 'Przestrzeń dla duszy',
        description:
            'Każda stacja bagieńskiej kalwarii zawiera głaz naznaczony krzyżem oraz towarzyszące symboliczne drzewko lub krzew, których nazwy i właściwości wspomagają medytację.\n\nZałożyciel Salwatorianów, błogosławiony Franciszek Maria od Krzyża Jordan często powtarzał, że wielkie rzeczy dojrzewają w cieniu krzyża.\n\nZapraszamy do towarzyszenia Panu Jezusowi na drodze krzyżowej poprzez nawiedzenie wszystkich stacji i modlitewne rozważanie ich treści.',
        rating: 5.0,
        tripIndexLink: 1,
        enabled: true,
      ),
      MapItem(
        locationX: 1030,
        locationY: 650,
        uid: '06', // TODO: implement proper UID
        imageAsset: "assets/images/trip01/trip01_01.jpg",
        type: MapItemType.parking,
        title: 'Parking',
        subtitle: 'Serdecznie witamy',
        description:
            'Bardzo się cieszymy, że nas odwiedzasz i zapraszamy do zwiedzania naszego kompleksu klasztornego w Wyższym Seminarium Duchownym Salwatorianów w Bagnie.\n\nPrzygotowaliśmy dla Ciebie przewodnik w postaci niniejszej aplikacji, który zawiera kilka ciekawych podróży po naszym klasztornym terenie.\n\nJeśli jesteś gotowy rozpocząć z tego miejsca parkingowego, to zapraszamy do gry terenowej dla całej rodziny!',
        rating: 5.0,
        tripIndexLink: 0,
        enabled: true,
      ),
      MapItem(
        locationX: 990,
        locationY: 750,
        uid: '07', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_05.png",
        type: MapItemType.monument,
        title: 'Pomnik',
        subtitle: 'Bł. Franciszek Jordan',
        description:
            'Nasz założyciel to błogosławiony Franciszek Maria od Krzyża Jordan. Od Niego zaczęło się to wielkie salwatoriańskie dzieło trwające już ponad sto lat.\n\nFranciszek Jordan był skromnym kapłanem, pochodzącym z ubogiej rodziny. Na skutek prześladowań w Niemczech w XIX wieku musiał udać się do Rzymu, gdzie studiował języki, do których miał ogromny talent. Tam też odkrył powołanie do założenia zgromadzenia, które miało głosić Jezusa Chrystusa wszystkim, wszędzie i wszelkimi możliwymi sposobami.\n\nTak powstali Salwatorianie, którzy do dziś starają się realizować testament swojego duchowego ojca.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 995,
        locationY: 810,
        uid: '08', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_06.png",
        type: MapItemType.philosophy,
        title: 'Altanka filozofów',
        subtitle: 'Miejsce filozofowania',
        description:
            'Altanka jest starsza od znajdującego się nieopodal labiryntu filozofów, ale oba miejsca się ze sobą łączą. Tutaj w razie niepogody można się schronić lub odpocząć po długim zwiedzaniu. Można tutaj również pofilozofować.\n\nInspiracją do podjęcia ciekawych dyskusji mogą być tabliczki z cytatami filozofów znajdujące się w niedalekim labiryncie.\n\nŻyczymy owocnych rozważań.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 570,
        locationY: 780,
        uid: '09', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_07.png",
        type: MapItemType.tree,
        title: 'Buk płaczący',
        subtitle: 'Miejsce odpoczynku',
        description:
            'Ten buk to jedno z najbardziej malowniczych i charakterystycznych drzew w naszym parku. Latem daje upragniony cień, wiosną jest idealnym miejscem na wypoczynek, zimą ozdabia parkową scenerię, a jesienią zrzuca mnóstwo liści na alejkę prowadzącą do nowicjatu.\n\nWedług legendy system korzeniowy tego drzewa prowadzi aż do pobliskiego stawu, stąd pobiera odpowiednią ilość wody do wzrostu.\n\nZachęcamy do odpoczynku pod tym wyjątkowym, starym bukiem.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 420,
        locationY: 800,
        uid: '10', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_08.png",
        type: MapItemType.building_small,
        title: 'Nowicjat',
        subtitle: 'Dla początkujących',
        description:
            'To właśnie w tym ceglanym budynku mieści się nowicjat salwatorianów polskiej prowincji. Na co dzień żyją tu młodzi mężczyźni, którzy przygotowują się do nałożenia habitu i złożenia pierwszej profesji zakonnej (ślubu bezżennej czystości, ubóstwa i posłuszeństwa) w Towarzystwie Boskiego Zbawiciela (Salwatorianie).\n\nEtap nowicjatu w naszym zakonie trwa cały rok (do 8 września). Nowicjusze w tym czasie poznają życie zakonne, pogłębiają modlitwę, uczą się, a także pracują - najczęściej w klasztornym ogrodzie. Oprócz obowiązków jest też miejsce na realizację własnych pasji, czytanie książek oraz budowanie wspólnoty. Robimy to poprzez sport, gry, film, spotkania przy kawie lub wspólnotowe wypady w góry.\n\nW celu lepszego przygotowania się do życia zakonnego nowicjusze nie korzystają swobodnie z Internetu,  mediów (tv, radio), czy telefonów komórkowych. Nie używają też pieniędzy, ani nie odwiedzają rodzinnego domu. Z najbliższymi kontaktują się poprzez tradycyjne listy, a także w wyznaczone niedziele odbierają od nich telefony. Jest to więc rok próby, ale także czas wielu Bożych łask. Każdy Salwatorianin ze wzruszeniem wspomina swoje nowicjackie chwile, kiedy to stawał u początku życia zakonnego.\n\nWokół domu nowicjatu dbamy o ciszę i prywatność – zakonną klauzurę. Gdy spotkasz, któregoś z braci nowicjuszy, śmiało możesz porozmawiać. Oprócz serdecznego uśmiechu prosimy by wesprzeć nas modlitwą o dobre rozeznanie powołania.',
        rating: 4.0,
        enabled: true,
      ),
      MapItem(
        locationX: 340,
        locationY: 600,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_09.png",
        type: MapItemType.block,
        title: 'Dom „ToTu”',
        subtitle: 'Centrum dla młodzieży',
        description:
            'Kiedyś mieścił się tutaj klerykat - miejsce, gdzie mieszkali wszyscy przygotowujący się do kapłaństwa. Teraz dom przejęli księża z apostolatów młodzieżowych. Działa tutaj Ruch Młodzieży Salwatoriańskiej i Salwatoriański Ośrodek Powołań, prowadzone są rekolekcje dla młodzieży, różne warsztaty, dni skupienia oraz wiele innych inicjatyw.\n\nDom „ToTu” może również służyć jako baza noclegowa. Oferujemy trzyosobowe pokoje z łazienkami, kaplicę, sale konferencyjne, oraz jadalnię w której istnieje możliwość zamówienia posiłków.\n\nWarto bliżej zainteresować się ofertą tego miejsca i polecić je innym - zwłaszcza znajomym nastolatkom.\n\nWięcej informacji o tym domu znajduje się na stronie: https://totu.sds.pl.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1130,
        locationY: 990,
        uid: '12', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_10.png",
        type: MapItemType.plant,
        title: 'Ogród zakonny',
        subtitle: 'Miejsce pracy',
        description:
            'W naszym ogrodzie od pokoleń uprawiane są warzywa i owoce, które później znajdują się na stole naszej salwatoriańskiej wspólnoty.\n\nTo tutaj bracia zakonni we współpracy z siostrami, nowicjuszami i osobami świeckimi troszczą się o zdrową i świeżą żywność. Uprawiają prawie wszystko - od jabłek, przez truskawki, aż po rabarbar.\n\nW tygodniu można tutaj kupić warzywa, owoce, lub ozdobny kwiatek do domu jako pamiątkę odwiedziń w Bagnie. Zakupy można zrobić poza okresem zimowym w godzinach od 9:00 do 16:00.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1080,
        locationY: 820,
        uid: '13', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_11.png",
        type: MapItemType.labyrinth,
        title: 'Labirynt filozofów',
        subtitle: 'Miejsce rozmyślań',
        description:
            'Labirynt, który tutaj się znajduje, kryje w sobie 14 cytatów słynnych myślicieli - filozofów, żyjących na przestrzeni wielu lat: od Sokratesa po Jana Pawła II. Każdy myśliciel jest opisany w książce znajdującej się przy wejściu, a także w naszej aplikacji.\n\nWarto zatrzymać się nad ciekawymi cytatami, porozmyślać nad nimi, choć trzeba być niezwykle ostrożnym - w gąszczu rozważań filozoficznych niejeden już się zgubił.\n\nZachęcamy do wejścia w głąb naszego labiryntu i zmierzenie się z najważniejszymi pytaniami ludzkości.',
        rating: 5.0,
        tripIndexLink: 2,
        enabled: true,
      ),
      MapItem(
        locationX: 1290,
        locationY: 205,
        uid: '14', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_12.png",
        type: MapItemType.church,
        title: 'Kościół parafialny',
        subtitle: 'pw. Wniebowzięcia NMP',
        description:
            'Pierwsza wzmianka o kościele w Bagnie pochodzi z 1353 roku. Wiadomo, że w roku 1598 kościół stał się na moment luterański, by w 1654 roku stać się na nowo kościołem katolickim. W 1759 roku kościół spalił się i na jego miejsce wzniesiono nowy. Jednak na początku XX wieku stan techniczny kościoła był bardzo zły, więc postawiono w latach 1906-1907 nowy kościół, który służy do dziś.\n\nObecnie posługują tutaj księża Salwatorianie, a obok kościoła znajduje się salwatoriański grobowiec.\n\nWięcej informacji o parafii, jej historii, oraz godzinach mszy świętych i nabożeństw można znaleźć na stronie: http://www.bagno.sds.pl.',
        rating: 4.0,
        enabled: true,
      ),
    ],
  );
}
