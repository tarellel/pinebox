import { defineConfig } from 'vite';
import RubyPlugin from 'vite-plugin-ruby';
import legacy from '@vitejs/plugin-legacy'; // polyfill to add support for older browsers
// https://github.com/vitejs/vite/tree/main/packages/plugin-legacy

export default defineConfig({
  plugins: [
    RubyPlugin(),
    legacy({
      corejs: true,
      targets: ['ie >= 11'],
      additionalLegacyPolyfills: ['regenerator-runtime/runtime']
    })
  ],
})
