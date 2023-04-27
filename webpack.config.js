var webpack = require("webpack");
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const CopyPlugin = require("copy-webpack-plugin");
const outputDir = path.join(__dirname, "build/");
const FaviconsWebpackPlugin = require("favicons-webpack-plugin");
const isProd = process.env.NODE_ENV === "production";

var catala = {
  entry: "./src/Index.bs.js",
  mode: isProd ? "production" : "development",
  resolve: {
    alias: {
      fs: "browserfs/dist/shims/fs.js",
      buffer: "browserfs/dist/shims/buffer.js",
      path: "browserfs/dist/shims/path.js",
      processGlobal: "browserfs/dist/shims/process.js",
      bufferGlobal: "browserfs/dist/shims/bufferGlobal.js",
      bfsGlobal: require.resolve("browserfs"),
      child_process: "browser-builtins/builtin/child_process.js",
    },
    fallback: {
      constants: require.resolve("constants-browserify"),
      tty: false,
    },
  },
  devtool: "source-map",
  output: {
    path: outputDir,
    filename: "Index.js",
    publicPath: "/",
  },
  plugins: [
    new HtmlWebpackPlugin({
      filename: "index.html",
      template: "src/index.html",
    }),
    new FaviconsWebpackPlugin({
      logo: "./assets/logo.png",
      mode: "webapp", // optional can be 'webapp' or 'light' - 'webapp' by default
      devMode: "webapp", // optional can be 'webapp' or 'light' - 'light' by default
      inject: true,
      favicons: {
        appName: "Catala",
        icons: {
          coast: false,
          yandex: false,
        },
      },
    }),
    new CopyPlugin({
      patterns: [{ from: "./assets/ocaml_docs", to: "ocaml_docs" }],
    }),
    // Expose BrowserFS, process, and Buffer globals.
    // NOTE: If you intend to use BrowserFS in a script tag, you do not need
    // to expose a BrowserFS global.
    new webpack.ProvidePlugin({
      BrowserFS: "bfsGlobal",
      process: "processGlobal",
      Buffer: "bufferGlobal",
    }),
  ],
  devServer: {
    compress: true,
    static: outputDir,
    port: process.env.PORT || 8000,
    historyApiFallback: true,
  },
  module: {
    noParse: /browserfs\.js/,
    rules: [
      {
        test: /\.schema.jsx$/,
        exclude: /(node_modules|bower_components)/,
        use: {
          loader: "babel-loader",
          options: {
            presets: [
              "@babel/preset-env",
              ["@babel/preset-react", { runtime: "automatic" }],
            ],
          },
        },
      },
      {
        test: /\.css$/,
        use: ["style-loader", "css-loader"],
      },
      {
        test: /\.html$/,
        loader: "html-loader",
        options: {
          esModule: false,
        },
      },
      {
        test: /\.catala_en/,
        use: ["raw-loader"],
      },
      {
        test: /\.catala_fr/,
        use: ["raw-loader"],
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        use: ["file-loader?name=assets/[name].[ext]"],
      },
    ],
  },
};

module.exports = catala;
