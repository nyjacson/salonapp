var jsdom = require("jsdom/lib/old-api.js");

jsdom.env({
  url: 'https://ginza-calla.jp/salon/omiya/',
  scripts: ['http://code.jquery.com/jquery.js'],
  done: function(err, window) {
    var $ = window.$;
    console.log($("h1").text());
    console.log($(".page-body > p").text());
    $(".shop-info-data dd").each(function(){
      console.log($(this).text());
    })
    console.log($(".shop-map-blln p").text());
  }
})
