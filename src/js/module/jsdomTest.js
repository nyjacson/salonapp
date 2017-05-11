var jsdom = require("jsdom");
var { JSDOM } = jsdom;

JSDOM.fromURL('https://ginza-calla.jp/salon/omiya/').then( dom => {
  console.log( dom.window.document.querySelector("h1").textContent)
}
).then( dom => {
    console.log( dom.window.document.querySelector("h1").textContent)
  }
)
