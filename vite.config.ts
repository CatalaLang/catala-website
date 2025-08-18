import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import rescript from "@jihchi/vite-plugin-rescript";
import react from "@vitejs/plugin-react";
import sitemap from "vite-plugin-sitemap";

const outDir = "build";

export default defineConfig({
  publicDir: "public",
  plugins: [
    react(),
    rescript(),
    tailwindcss(),
    sitemap({
      outDir,
      readable: true,
      hostname: "https://catala-lang.org",
      generateRobotsTxt: false,
      changefreq: "monthly",
      dynamicRoutes: [
        "/about",
        "/seminar",
        "/doc",
        "/doc/catala",
        "/doc/clerk",
        "/doc/formalisation",
        "/doc/publications",
        "/features",
        "/examples/family-benefits",
        "/examples/housing-benefits",
        "/examples/us-tax-code",
        "/ir-catala",
      ],
      i18n: {
        languages: ["fr", "en"],
        defaultLanguage: "en",
        strategy: "prefix",
      },
    }),
  ],
  assetsInclude: [
    "./assets/**/*.{png,jpg,jpeg,svg,gif,webp,avif}",
    "./assets/**/*.html",
  ],
  build: {
    outDir,
  },
});
