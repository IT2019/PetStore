$( document ).ready(function() {
    $('#loai').on('change',function(e){
		let value=$(this).val();
		if(value=="Chó"){
            
            $(this).val("haha");
		}
	});
});