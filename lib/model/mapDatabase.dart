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
        subtitle: 'WSD Salwatorian??w',
        description:
            'W??a??ciwie nie jest to zamek, lecz pa??ac, ale w nomenklaturze salwatoria??skiej przyj????o si?? ten pi??kny budynek nazywa?? zamkiem. Pochodzi on z XVIII wieku i obecnie znajduje si?? w nim Wy??sze Seminarium Salwatorian??w oraz klasztor. To w tym budynku mieszkaj?? i studiuj?? klerycy, przygotowuj??c si?? do przyj??cia ??wi??ce?? kap??a??skich.\n\nWarto pozna?? histori?? tego budynku i zwiedzi?? jego wn??trze. Zapraszamy w ka??d?? niedziel?? o godzinie 14:00, 15:00 i 16:00. Wystarczy wej???? do ??rodka i zapyta?? furtiana o mo??liwo???? oprowadzenia.\n\nZapraszamy!',
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
            'Drewniana kapliczka przyj????a nazw?? diaspora, co oznacza z greckiego grup?? etniczn?? lub religijn?? ??yj??c?? w odosobnieniu. Nie wiadomo do ko??ca sk??d wzi????a si?? ta nazwa, ale prawdopodobnie kiedy?? katolicy ??yj??cy w tej miejscowo??ci byli w mniejszo??ci ze wzgl??du na du???? ilo???? protestant??w.\n\nWarto wej???? do ??rodka, przykl??kn???? na chwil?? i pomodli?? si??. Mo??na r??wnie?? skorzysta?? z koszyka z intencjami po lewej stronie od wej??cia, gdzie znajduj?? si?? chlebki z wygrawerowanymi na nich numerkami. Po wyci??gni??ciu numerka nale??y sprawdzi?? intencj?? do omodlenia na przygotowanej tablicy.',
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
        subtitle: 'Trzy filary zakonnik??w',
        description:
            'W tym miejscu znajduje si?? popiersie dw??ch wa??nych os??b dla zgromadzenia Salwatorian??w: b??. Franciszka Jordana - naszego za??o??yciela oraz ks. Bonawentury L??thena - jego najbli??szego wsp????pracownika i przyjaciela.\n\nZnajduj?? si?? tu tak??e ??aci??skie nazwy ??lub??w, kt??re sk??adaj?? zakonnicy na ca??ym ??wiecie, a wi??c ??lub czysto??ci (castitas), ub??stwa (paupertas) i pos??usze??stwa (oboedientia).\n\nDo tych trzech ??lub??w Salwatorianie dodaj?? jeszcze zaanga??owanie w konkretne apostolstwo (apostolatus). Jest dla nas bardzo wa??ne i wyra??a si?? w realizacji charyzmatu g??oszenia Ewangelii wszystkim, wsz??dzie i wszelkimi mo??liwymi sposobami.',
        rating: 4.0,
        enabled: true,
      ),
      MapItem(
        locationX: 890,
        locationY: 960,
        uid: '04', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_04.png",
        type: MapItemType.worship,
        title: 'Grota Matki Bo??ej',
        subtitle: 'Miejsce modlitwy',
        description:
            'Grota Matki Bo??ej powsta??a na wz??r groty z Lourdes. Jest to wyj??tkowe miejsce dla wszystkich Salwatorian??w, poniewa?? podobnie jak nasz za??o??yciel z ca??ego serca czcimy Naj??wi??tsz?? Maryj?? Pann??.\n\nGrota jest miejscem, gdzie cz??onkowie bagie??skiej wsp??lnoty najcze??ciej modl?? si?? r????a??cem. W miesi??cu maju odprawiane s?? tutaj nabo??e??stwa majowe, podczas kt??rych jeden z kleryk??w wyg??asza zwyczajow?? egzort?? wchodz??c na ambon?? po lewej stronie groty.\n\nWarto zaczeka?? do zachodu s??o??ca, kiedy to grota Matki Bo??ej jest pod??wietlona i przedstawia niezwykle malowniczy widok.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 940,
        locationY: 990,
        uid: '05', // TODO: implement proper UID
        imageAsset: "assets/images/trip02/trip02_mapka.jpg",
        type: MapItemType.cross,
        title: 'Droga Krzy??owa',
        subtitle: 'Przestrze?? dla duszy',
        description:
            'Ka??da stacja bagie??skiej kalwarii zawiera g??az naznaczony krzy??em oraz towarzysz??ce symboliczne drzewko lub krzew, kt??rych nazwy i w??a??ciwo??ci wspomagaj?? medytacj??.\n\nZa??o??yciel Salwatorian??w, b??ogos??awiony Franciszek Maria od Krzy??a Jordan cz??sto powtarza??, ??e wielkie rzeczy dojrzewaj?? w cieniu krzy??a.\n\nZapraszamy do towarzyszenia Panu Jezusowi na drodze krzy??owej poprzez nawiedzenie wszystkich stacji i modlitewne rozwa??anie ich tre??ci.',
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
            'Bardzo si?? cieszymy, ??e nas odwiedzasz i zapraszamy do zwiedzania naszego kompleksu klasztornego w Wy??szym Seminarium Duchownym Salwatorian??w w Bagnie.\n\nPrzygotowali??my dla Ciebie przewodnik w postaci niniejszej aplikacji, kt??ry zawiera kilka ciekawych podr????y po naszym klasztornym terenie.\n\nJe??li jeste?? gotowy rozpocz???? z tego miejsca parkingowego, to zapraszamy do gry terenowej dla ca??ej rodziny!',
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
        subtitle: 'B??. Franciszek Jordan',
        description:
            'Nasz za??o??yciel to b??ogos??awiony Franciszek Maria od Krzy??a Jordan. Od Niego zacz????o si?? to wielkie salwatoria??skie dzie??o trwaj??ce ju?? ponad sto lat.\n\nFranciszek Jordan by?? skromnym kap??anem, pochodz??cym z ubogiej rodziny. Na skutek prze??ladowa?? w Niemczech w XIX wieku musia?? uda?? si?? do Rzymu, gdzie studiowa?? j??zyki, do kt??rych mia?? ogromny talent. Tam te?? odkry?? powo??anie do za??o??enia zgromadzenia, kt??re mia??o g??osi?? Jezusa Chrystusa wszystkim, wsz??dzie i wszelkimi mo??liwymi sposobami.\n\nTak powstali Salwatorianie, kt??rzy do dzi?? staraj?? si?? realizowa?? testament swojego duchowego ojca.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 995,
        locationY: 810,
        uid: '08', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_06.png",
        type: MapItemType.philosophy,
        title: 'Altanka filozof??w',
        subtitle: 'Miejsce filozofowania',
        description:
            'Altanka jest starsza od znajduj??cego si?? nieopodal labiryntu filozof??w, ale oba miejsca si?? ze sob?? ????cz??. Tutaj w razie niepogody mo??na si?? schroni?? lub odpocz???? po d??ugim zwiedzaniu. Mo??na tutaj r??wnie?? pofilozofowa??.\n\nInspiracj?? do podj??cia ciekawych dyskusji mog?? by?? tabliczki z cytatami filozof??w znajduj??ce si?? w niedalekim labiryncie.\n\n??yczymy owocnych rozwa??a??.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 570,
        locationY: 780,
        uid: '09', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_07.png",
        type: MapItemType.tree,
        title: 'Buk p??acz??cy',
        subtitle: 'Miejsce odpoczynku',
        description:
            'Ten buk to jedno z najbardziej malowniczych i charakterystycznych drzew w naszym parku. Latem daje upragniony cie??, wiosn?? jest idealnym miejscem na wypoczynek, zim?? ozdabia parkow?? sceneri??, a jesieni?? zrzuca mn??stwo li??ci na alejk?? prowadz??c?? do nowicjatu.\n\nWed??ug legendy system korzeniowy tego drzewa prowadzi a?? do pobliskiego stawu, st??d pobiera odpowiedni?? ilo???? wody do wzrostu.\n\nZach??camy do odpoczynku pod tym wyj??tkowym, starym bukiem.',
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
        subtitle: 'Dla pocz??tkuj??cych',
        description:
            'To w??a??nie w tym ceglanym budynku mie??ci si?? nowicjat salwatorian??w polskiej prowincji. Na co dzie?? ??yj?? tu m??odzi m????czy??ni, kt??rzy przygotowuj?? si?? do na??o??enia habitu i z??o??enia pierwszej profesji zakonnej (??lubu bez??ennej czysto??ci, ub??stwa i pos??usze??stwa) w Towarzystwie Boskiego Zbawiciela (Salwatorianie).\n\nEtap nowicjatu w naszym zakonie trwa ca??y rok (do 8 wrze??nia). Nowicjusze w tym czasie poznaj?? ??ycie zakonne, pog????biaj?? modlitw??, ucz?? si??, a tak??e pracuj?? - najcz????ciej w klasztornym ogrodzie. Opr??cz obowi??zk??w jest te?? miejsce na realizacj?? w??asnych pasji, czytanie ksi????ek oraz budowanie wsp??lnoty. Robimy to poprzez sport, gry, film, spotkania przy kawie lub wsp??lnotowe wypady w g??ry.\n\nW celu lepszego przygotowania si?? do ??ycia zakonnego nowicjusze nie korzystaj?? swobodnie z Internetu, ??medi??w (tv, radio), czy telefon??w kom??rkowych. Nie u??ywaj?? te?? pieni??dzy, ani nie odwiedzaj?? rodzinnego domu. Z najbli??szymi kontaktuj?? si?? poprzez tradycyjne listy, a tak??e w wyznaczone niedziele odbieraj?? od nich telefony. Jest to wi??c rok pr??by, ale tak??e czas wielu Bo??ych ??ask. Ka??dy Salwatorianin ze wzruszeniem wspomina swoje nowicjackie chwile, kiedy to stawa?? u pocz??tku ??ycia zakonnego.\n\nWok???? domu nowicjatu dbamy o cisz?? i prywatno???? ??? zakonn?? klauzur??. Gdy spotkasz, kt??rego?? z braci nowicjuszy, ??mia??o mo??esz porozmawia??. Opr??cz serdecznego u??miechu prosimy by wesprze?? nas modlitw?? o dobre rozeznanie powo??ania.',
        rating: 4.0,
        enabled: true,
      ),
      MapItem(
        locationX: 340,
        locationY: 600,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_09.png",
        type: MapItemType.block,
        title: 'Dom ???ToTu???',
        subtitle: 'Centrum dla m??odzie??y',
        description:
            'Kiedy?? mie??ci?? si?? tutaj klerykat - miejsce, gdzie mieszkali wszyscy przygotowuj??cy si?? do kap??a??stwa. Teraz dom przej??li ksi????a z apostolat??w m??odzie??owych. Dzia??a tutaj Ruch M??odzie??y Salwatoria??skiej i Salwatoria??ski O??rodek Powo??a??, prowadzone s?? rekolekcje dla m??odzie??y, r????ne warsztaty, dni skupienia oraz wiele innych inicjatyw.\n\nDom ???ToTu??? mo??e r??wnie?? s??u??y?? jako baza noclegowa. Oferujemy trzyosobowe pokoje z ??azienkami, kaplic??, sale konferencyjne, oraz jadalni?? w kt??rej istnieje mo??liwo???? zam??wienia posi??k??w.\n\nWarto bli??ej zainteresowa?? si?? ofert?? tego miejsca i poleci?? je innym - zw??aszcza znajomym nastolatkom.\n\nWi??cej informacji o tym domu znajduje si?? na stronie: https://totu.sds.pl.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1130,
        locationY: 990,
        uid: '12', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_10.png",
        type: MapItemType.plant,
        title: 'Ogr??d zakonny',
        subtitle: 'Miejsce pracy',
        description:
            'W naszym ogrodzie od pokole?? uprawiane s?? warzywa i owoce, kt??re p????niej znajduj?? si?? na stole naszej salwatoria??skiej wsp??lnoty.\n\nTo tutaj bracia zakonni we wsp????pracy z siostrami, nowicjuszami i osobami ??wieckimi troszcz?? si?? o zdrow?? i ??wie???? ??ywno????. Uprawiaj?? prawie wszystko - od jab??ek, przez truskawki, a?? po rabarbar.\n\nW tygodniu mo??na tutaj kupi?? warzywa, owoce, lub ozdobny kwiatek do domu jako pami??tk?? odwiedzi?? w Bagnie. Zakupy mo??na zrobi?? poza okresem zimowym w godzinach od 9:00 do 16:00.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1080,
        locationY: 820,
        uid: '13', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_11.png",
        type: MapItemType.labyrinth,
        title: 'Labirynt filozof??w',
        subtitle: 'Miejsce rozmy??la??',
        description:
            'Labirynt, kt??ry tutaj si?? znajduje, kryje w sobie 14 cytat??w s??ynnych my??licieli - filozof??w, ??yj??cych na przestrzeni wielu lat: od Sokratesa po Jana Paw??a II. Ka??dy my??liciel jest opisany w ksi????ce znajduj??cej si?? przy wej??ciu, a tak??e w naszej aplikacji.\n\nWarto zatrzyma?? si?? nad ciekawymi cytatami, porozmy??la?? nad nimi, cho?? trzeba by?? niezwykle ostro??nym - w g??szczu rozwa??a?? filozoficznych niejeden ju?? si?? zgubi??.\n\nZach??camy do wej??cia w g????b naszego labiryntu i zmierzenie si?? z najwa??niejszymi pytaniami ludzko??ci.',
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
        title: 'Ko??ci???? parafialny',
        subtitle: 'pw. Wniebowzi??cia NMP',
        description:
            'Pierwsza wzmianka o ko??ciele w Bagnie pochodzi z 1353 roku. Wiadomo, ??e w roku 1598 ko??ci???? sta?? si?? na moment lutera??ski, by w 1654 roku sta?? si?? na nowo ko??cio??em katolickim. W 1759 roku ko??ci???? spali?? si?? i na jego miejsce wzniesiono nowy. Jednak na pocz??tku XX wieku stan techniczny ko??cio??a by?? bardzo z??y, wi??c postawiono w latach 1906-1907 nowy ko??ci????, kt??ry s??u??y do dzi??.\n\nObecnie pos??uguj?? tutaj ksi????a Salwatorianie, a obok ko??cio??a znajduje si?? salwatoria??ski grobowiec.\n\nWi??cej informacji o parafii, jej historii, oraz godzinach mszy ??wi??tych i nabo??e??stw mo??na znale???? na stronie: http://www.bagno.sds.pl.',
        rating: 4.0,
        enabled: true,
      ),
    ],
  );
}
