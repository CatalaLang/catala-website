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
        purple_bg: '#c6a8ec',
        purple_bg_hover: '#c6a8ec',
        purple_text: '#55377b',
        purple_text_hover: '#734da3',
        button_fg: '#376c2e',
        button_bg: '#a8ecb1',
        button_fg_hover: '#376c2eb5',
        button_bg_hover: '#b5ffbe',
        gray: '#e4eaf3',
        gray_2: '#f1f1f1',
        gray_light: '#fcfcfc',
        gray_medium: '#d1d6dd',
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
