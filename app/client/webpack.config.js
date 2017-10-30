const webpack = require('webpack');
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const nodeEnv = process.env.NODE_ENV;

var PUBLIC_DEV_SERVER = "http://localhost:4000/";
var ENTRY = [
    "webpack-hot-middleware/client?path=" + PUBLIC_DEV_SERVER + "__webpack_hmr",
    './src/index.js'
  ];

var rootURL = 'http://localhost:3000';
if (nodeEnv == 'staging') {
  rootURL = 'http://ishipper.framgia.vn';
  PUBLIC_DEV_SERVER = '/';
  ENTRY = ['./src/index.js'];
} else if (nodeEnv == 'production') {
  rootURL = 'http://education.framgia.vn';
  PUBLIC_DEV_SERVER = '/';
  ENTRY = ['./src/index.js'];
}

const config = {
  entry: ENTRY,

  output: {
    filename: 'webpack-bundle.js',
    path: path.join(__dirname, '../', 'assets', 'javascripts'),
    publicPath: PUBLIC_DEV_SERVER
  },

  resolve: {
    extensions: ['*', '.js', '.jsx'],
    alias: {
      libs: path.join(process.cwd(), 'libs'),
      config: path.resolve(__dirname, 'src/config'),
      constants: path.resolve(__dirname, 'src/config/constants'),
      containers: path.resolve(__dirname, 'src/containers'),
      icons: path.resolve(__dirname, 'src/config/icons'),
      bread_crumb: path.resolve(__dirname, 'libs/bread_crumb'),
      flash_message: path.resolve(__dirname, 'libs/flash_messages'),
      loading_box: path.resolve(__dirname, 'libs/loading_box'),
      react_table: path.resolve(__dirname, 'libs/react-table/utils'),
      errors: path.resolve(__dirname, 'libs/errors'),
      color: path.resolve(__dirname, './src/config/assets/color.scss'),
      color_status: path.resolve(__dirname, './src/config/assets/color-status.scss'),
      custom_pagination: path.resolve(__dirname, 'libs/custom_pagination')
    }
  },
  plugins: [
    new webpack.DefinePlugin({
      'process.env': {
        NODE_ENV: JSON.stringify(nodeEnv),
        ROOT_URL: JSON.stringify(rootURL),
      },
    }),
    new HtmlWebpackPlugin({
      title: 'Hot Module Replacement'
    }),
    new webpack.HotModuleReplacementPlugin(),
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      React: 'react',
      PropTypes: 'prop-types',
      axios: 'axios'
    }),
  ],
  module: {
    loaders: [
      {
        test: require.resolve('react'),
        loader: 'imports-loader?shim=es5-shim/es5-shim&sham=es5-shim/es5-sham',
      },
      {
        test: /\.jsx?$/,
        loader: ['react-hot-loader', 'babel-loader'],
        exclude: /node_modules/,
      },
      {
        test: /\.scss$/,
        loader: 'style-loader!css-loader!sass-loader'
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader', 'sass-loader']
      },
      {
        test: /\.(jpe|jpg|png|woff|woff2|eot|ttf|svg)(\?.*$|$)/,
        loader: 'url-loader?limit=100000'
      }
    ],
  },
};

module.exports = config;

if (nodeEnv == 'staging') {
  module.exports.devtool = 'inline-source-map';
  console.log('Webpack staging build for Rails'); // eslint-disable-line no-console
  console.log('Root url:' + rootURL);
} else if (nodeEnv == 'production') {
  config.plugins.push(
    new webpack.optimize.UglifyJsPlugin()
  );
  console.log('Webpack production build for Rails'); // eslint-disable-line no-console
  console.log('Root url:' + rootURL);
} else {
  module.exports.devtool = 'inline-source-map';
  console.log('Webpack dev build for Rails');
  console.log('Root url:' + rootURL);
}
