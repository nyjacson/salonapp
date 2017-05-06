const hypernova = require('hypernova/server');

hypernova({
  devMode: true,

  getComponent(name) {
    if (name === 'MyComponent.js') {
      return require('./src/javascripts/component/MyComponent.js');
    }
    return null;
  },

  port: 3030,
});