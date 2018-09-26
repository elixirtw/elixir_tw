const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const autoprefixer = require('autoprefixer');
const webpack = require('webpack');

module.exports = {
  context: __dirname,

  entry: {
    app: [
      "./js/app.js",
      "./scss/app.scss"
    ]
  },

  output: {
    path: path.resolve(__dirname, "../priv/static"),
    filename: 'js/[name].js',
    publicPath: 'http://localhost:4000/'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: ['@babel/preset-env'],
        },
      },
      {
        test: /\.(scss|css)$/,
        use: ExtractTextPlugin.extract({
          fallback: "sass-loader",
          use: ['css-loader', 'postcss-loader', 'sass-loader']
        })
      },
      {
        test: /\.woff(2)?(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader",
        query: {
          name: "fonts/[hash].[ext]",
          mimetype: "application/font-woff"
        }
      },
      {
        test: /\.(eot|svg|ttf)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: "file-loader",
        query: {
          name: "fonts/[hash].[ext]"
        }
      },
      {
        test: /\.(svg|jpg|png|gif)$/,
        loader: 'file-loader',
        options: {
          name: '[name].[ext]?[hash]'
        }
      }
    ]
  },

  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery'
    }),

    new CopyWebpackPlugin([{
      from: "./static",
      to: path.resolve(__dirname, "../priv/static")
    }]),

    new ExtractTextPlugin({
      filename: "css/[name].css",
      allChunks: true
    })
  ]

};

