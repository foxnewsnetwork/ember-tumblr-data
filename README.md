# Ember-tumblr-data

Adapter and serializers for emberjs to use tumblr (via their api) as a sort of DIY free database solution. This is super experimental alpha software, use it at your own peril (I know I will).

## Dummy Dependencies
The dummy site requires a *lot* more addons to run

public addons
```sh
ember-intl
ember-named-yields
ember-truth-helpers
ember-moment
ember-lodash
ember-font-awesome
ember-config-service
ember-concurrency
ember-composable-helpers
ember-code-snippet
ember-cli-sass
ember-material-lite
ember-cli-autoprefixer
flexi
ember-notify
ember-data-factory-guy
liquid-fire
ember-pace
ember-cli-page-object
ember-cli-document-title
```

bower addons (we need to do this because the ember mdl package pulls in an outdated version): 
```sh
bower install --save material-design-lite
```

unpublished addons:
```sh
npm install --save-dev git+https://gitlab.com/foxnewsnetwork/ember-matport.git
npm install --save-dev git+https://gitlab.com/pisource/simwms.git#v0.1.4
npm install --save-dev git+https://gitlab.com/foxnewsnetwork/storefront.git#v0.1.4
```

## Installation

* `git clone` this repository
* `npm install`
* `bower install`

## Running

* `ember server`
* Visit your app at http://localhost:4200.

## Running Tests

Before you attemp to test, you must create a `tests/fixtures/keys.js` file which will contain your tumblr access keys. The file should look like this:

```javascript
export default {
  key: "my-oauth-access-key",
  secret: "my-oauth-secret-key"
};
```
Be aware that acceptance tests will create posts onto your tumblr

* `ember test`
* `ember test --server`

## Building

* `ember build`

For more information on using ember-cli, visit [http://www.ember-cli.com/](http://www.ember-cli.com/).
