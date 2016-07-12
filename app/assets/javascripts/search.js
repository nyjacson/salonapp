jQuery(function($) {
    function topImage(){
        var all = $("#ele-map-all")
        var kanto = $("#kanto")
        var hokkaido = $("#hokkaido")
        var tohoku = $("#tohoku")
        var chubu = $("#chubu")
        var chugoku = $("#chugoku")
        var kansai = $("#kansai")
        var kyushu = $("#kyushu")
        var shikoku = $("#shikoku")
        var tokyo = $("#tokyo")
        var back = $(".backTop")

        var allArea = $(".ele-areanameWrapper")
        var kantoArea = $("#ele-map-kanto")
        var tokyoArea = $("#ele-map-tokyo")

        back.on('click', function(){
            allArea.hide();
            all.show();
        });
        kanto.on('click', function(){
            all.hide();
            kantoArea.show();
        });
        tokyo.on('click', function(){
            kantoArea.hide();
            tokyoArea.show();
        });

    }
    topImage();




    $("#gmap3_1").gmap3({  // 地図の表示 ... （3）
          latitude: 35.6988,
          longitude: 139.7747,
          zoom: 8,
          navigationControl: true,
          mapTypeControl: true,
          scaleControl: true
      });

});
