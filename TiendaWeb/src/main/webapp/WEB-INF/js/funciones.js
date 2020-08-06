$(document).ready(function(){
    $("tr #btnDelete").click(function (){
        var idp=$(this).parent().find("#idp").val();
        swal({
        	  title: "¿Estas seguro que desea realizar esta acción?",
        	  text: "Una vez eliminado, ¡Este producto no se incluirá en la compra!",
        	  icon: "warning",
        	  buttons: true,
        	  dangerMode: true,
        	})
        	.then((willDelete) => {
        	  if (willDelete) {
        		  eliminar(idp);
        	    swal("¡Poof! ¡El producto ya no esta incluido en la compra!", {
        	      icon: "success",
        	    }).then((willDelete)=>{
        	    	if(willDelete){
        	    		parent.location.href="list?accion=OpenCarrito";
        	    	}
        	    		
        	    });
        	  } else {
        	    swal("¡La acción ha sido cancelada!");
        	  }
        	});
        
    });
    function eliminar(idp) {
        var url="list/delete";
        $.ajax({
            type: 'GET',
            url: url,
            data: "idp="+idp,
            success: function (data, textStatus, jqXHR) {
               
            }
        });
    }
});