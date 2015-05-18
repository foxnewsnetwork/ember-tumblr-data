import TumblrAdapter from './adapters/tumblr';
import TumblrSerializer from './serializers/tumblr';
import TumblrYamlSerializer from './serializers/tumblr-yaml';

var ETD = {
  TumblrAdapter: TumblrAdapter,
  TumblrSerializer: TumblrSerializer,
  TumblrYamlSerializer: TumblrYamlSerializer
};

export default ETD;
export {
  TumblrAdapter,
  TumblrSerializer,
  TumblrYamlSerializer
};