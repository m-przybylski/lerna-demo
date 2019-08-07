const merge = require('webpack-merge');
const webpackConfig = require('./webpack.config');

module.exports = merge(webpackConfig, {
  mode: 'development',
  devtool: 'inline-source-map',
  devServer: {
    port: 3005,
    historyApiFallback: true,
    proxy: {
      '/api': 'http://localhost:8085',
    },
  },
});
