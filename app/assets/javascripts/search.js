jQuery(function($) {
    var all = $("#ele-map-all")
    var kanto = $("#ele-map-all #kanto")
    var hokkaido = $("#ele-map-all #hokkaido")
    var tohoku = $("#ele-map-all #tohoku")
    var chubu = $("#ele-map-all #chubu")
    var chugoku = $("#ele-map-all #chugoku")
    var kansai = $("#ele-map-all #kansai")
    var kyushu = $("#ele-map-all #kyushu")
    var shikoku = $("#ele-map-all #shikoku")
    var tokyo = $("#ele-map-kanto #tokyo")

    var kantoArea = $("#ele-map-kanto")
    var tokyo = $("#tokyo")
    var tokyoArea = $("#ele-map-tokyo")
    kanto.on('click', function(){
        all.fadeOut();
        kantoArea.fadeIn();

    });
    tokyo.on('click', function(){
        kantoArea.fadeOut();
        tokyoArea.fadeIn();

    });

    $("#gmap3_1").gmap3({  // 地図の表示 ... （3）
          latitude: 35.6988,
          longitude: 139.7747,
          zoom: 8,
          navigationControl: true,
          mapTypeControl: true,
          scaleControl: true
      });

});
