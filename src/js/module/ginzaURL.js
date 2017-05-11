var jsdom = require("jsdom/lib/old-api.js");

jsdom.env({
  url: 'https://ginza-calla.jp/salon/',
  scripts: ['http://code.jquery.com/jquery.js'],
  done: function(err, window) {
    var $ = window.$;
    $("h3 a").each(function(){
      console.log($(this).attr("href"));
    })
  }
})
