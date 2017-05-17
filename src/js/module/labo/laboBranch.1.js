var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");
var fs = require("fs");

var arr = [];
var crawl = function(){
  return new Promise(function(resolve,rejet){
    setTimeout(resolve, 5000);
    for (var i=0; i<list.length; i++){
      jsdom.env({
        url: list[i],
        scripts: ['http://code.jquery.com/jquery.js'],
        done: function(err, window) {
          var $ = window.$;
          arr.push($("h2").text());
          arr.push($(".infoBox dl:nth-child(1) dd").text());
          arr.push($(".infoBox dl:nth-child(3) dd").text());
          arr.push($(".infoBox dl:nth-child(4) dd").text());
          arr.push($(".infoBox dl:nth-child(7) dd").text());
          arr.push($(".innerWrap p").text());
          console.log(arr.join(','));
          arr = [];
        }
      })
    }
  })
}

// crawl().then(function(){
//   return setTimeout(resolve, 1000);
//   var result = Array.join("からの");
// })
crawl().then(function(){
    
})
