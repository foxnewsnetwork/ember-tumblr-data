/* jshint node: true */
'use strict';

module.exports = {
  name: 'ember-tumblr-data'
  included: function(app) {
    this._super.included(app);
    app.import(app.bowerDirectory + "/js-yaml/dist/js-yaml.js");
  }
};
