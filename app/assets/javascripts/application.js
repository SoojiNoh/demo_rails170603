// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl

$(document).on('turbolinks:load', function() {
        console.log('loaded');
   $('form').on('click', '.remove_record', function(event) {
       console.log('remove');
       $(this).prev('input[type=hidden]').val('1');
       console.log($(this).closest('tr'));
       $(this).closest('tr').hide();
       return event.preventDefault();
   })
   
    $('form').on('click', '.remove_form', function(event) {
       console.log('remove');
       $(this).prev('input[type=hidden]').val('1');
       console.log($(this).closest('.panel'));
       $(this).closest('.panel').hide();
       return event.preventDefault();
   })
   
   $('form').on('click', '.add_fields', function(event) {
       console.log('clicked1');
       var regexp, time, label;
              console.log('clicked1');
       label = $(this).data('label'); //내가 추가한 것
              console.log('clicked2');
       time = new Date().getTime();
              console.log('clicked3');
       regexp = new RegExp($(this).data('id'), 'g');
              console.log('clicked4');
       $('.'+label).append($(this).data('fields').replace(regexp, time)); //내가 수정한 것
              console.log('clicked5');
       return event.preventDefault();
   });
   
    $('form').on('click', '.toggle_hidden_fields', function(event) {
       console.log('clicked');
        // var object = $(this).prev('.hidden');
        var object = $(this).prev('#hidden_field');
        console.log(object);
        if (object.hasClass("hidden")){
            object.removeClass('hidden');
            // object.removeClass('hidden');
            // object.find('input').removeClass('hidden');
            // object.find('input').attr( "type", "text" );
        } else {
            object.addClass('hidden');
            // object = $(this).prev('.input');
            // object.addClass('hidden');
            // object.find('input').addClass('hidden');
            // object.find('input').attr( "type", "hidden" );
        }
       return event.preventDefault();
   });
   
   
    $('form').on('click', '.toggle_date_fields', function(event) {
       console.log('clicked');
        var object = $(this).prev('.input');
        // var object = $(this).prev('#hidden_field');
        console.log(object);
        if (object.hasClass("hidden")){
            object.removeClass('hidden');
            // object.removeClass('hidden');
            // object.find('input').removeClass('hidden');
            // object.find('input').attr( "type", "text" );
        } else {
            object.addClass('hidden');
            // object = $(this).prev('.input');
            // object.addClass('hidden');
            // object.find('input').addClass('hidden');
            // object.find('input').attr( "type", "hidden" );
        }
       return event.preventDefault();
   });   

});




jQuery(function() {
  return $('#new_artwork').fileupload({
    dataType: "script",
    add: function(e, data) {
      var file, types;
      types = /(\.|\/)(gif|jpe?g|png)$/i;
      file = data.files[0];
      if (types.test(file.type) || types.test(file.name)) {
        data.context = $(tmpl("template-upload", file));
        $('#new_artwork').append(data.context);
        return data.submit();
      } else {
        return alert(file.name + " is not a gif, jpeg, or png image file");
      }
    },
    progress: function(e, data) {
      var progress;
      if (data.context) {
        progress = parseInt(data.loaded / data.total * 100, 10);
        console.log(data.context.find('.bar'));
        return data.context.find('.bar').css('width', progress + '%');
      }
    }
  });
});