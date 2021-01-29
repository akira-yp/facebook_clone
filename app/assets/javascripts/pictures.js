$(function(){
  $(document).on('keyup','.content-form',function(){
    let count = $(this).val().length;
    let $submit = $('.submit-btn');
    if(count >= 1 && count <= 500){
      $submit.children('svg').css('fill','#2F72FF');
      $submit.removeClass('no-click');
    }else{
      $submit.children('svg').css('fill','#8baffc');
      $submit.addClass('no-click');
    };
  });
});
