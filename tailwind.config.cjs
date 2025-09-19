module.exports = {
  content: ['./src/**/*.{astro,html,js,ts}'],
  theme: {
    extend: {
      colors: {
        // brand palette (adjust to match demo exactly if you want)
        brand: {
          DEFAULT: '#6b46ff', // purple-ish; change to exact hex if desired
        }
      }
    }
  },
  plugins: []
};
