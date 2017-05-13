var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");

  for (var i=0; i<list.length; i++){
    jsdom.env({
    url: list[i],
    scripts: ['http://code.jquery.com/jquery.js'],
    done: function(err, window) {
      var $ = window.$;
      console.log($("h1").text());
      console.log($(".page-body > p").text());
      $(".shop-info-data dd").each(function(){
        console.log($(this).text());
      })
      console.log($(".shop-map-blln p").text());
      console.log("===========");
    }
  })
  }

