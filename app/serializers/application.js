import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({

  normalizeQueryResponse(store, clazz, payload) {
    const result = this._super(...arguments);
    result.meta = result.meta || {};

    if (payload.links) {
      result.meta.pagination = this.createPageMeta(payload.links);
    }

    return result;
  },

  createPageMeta(data) {
    let meta = {};

    const refArray = ['first', 'prev', 'next', 'last'];
    let sortedKeys = Object.keys(data).sort(function(a,b) {
      return refArray.indexOf(a) - refArray.indexOf(b);
    });
    sortedKeys.forEach(type => {
      const link = data[type];
      meta[type] = {};
      let a = document.createElement('a');
      a.href = link;

      a.search.slice(1).split('&').forEach(pairs => {
        const [param, value] = pairs.split('=');

        if (param === 'page[number]') {
          meta[type].number = parseInt(value);
        }
        if (param === 'page[size]') {
          meta[type].size = parseInt(value);
        }

      });
      a = null;
    });

    return meta;

  }
  
});
