const { environment } = require('@rails/webpacker')

module.exports = environment

// bootstrapを導入のため下記を記入。

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
