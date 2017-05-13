var jsdom = require("jsdom/lib/old-api.js");
var url = require('./areaurl.js');

console.log("module.exports = [")

var listtext = function(){
  return new Promise(function(resolve, reject){
    setTimeout(resolve, 5000);
    for (var i=0; i<url.length; i++){
      jsdom.env({
        url: url[i],
        scripts: ['http://code.jquery.com/jquery.js'],
        done: function(err, window) {
          var $ = window.$;
          $(".list-area li dt a").each(function(){
            console.log("'http://musee-pla.com"+$(this).attr("href")+"',");
          })
        }
      })
    }
  })
}
listtext().then(function(){
  console.log("]");
})

