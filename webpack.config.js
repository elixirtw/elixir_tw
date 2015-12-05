var webpack = require('webpack')
var path = require('path')
var ExtractTextPlugin = require('extract-text-webpack-plugin')
var CopyWebpackPlugin = require('copy-webpack-plugin')

var env = process.env.MIX_ENV || 'dev'
var prod = (env === 'prod')

var entry = "./web/static/js/app.js"
var plugins = [
  new ExtractTextPlugin('app.css'),
  new CopyWebpackPlugin([
    { from: "./web/static/assets" },
    { from: './deps/phoenix_html/web/static/js/phoenix_html.js',
      to: 'js/phoenix_html.js'}
  ])
]

var stylePathResolves = (
  'includePaths[]=' + path.resolve('./') + '&' +
    'includePaths[]=' + path.resolve('./node_modules')
);

if(prod) {
  plugins.push(new webpack.optimize.UglifyJsPlugin({minimize: true}))
}

var loaders = ['babel-loader']

module.exports = {
  entry: entry,

  devtool: prod ? null : 'eval-sourcemaps',

  output: {
    path: path.join(__dirname, './priv/static/js'),
    filename: 'bundle.js',
  },

  resolve: {
    root: path.resolve(__dirname),
    alias: {
      phoenix: 'deps/phoenix/web/static/js/phoenix'
    },
    extensions: ['', '.js', '.jsx']
  },

  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        loader: loaders,
        query: {
          presets: ['es2015']
        }
      },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract(
          'style',
          'css' + '!sass?outputStyle=expanded&' + stylePathResolves
        )
      }
    ]
  },

  plugins: plugins
}
