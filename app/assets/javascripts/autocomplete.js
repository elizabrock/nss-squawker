
 $(function () {
     $("#squeek_body").autocomplete({
        source: [ "@sally", "@bob", "@jerry", "@joan"],
        minLength: 2
     });
 });