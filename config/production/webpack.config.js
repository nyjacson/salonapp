const webpack = require('webpack')
const path = require('path')
const glob = require("glob");
const ManifestPlugin = require('webpack-manifest-plugin');

module.exports = {
  entry: {
    main: glob.sync('./src/js/**/*.js'),
  },
  output: {
    path: path.join(__dirname, "../../public/js"),
    filename: '[name]-[hash].js'
  },
  plugins: [
    new webpack.optimize.UglifyJsPlugin({
      minimize: true,
      compress: {
        warnings: false,
      },
    }),
    new ManifestPlugin()
  ],
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