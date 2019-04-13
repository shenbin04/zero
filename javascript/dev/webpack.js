const path = require('path')
const webpack = require('webpack')
const merge = require('webpack-merge')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin

const dev = process.argv.indexOf('--dev') > -1
const debug = process.argv.indexOf('--debug') > -1

const getWebpackConfig = ({root}) => {
  let config = {
    entry: {
      app: './src/index.js',
    },
    module: {
      rules: [
        {
          test: /\.js$/,
          exclude: /node_modules/,
          use: {
            loader: 'babel-loader',
          },
        },
      ],
    },
    plugins: [
      new CleanWebpackPlugin(),
      new HtmlWebpackPlugin({
        template: './src/index.html',
      }),
    ],
    output: {
      filename: '[name].bundle.js',
      path: path.resolve(root, 'dist'),
    },
  }

  if (dev) {
    config = merge(config, {
      mode: 'development',
      devtool: 'cheap-module-eval-source-map',
      devServer: {
        contentBase: './dist',
        hot: true,
      },
      plugins: [new webpack.HotModuleReplacementPlugin()],
    })
  } else {
    config = merge(config, {
      mode: 'production',
    })
  }

  if (debug) {
    config = merge(config, {
      plugins: [new BundleAnalyzerPlugin()],
    })
  }

  return config
}

module.exports = {
  getWebpackConfig,
}
