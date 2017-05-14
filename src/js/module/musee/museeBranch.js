var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");

for (var i=0; i<list.length; i++){
  jsdom.env({
    url: list[i],
    scripts: ['http://code.jquery.com/jquery.js'],
    done: function(err, window) {
      var $ = window.$;
      console.log($("h1").text());
      console.log($(".salon_comment").text());
      $(".list-area li dd").each(function(){
        console.log($(this).text());
      })
      console.log("===========");
    }
  })
}
