module.exports = {
  content: ["./src/**/*.res"],
  theme: {
    extend: {
      fontFamily: {
        sans: [
          "Open Sans",
          "sans-serif"
        ],
        mono: [
          "Fira Code",
          "Roboto Mono",
          "mono"
        ],
        serif: [
          "Georgia",
          "serif"
        ]
      },
      colors: {
        orange: '#FF732C',
        red: '#FE5F55',
        white: '#ffffff',
        green: '#376c2e',
        button_fg: '#376c2e',
        button_bg: '#a8ecb1',
        button_fg_hover: '#376c2eb5',
        button_bg_hover: '#b5ffbe',
        gray: '#e4eaf3',
        gray_light: '#fcfcfc',
        gray_dark: '#878079',
        primary: '#FBCC80',
        primary_light: '#ece6db',
        secondary: '#B6A999',
        tertiary: '#B6A999',
        background: '#312A1F',
        yellow: '#ecc94b',
      },
      maxHeight: {
        '128': '50rem',
      }
    }
  }
}
