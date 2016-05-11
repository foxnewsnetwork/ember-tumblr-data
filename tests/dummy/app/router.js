import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route("about");
  this.route("discography");
  this.route("contact");
  this.route("blog");
  this.route("shop");
  this.route("goods", {path: "/goods"}, function() {
    this.route("usage");
  });
});

export default Router;
