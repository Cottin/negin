require('dotenv').config()

const path = require('path')
const merge = require('webpack-merge')
const common = require('./webpack.common.js')

module.exports = merge(common, {
	mode: 'development',
	devtool: 'inline-source-map',
	devServer: {
		host: '0.0.0.0',
		port: process.env.PORT,

		// https://github.com/webpack/webpack-dev-server/tree/master/examples/general/proxy-simple
		proxy: {
			'/public': process.env.SERVER,
		},

		historyApiFallback: true,
		// respond to 404s with index.html

		hot: true,
		// enable HMR on the server
	},
	resolve: {
		extensions: ['.js', '.coffee'],
		alias: {
			'react-dom': '@hot-loader/react-dom',
			// Couldn't get peerDependecy and alias to work together, this workaround seems to work
			// https://medium.com/@penx/managing-dependencies-in-a-node-package-so-that-they-are-compatible-with-npm-link-61befa5aaca7
			react: path.resolve(__dirname, './node_modules/react'),
			'negin': path.resolve(__dirname, '../src'),
			'icons': path.resolve(__dirname, '../../icons'),
			'ramda-extras': path.resolve(__dirname, '../../ramda-extras/src/ramda-extras'),
			shortstyle: path.resolve(__dirname, '../../shortstyle/src/shortstyle'),
			'react-functional-router': path.resolve(__dirname, '../../react-functional-router/src/index'),
		},
	},
})
