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
        primary_light: '#FBCC80',
        primary_dark: '#376c2e',
        text_light: '#FFFDFA',
        text_dark: '#2F2F2F',
        purple_bg: '#c6a8ec',
        purple_bg_hover: '#c6a8ec',
        purple_text: '#55377b',
        purple_text_hover: '#734da3',
        button_fg: '#376c2e',
        button_bg: '#a8ecb1',
        button_fg_hover: '#376c2eb5',
        button_bg_hover: '#b5ffbe',
        background: '#24211C',
        green: '#376c2e',
        orange: '#FF732C',
        orange_50: '#FFD6C2',
        red: '#FE5F55',
        yellow: '#ecc94b',
        white: '#ffffff',
        rainforest: '#007663',
        rainforest_50: '#C2FFF5',
        gray: '#e4eaf3',
        gray_2: '#ebeef3',
        gray_light: '#fcfcfc',
        gray_medium: '#d1d6dd',
        gray_dark: '#878079',
        secondary: '#B6B9B9',
        tertiary: '#B6A999',
        nv: '#996633',
        nc: '#BB0066',
        mb: '#6600EE',
        mi: '#0000DD',
        mf: '#6600EE',
      },
      maxHeight: {
        '128': '50rem',
      }
    }
  }
}
