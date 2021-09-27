const cssnano = require('cssnano');

let environment = {
  syntax: "postcss-scss",
  parser: "postcss-scss",
  plugins: [
    require('postcss-import'),
    require('tailwindcss/nesting')(require('postcss-nesting')),
    require('tailwindcss')('./tailwind.config.js'),
    require('autoprefixer'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    }),
    // https://www.npmjs.com/package/cssnano-preset-default
    cssnano({
      "preset": [
        "default",
        { "discardComments": { "removeAll": true }}
      ]
    })
  ]
};

// Add everything below!
if (process.env.RAILS_ENV === 'production'){
  environment.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/**/*.js.erb',
        './app/**/*.html.{erb,slim}',
        './app/helpers/**/*.rb',
        './app/components/**/*.rb',
        './app/components/**/*.html.{erb,slim}',
        './app/javascript/**/*.{js,ts,vue,jsx,scss}',
        './config/initializers/simple_form_tailwind.rb'
      ],
      defaultExtractor: (content) => content.match(/[A-Za-z0-9-_:/]+/g) || [],
    })
  )
}
module.exports = environment;
