/**
 * Metro configuration for React Native
 * https://github.com/facebook/react-native
 *
 * @format
 */

const path = require('path')

module.exports = {
  extraNodeModules: {
    '@babel': path.resolve(__dirname, '../../node_modules/@babel'),
  },
  watchFolders: [
    path.resolve(__dirname, "../../node_modules"),
  ],
  transformer: {
    getTransformOptions: async () => ({
      transform: {
        experimentalImportSupport: false,
        inlineRequires: false,
      },
    }),
  },
}
