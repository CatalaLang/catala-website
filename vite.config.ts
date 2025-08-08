import { defineConfig } from "vite";
import tailwindcss from "@tailwindcss/vite";
import rescript from "@jihchi/vite-plugin-rescript";
import react from "@vitejs/plugin-react";

export default defineConfig({
  publicDir: "public",
  plugins: [react(), rescript(), tailwindcss()],
  assetsInclude: ["./assets/**/*.html"],
});
