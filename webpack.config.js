const path = require("path")
const HtmlWebpackPlugin = require("html-webpack-plugin")
const CopyPlugin = require('copy-webpack-plugin')
const outputDir = path.join(__dirname, "build/")
const FaviconsWebpackPlugin = require('favicons-webpack-plugin')
const isProd = process.env.NODE_ENV === "production"

var catala = {
  entry: "./src/Index.bs.js",
  mode: isProd ? "production" : "development",
  devtool: "source-map",
  output: {
    path: outputDir,
    filename: "Index.js",
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "src/index.html",
      inject: true
    }),
    new FaviconsWebpackPlugin({
      logo: './assets/logo.png',
      mode: 'webapp', // optional can be 'webapp' or 'light' - 'webapp' by default
      devMode: 'webapp', // optional can be 'webapp' or 'light' - 'light' by default
      inject: true,
      favicons: {
        appName: 'Catala',
        icons: {
          coast: false,
          yandex: false
        }
      }
    }),
    new CopyPlugin({
      patterns: [
        { from: './assets/ocaml_docs', to: 'ocaml_docs' },
      ],
    }),
  ],
  devServer: {
    compress: true,
    contentBase: outputDir,
    port: process.env.PORT || 8000,
    historyApiFallback: true
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"]
      },
      {
        test: /\.html$/,
        use: ["html-loader"]
      },
      {
        test: /\.catala_en/,
        use: ["raw-loader"]
      },
      {
        test: /\.catala_fr/,
        use: ["raw-loader"]
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: [
          "file-loader?name=assets/[name].[ext]"
        ],
      },
    ]
  }
}

module.exports = catala;
