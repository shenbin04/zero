module.exports = {
  parser: 'babel-eslint',
  parserOptions: {
    ecmaVersion: 6,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  env: {
    browser: true,
    node: true,
    jest: true,
  },
  extends: ['prettier', 'prettier/flowtype', 'prettier/react', 'prettier/standard'],
  plugins: ['prettier'],
  rules: {
    'prettier/prettier': ['error'],
  },
}
