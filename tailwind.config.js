module.exports = {
  mode: 'jit',
  purge: {
    enabled: true,
    content: [
      './app/**/*.js.erb',
      './app/helpers/**/*.rb',
      './app/components/**/*.rb',
      './app/components/**/*.html.{erb,slim}',
      './app/views/**/*.html.{erb,slim}',
      './app/javascript/**/*.{js,ts,vue,jsx,scss}',
      './config/initializers/simple_form_tailwind.rb'
    ],
    safelist: [
      'mr-2',
      'bg-gray-100',
      'text-gray-500'
    ]
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      fontFamily: {
        sans: [
          // 'Inter var',
          'Inter',
          'ui-sans-serif',
          'system-ui',
          '-apple-system',
          'BlinkMacSystemFont',
          '"Segoe UI"',
          'Roboto',
          '"Helvetica Neue"',
          'Arial',
          '"Noto Sans"',
          'sans-serif',
          '"Apple Color Emoji"',
          '"Segoe UI Emoji"',
          '"Segoe UI Symbol"',
          '"Noto Color Emoji"'
        ]
      },
      zIndex: {
        '75': 75,
        '100': 100
      }
    },
  },
  variants: {
    extend: {
      // borderWidth: ['hover', 'focus'],
      transitionProperty: ['visibility', 'height', 'opacity']
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/line-clamp'),
    require('@tailwindcss/typography')
  ]
}
