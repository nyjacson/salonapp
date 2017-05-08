
var casper = require('casper').create();
var links;

// Opens casperjs homepage
casper.start('https://ginza-calla.jp/salon/omiya/', function(){
    this.echo(this.fetchText('dd'));
}).run();
