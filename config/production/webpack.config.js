const path = require('path');
const glob = require("glob");

module.exports = {
  entry: {
    styles: glob.sync('./src/javascripts/**/*.js'),
  },
  output: {
    path: path.join(__dirname, "../../app/assets/javascripts"),
    filename: '[name]-[hash].js'
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader?presets[]=react,presets[]=es2015,presets[]=stage-2'
      }
    ]
  }
}