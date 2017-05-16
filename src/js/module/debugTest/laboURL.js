var jsdom = require("jsdom/lib/old-api.js");
var url = require('./areaurl.js');

console.log("module.exports = [")

var listtext = function(){
  return new Promise(function(resolve, reject){
    setTimeout(resolve, 3000);
    for (var i=0; i<url.length; i++){
      jsdom.env({
        url: url[i],
        scripts: ['http://code.jquery.com/jquery.js'],
        done: function(err, window) {
          var $ = window.$;
          $("#mainContents section dt a").each(function(){
            console.log("'"+$(this).attr("href")+"',");
          })
        }
      })
    }
  })
}
listtext().then(function(){
  console.log("]");
})

