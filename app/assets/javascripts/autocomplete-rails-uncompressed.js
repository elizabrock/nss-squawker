$(document).ready(function() {
  $('#squeek_user_username')
  .textcomplete([
    {
      match: /(^|\s)@(\w*)$/,
      search: function (partial_username, callback) {

        $.getJSON('/squeeks/autocomplete_user_username', { term: partial_username })
          .done(function (resp) { callback(userNamesJson2Array(resp)); })
          .fail(function ()     { callback([]);   });
      },
      replace: function (value) {
        return '$1@' + value + ' ';
      }
    }
  ])
  .overlay([
    {
        match: /\B@\w+/g,
        css: {
            'background-color': '#d8dfea'
        }
    }
  ]);
});

function userNamesJson2Array(json){
  var result = [];
  for (i=0; i < json.length; i++) {
    result.push(json[i].value);
  }
  return result;
}
