require('dotenv').config()

const path = require('path')
const webpack = require('webpack')
const {CleanWebpackPlugin} = require('clean-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports = {
	entry: ['./src/index'],
	plugins: [
		new CleanWebpackPlugin(),
		new HtmlWebpackPlugin({
		  title: 'Timeadore',
		  // Load a custom template (lodash by default see the FAQ for details)
		  template: 'index.html',
		  hash: true,
		}),
		new webpack.NamedModulesPlugin(),
		new webpack.DefinePlugin({
			CONFIG_POPSIQL_API_URL: JSON.stringify('/popsiql?normalize=true'),
			CONFIG_REST_API_URL: JSON.stringify('/api'),
			CONFIG_PUBLIC_URL: JSON.stringify('/public'),
			CONFIG_DEMO_PASS: JSON.stringify(process.env.CONFIG_DEMO_PASS),
			CONFIG_TARGET_ENV: JSON.stringify(process.env.CONFIG_TARGET_ENV),
		}),
	],
	output: {
		filename: '[name].bundle.js',
		path: path.join(__dirname, 'dist'),
	},
	module: {
		rules: [
			{
				exclude: /node_modules|packages/,
				test: /\.js$/,
				use: 'babel-loader',
			},
			// {
			//   test: /\.coffee?$/,
			//   loaders: ['babel-loader', 'coffee-loader'],
			//   include: [
			//     path.join(__dirname, 'src')
			//   ]
			// },
			{
				exclude: /node_modules|packages/,
				test: /\.coffee$/,
				use: ['coffee-loader']
			},
			{
				exclude: /node_modules|packages/,
				test: /\.svg$/,
				use: 'svg-react-loader'
			},
		],
	},
	resolve: {
		extensions: ['.js', '.coffee']
	},
}
