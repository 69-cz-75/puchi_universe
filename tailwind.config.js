module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/components/**/*'
  ],
  plugins: [
    require("daisyui")
  ],
  daisyui: {
    themes: ["light"]
  },
  theme: {
    screens: {
      'sm': '360px',
      // => @media (min-width: 360px) { ... }

      'md': '520px',
      // => @media (min-width: 520px) { ... }

      'lg': '960px',
      // => @media (min-width: 960px) { ... }
    }
  }
}
