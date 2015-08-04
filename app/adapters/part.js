import ApplicationAdapter from './base';

export default ApplicationAdapter.extend({
  type: 'part',

  url: /*config.APP.API_PATH + */ '/parts',

  /*fetchUrl: function(url) {
    const proxy = config.APP.API_HOST_PROXY;
    const host = config.APP.API_HOST;
    if (proxy && host) {
      url = url.replace(proxy, host);
    }
    return url;
  }*/
});
