const path = require('path');
const webpack = require('webpack');
const glob = require("glob");

module.exports = {
  devtool: 'inline-source-map',
  entry: {
    main: glob.sync('./src/javascripts/**/*.js'),
  },
  output: {
    path: path.join(__dirname, "../../public/js"),
    filename: '[name]-[hash].js',
    publicPath: 'http://localhost:3001/',
  },
  module: {
    loaders: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader?presets[]=react,presets[]=es2015,presets[]=stage-2'
      }
    ]
  },
  plugins: [
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin()
  ],
  resolve: {
    extensions: ['*', '.js', '.json']
  },
  devServer: {
    contentBase: '../public/dist',
    hot: true,
    inline: true,
    port: 3001  
  },
}