var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");
var fs = require("fs");
var jconv = require('jconv');

var arr = [];
var crawl = function(){
  console.log('start')

    for (var i=0; i<list.length; i++) {
      jsdom.env({
        url: list[i],
        scripts: ['http://code.jquery.com/jquery.js'],
        done: function(err, window) {
          if(err) {
            console.log(err);
            return;
          }
          var $ = window.$;
          
          arr.push($("h1").text());
          arr.push($(".page-body > p").text().replace(/\r?\n/g,'<br>'));
          $(".shop-info-data dd").each(function(){
            arr.push($(this).text().replace(/\r?\n/g,'<br>'));
          });
          arr.push($(".shop-map-blln p").text().replace(/\r?\n/g,'<br>'));
          var textjis = arr.join(',') + '\r\n';
          fs.appendFile('branch.txt', textjis )
          arr = [];
        }
      })
    }
}
crawl()
