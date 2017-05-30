var jsdom = require("jsdom/lib/old-api.js");
var list = require("./url.js");
var fs = require("fs");
var jconv = require('jconv');

var arr = [];
var arrjis;
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
          arr.push($(".innerWrap p").text()
          .replace(/1\)/g,'<br>1)').replace(/2\)/g,'<br>2)').replace(/3\)/g,'<br>3)').replace(/4\)/g,'<br>4)').replace(/5\)/g,'<br>5)').replace(/6\)/g,'<br>6)')
          .replace(/1）/g,'<br>1)').replace(/2）/g,'<br>2)').replace(/3）/g,'<br>3)').replace(/4）/g,'<br>4)').replace(/5）/g,'<br>5)').replace(/6）/g,'<br>6)')
          .replace(/１\)/g,'<br>1)').replace(/２\)/g,'<br>2)').replace(/３\)/g,'<br>3)').replace(/４\)/g,'<br>4)').replace(/５\)/g,'<br>5)').replace(/６\)/g,'<br>6)')
          .replace(/１）/g,'<br>1)').replace(/２）/g,'<br>2)').replace(/３）/g,'<br>3)').replace(/４）/g,'<br>4)').replace(/５）/g,'<br>5)').replace(/６）/g,'<br>6)')
          .replace(/①/g,'<br>1)').replace(/②/g,'<br>2)').replace(/③/g,'<br>3)').replace(/④/g,'<br>4)').replace(/⑤/g,'<br>5)').replace(/⑥/g,'<br>6)')
          .replace(/\,/g, '.')
          );
          // arr.map(function(text){
          //   arrjis = jconv.convert( text, 'UTF8' ,'SJIS');
          // })
          var textjis = arr.join(',') + '\r\n';
          fs.appendFile('branch.txt', textjis )
          arr = [];
        }
      })
    }
  })
}

crawl().then(function(){
    
})
