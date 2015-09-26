import ApplicationAdapter from './application';
//import config from 'client/config/environment';

export default ApplicationAdapter.extend({
  type: 'session',

  url: /*config.APP.API_PATH + */ '/sessions',

  /*fetchUrl: function(url) {
    const proxy = config.APP.API_HOST_PROXY;
    const host = config.APP.API_HOST;
    if (proxy && host) {
      url = url.replace(proxy, host);
    }
    return url;
  }*/
});
