module.exports = {
  purge: [
    '../lib/petal_live_view_web/live/**/*.ex',
    '../lib/petal_live_view_web/live/**/*.leex',
    '../lib/petal_live_view_web/templates/**/*.eex',
    '../lib/petal_live_view_web/templates/**/*.leex',
    '../lib/petal_live_view_web/views/**/*.ex',
    './js/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
