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
  house,
  info,
  labyrinth,
  monument,
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
        return LineIcons.cross;
      case MapItemType.house:
        return LineIcons.home;
      case MapItemType.info:
        return LineIcons.info;
      case MapItemType.labyrinth:
        return LineIcons.mapSigns;
      case MapItemType.monument:
        return LineIcons.monument;
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
        return Icons.location_on;
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
            'Właściwie nie jest to zamek, a pałac, ale w nomenklaturze salwatoriańskiej przyjęło się ten piękny budynek nazywać zamkiem. Pałac pochodzi z XVIII wieku i obecnie znajduje się w nim Wyższe Seminarium Salwatorianów w Bagnie oraz klasztor. To w tym budynku mieszkają i studiują klerycy, przygotowując się do przyjęcia święceń kapłańskich. Warto poznać historię tego budynku i zwiedzić jego wnętrze. Zapraszamy w każdą niedzielę o godzinie 14:00, 15:00 i 16:00. Wystarczy wejść do środka i zapytać furtiana o możliwość oprowadzenia, a on na pewno udzieli szczegółowych informacji.',
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
            'Drewniana kapliczka zbudowana przez kleryków, przyjęła nazwę diaspora, co oznacza z greckiego grupę etniczną lub religijną żyjącą w odosobnieniu. Nie wiadomo do końca skąd wzięła się nazwa, ale według niektórych koncepcji kiedyś katolicy żyjący w tej miejscowości byli w mniejszości ze względu na dużą ilość protestantów. Co ciekawe od niedawna w tejże diasporze nowicjusze odprawiają roraty z samego rana. Warto wejść do środka naszej diaspory, przyklęknąć na chwilę i pomodlić się. Gdyby jednak nie przychodziła do głowy żadna intencja to po lewej stronie od wejścia znajdują się chlebki z wygrawerowanymi na nich numerkami - można wylosować sobie numerek i na przygotowanej tablicy sprawdzić sobie za kogo można się w tej diasporze pomodlić.',
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
            'Na tym miejscu znajduje się popiersie dwóch ważnych osób dla zgromadzenia salwatorianów: bł. Franciszka Jordana - naszego założyciela oraz ks. Bonawentury Lüthena - jego najbliższego współpracownika i przyjaciela. Znajdują się tu także łacińskie nazwy ślubów, które składają zakonnicy na całym świecie, a więc ślub czystości (castitas), ubóstwa (paupertas) i posłuszeństwa (oboedientia). To tych trzech ślubów Salwatorianie dodają także zaangażowanie w konkretny apostolat. Apostolstwo jest dla nas czymś niesłychanie ważnym - głoszenie Ewangelii wszystkimi możliwymi sposobami.',
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
            'Grota Matki Bożej powstała na wzór groty z Lourdes. Jest to wyjątkowe miejsce dla wszystkich salwatorianów, ponieważ z całego serca czcimy, podobnie jak nasz założyciel, Najświętszą Marię Pannę. Tutaj odprawiane są nabożeństwa majowe, podczas których śpiewana jest litania loretańska, a potem jeden z kleryków wygłasza egzortę z ambony, która znajduje się po lewej stronie, patrząc na Maryję. Tutaj także modlą się wszyscy członkowie bagiennej wspólnoty w ciągu roku na różańcu, lub w inny sposób, pozdrawiając Maryję. Warto zaczekać do zachodu słońca, kiedy to grota Matki Bożej jest podświetlona - wygląda wtedy niezwykle malowniczo.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 990,
        locationY: 750,
        uid: '05', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_05.png",
        type: MapItemType.monument,
        title: 'Pomnik',
        subtitle: 'Bł. Franciszek Jordan',
        description:
            'Nasz założyciel to błogosławiony Franciszek Maria od Krzyża Jordan. Od niego zaczęło się to wielkie salwatoriańskie dzieło trwające już ponad sto lat. Był to skromny kapłan, pochodzący z ubogiej rodziny, który na skutek prześladowań w Niemczech musiał się udać do Rzymu, gdzie uczył się języków, do których miał ogromny talent. Tam też zrodził się pomysł założenia zgromadzenia, które miałoby głosić Jezusa Chrystusa wszystkim, wszędzie i wszystkimi możliwymi sposobami. Tak powstali salwatorianie, którzy do teraz starają się realizować testament swojego duchowego ojca.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 995,
        locationY: 810,
        uid: '06', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_06.png",
        type: MapItemType.philosophy,
        title: 'Altanka filozofów',
        subtitle: 'Miejsce filozofowania',
        description:
            'Altanka jest starsza od znajdującego się blisko labiryntu filozofów, ale oba miejsca się ze sobą łączą. Tutaj w razie niepogody można się schronić lub dać odpocząć nogom po zbyt długim zwiedzaniu. Oczywiście jak sama nazwa wskazuje można tutaj także pofilozofować. Inspiracją do podjęcia dyskusji mogą być tabliczki z cytatami filozofów znajdujące się w labiryncie nieopodal. Albo po prostu można tutaj posiedzieć samemu i podumać nad sensem życia...',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 570,
        locationY: 780,
        uid: '07', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_07.png",
        type: MapItemType.tree,
        title: 'Buk płaczący',
        subtitle: 'Miejsce piknikowe',
        description:
            'Ten buk to jedno z najbardziej malowniczych i charakterystycznych drzew w naszym parku. Latem daje upragniony cień, wiosną jest idealnym miejscem na piknik, zimą ozdabia parkową scenerię, jedynie jesienią przeszkadza, zrzucając mnóstwo liści na alejkę prowadzącą do nowicjatu. Według legendy system korzeniowy tego drzewa prowadzi aż do pobliskiego stawu, stąd drzewo ma odpowiednią ilość wody do wzrostu. Zachęcamy do odpoczynku pod naszym dobrym, starym bukiem.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 420,
        locationY: 800,
        uid: '08', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_08.png",
        type: MapItemType.building_small,
        title: 'Nowicjat',
        subtitle: 'Dla początkujących',
        description:
            'To właśnie w tym ceglanym budynku mieści się nowicjat - miejsce, gdzie żyją na co dzień mężczyźni, chcący zostać zakonnikami, salwatorianami. Etap nowicjatu w naszym zakonie trwa cały rok i obejmuje wprowadzenie w życie zakonne, pogłębianie modlitwy, naukę, pracę w naszym klasztornym ogrodzie, ale także budowę wspólnoty - czyli wspólne wypady na piłkę, gry w planszówki, rekreacja przy wspólnej kawie. Aby lepiej przygotować się do życia zakonnego nowicjusze nie korzystają z elektroniki - mogą kontaktować się z rodziną jedynie listownie i telefonicznie w niektóre niedziele. Jest to więc czas próby, ale też i czas wielu Bożych łask. Każdy salwatorianin ze wzruszeniem wspomina swoje nowicjackie chwile, kiedy to stawał u początku nowego życia. Warto pomodlić się za najmłodszych współbraci, rozeznających w tym budynku swoje powołanie.',
        rating: 4.0,
        enabled: true,
      ),
      MapItem(
        locationX: 340,
        locationY: 600,
        uid: '09', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_09.png",
        type: MapItemType.block,
        title: 'Dom "ToTu"',
        subtitle: 'Centrum dla młodzieży',
        description:
            'Kiedyś mieścił się tutaj klerykat - miejsce, gdzie mieszkali wszyscy przygotowujący się do kapłaństwa. Teraz jednak ze względu na małą liczbę powołań dom przejęli księża z apostolatów młodzieżowych - działa tutaj Ruch Młodzieży Salwatoriańskiej i Salwatoriański Ośrodek Powołań, prowadzone są rekolekcje dla młodzieży, różne warsztaty, dni skupienia i wiele, wiele innych. Warto tam kiedyś zajrzeć lub polecić to miejsce innym - zwłaszcza znajomym nastolatkom. Więcej informacji o tym domu znajduje się na stronie: https://totu.sds.pl.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1130,
        locationY: 990,
        uid: '10', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_10.png",
        type: MapItemType.plant,
        title: 'Ogród zakonny',
        subtitle: 'Miejsce pracy',
        description:
            'To miejsce, gdzie uprawiane są wszystkie warzywa i owoce, które później znajdują się na stołach salwatoriańskich księży, braci i kleryków. To tutaj bracia zakonni we współpracy z siostrami, nowicjuszami i osobami świeckimi starają się o zdrowe i świeże warzywa dla całej wspólnoty. Znaleźć tutaj można wszystko - od jabłek, przez truskawki, aż po rabarbar. W tygodniu jest możliwość zakupienia sobie jakiegoś warzywa lub też ozdobnego kwiatka dla siebie do domu - jako pamiątki ze zwiedzania. Zakupy można zrobić poza okresem zimowym w godzinach od 9:00 do 16:00.',
        rating: 4.5,
        enabled: true,
      ),
      MapItem(
        locationX: 1080,
        locationY: 820,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_11.png",
        type: MapItemType.labyrinth,
        title: 'Labirynt filozofów',
        subtitle: 'Miejsce do rozmyślań',
        description:
            'Labirynt, który tutaj się znajduje kryje w sobie 14 cytatów słynnych myślicieli - filozofów, żyjących na przestrzeni wielu lat: od Sokratesa po Jana Pawła II. Każdy myśliciel jest opisany w książce znajdującej się przy wejściu, a także w naszej aplikacji w zakładce pod tytułem: „W labiryncie”. Warto zatrzymać się nad tymi myślami, porozmyślać nad nimi, choć trzeba być niezwykle ostrożnym - w gąszczu rozważań filozoficznych niejeden już się zgubił - stąd też warto zaopatrzyć się w plan naszego labiryntu, aby nie przeoczyć żadnego ciekawego filozofa.',
        rating: 5.0,
        enabled: true,
      ),
      MapItem(
        locationX: 1290,
        locationY: 205,
        uid: '11', // TODO: implement proper UID
        imageAsset: "assets/images/map01/mapItem_12.png",
        type: MapItemType.church,
        title: 'Kościół parafialny',
        subtitle: 'pw. Wniebowzięcia NMP',
        description:
            'Jest to kościół, w którym również posługują księża salwatorianie. Pierwsza wzmianka o kościele w Bagnie pochodzi z 1353 roku. Wiadomo, że w roku 1598 kościół stał się na moment luterański, by w 1654 roku stać się na nowo kościołem katolickim. W 1759 roku kościół spalił się i na jego miejsce wzniesiono nowy. Jednak na początku XX wieku stan techniczny kościoła był bardzo zły, więc postawiono w latach 1906-1907 nowy kościół, który służy do dziś. Obok kościoła znajduje się grobowiec salwatorianów. Więcej informacji o parafii, historii, godzinach mszy świętych znaleźć można na stronie: http://www.bagno.sds.pl.',
        rating: 4.0,
        enabled: true,
      ),
    ],
  );
}
