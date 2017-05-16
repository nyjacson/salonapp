var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");
var fs = require("fs");

var arr = [];
for (var i=0; i<list.length; i++){
  jsdom.env({
    url: list[i],
    scripts: ['http://code.jquery.com/jquery.js'],
    done: function(err, window) {
      var $ = window.$;
      arr.push($("h2").text());
      $(".infoBox dd").each(function(){
        arr.push($(this).text());
      })
      arr.push($(".innerWrap p").text());
      console.log(arr.join(','));
      arr = [];
    }
  })
}

// fs.writeFile('branch2.csv', data)

