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



function initialize() {
  //js code what you want run always
}

$(document).ready(initialize);
$(document).on('page:load', initialize);

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
       console.log(this);
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

    $('form').on('click', '.toggle_remove_image', function(event) {
       console.log(this);
        // var object = $(this).prev('.hidden');
        var object = $(this).prev('#image-preview');
        console.log(object);
        if (object.hasClass("hidden")){
            $(this).next('input[type=hidden]').val('0');
            object.removeClass('hidden');
        } else {
            $(this).next('input[type=hidden]').val('1');
            object.addClass('hidden');
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
        if (progress == 100)
            console.log("업로딩이 거의 끝나갑니다. 기다려주세요");
        return data.context.find('.bar').css('width', progress + '%');
      }
    }
  });
  
});


jQuery(
    function() {
        
      return $('.image-edit-upload').on('click', $(this).prev('.image_edit').fileupload({
        dataType: "script",
        add: function(e, data) {
          var file, types;
          types = /(\.|\/)(gif|jpe?g|png)$/i;
          file = data.files[0];
          if (types.test(file.type) || types.test(file.name)) {
            data.context = $(tmpl("edit-upload", file));
            $('.image-edit-upload').append(data.context);  //왜안돼지 우선 보류...
            return data.submit();
          } else {
            return alert(file.name + " is not a gif, jpeg, or png image file");
          }
        },
        progress: function(e, data) {
          var progress;
          if (data.context) {
            progress = parseInt(data.loaded / data.total * 100, 10);
            if (progress == 100)
                console.log("업로딩이 거의 끝나갑니다. 기다려주세요");
            return data.context.find('.bar').css('width', progress + '%');
          }
        }
      }));
      
    }
);

jQuery(
    function() {
		//indirect ajax
		//file collection array
		var fileCollection = new Array();

		$('.image_edit').on('change',function(e){
			
			var event_object = e.target;
			var files = e.target.files;

			$.each(files, function(i, file){

				fileCollection.push(file);

				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e){
					var img_preview =
					  '<h4>수정 이미지</h4>'+
						'<img src="'+e.target.result+'"> '+
						' <button class="btn btn-sm btn-info image-edit-upload">업로드</button>';
				// 		console.log($(event_object).next('.image-edit-preview'));
					$(event_object).next('.image-edit-preview').append(img_preview);
				};

			});

		});
      
    }
);

