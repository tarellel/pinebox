// https://eslint.org/docs/rules/
// https://github.com/airbnb/javascript

module.exports = {
  "env": {
    "browser": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended"
  ],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": 12,
    "sourceType": "module"
  },
  "plugins": [
    "@typescript-eslint"
  ],
  "rules": {
    "arrow-parens":  ["error", "always"],
    "arrow-spacing": ["error", { "before": true, "after": true }],
    "block-spacing": [2, "always"],
    "comma-dangle":  ["error", "never"],
    "keyword-spacing": 2,
    "max-len": ["error", { "code": 120,
                           "ignoreComments": true,
                           "ignoreTrailingComments": true }],
    "no-unused-vars": 0, // allow functions to have unused variables
    "object-curly-spacing": [2, "always"],
    "semi": [2, "always"],
    // "space-before-blocks": 2,
    // "space-before-blocks": ["error", "never"],
    "space-before-blocks": ["error", { "functions": "always", "keywords": "never", "classes": "always" }],
    "space-before-function-paren": [2, "never"]
  }
};
