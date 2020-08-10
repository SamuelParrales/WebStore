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
    
    $("#Cantidad").click(function(){
    	var idp=$(this).parent().find("#idpro").val();
        var Cantidad=$(this).parent().find("#Cantidad").val();
        var url="list/updateCant";
        $.ajax({
            type: 'GET',
            url: url,
            data: "idp="+idp+"&Cantidad="+Cantidad,
            success: function (data, textStatus, jqXHR){
                location.href="list?accion=OpenCarrito";
            }
        });
    });
    
    
    
    
    $("#btnComprar").click(function (){
    	swal({
    		  title: "¿Estas seguro que desea realizar esta compra?",
    		
    		  icon: "warning",
    		  buttons: true,
    		  dangerMode: true,
    		})
    		.then((willDelete) => {
    		  if (willDelete) {
    			  Comprar();
    		    swal("Tu compra ha sido realizada con éxito", {
    		      icon: "success",
    		    }).then((willDelete)=>{
        	    	if(willDelete){
        	    		parent.location.href="/TiendaWeb/Compras";
        	    	}
    		   
    		    });
    		  } else {
    		    swal("¡La acción ha sido cancelada!");
    		  }
    		});
        	  
        	});
    function Comprar() {
        var url="/TiendaWeb/Comprar";
        $.ajax({
            type: 'GET',
            url: url,
            success: function (data, textStatus, jqXHR) {
               
            }
        });
    }
    
    
});



