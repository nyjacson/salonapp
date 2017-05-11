
var casper = require('casper').create({
    logLevel: 'debug'
});
var URL = ['https://ginza-calla.jp/salon/omiya/'];

casper.start();
casper.open(URL[0]);
casper.then(function(){
    var desc = this.evaluate(function(){
        return document.querySelector('.page-head').innerText;
    });
    console.log(desc);
});
casper.then(function(){
    var list =  document.querySelectorAll('.shop-info dd');
    for (var i=0; i<list.length; i++) {
        console.log(list[i].innerText)
    }
    return false
})
casper.run();
