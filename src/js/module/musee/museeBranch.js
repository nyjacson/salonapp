var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");
var arr = [];
var crawl = function(){
  for (var i=0; i<list.length; i++){
    jsdom.env({
      url: list[i],
      scripts: ['http://code.jquery.com/jquery.js'],
      done: function(err, window) {
        var $ = window.$;
        arr.push($("h1").text());
        arr.push($(".list-area:nth-child(0) dd").text());
        $(".list-area li dd").each(function(){
          arr.push($(this).text());
        });
        console.log(arr.join(','));
        arr = [];
      }
    })
  }
}

crawl();


