<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/muotoilu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.oikealle {
	text-align:right;
}
</style>
</head>
<body>
<table id="listaus">
	<thead>	
		<tr>
			<th colspan="6" class="oikealle"><span id="uusiAsiakas">Lisää uusi asiakas:</span></th>
		<tr>
			<th colspan="4" class="oikealle">Hakusana:</th>
			<th><input type="text" id="hakusana"></th>
			<th><input type="button" value="Hae" id="hakunappi"></th>		
		<tr>
			<th>Asiakastunnus</th>
			<th>Etunimi</th>
			<th>Sukunimi</th>
			<th>Puhelin</th>
			<th>Sähköposti</th>	
			<th></th>						
		</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<script>
$(document).ready(function(){
	
	$("#uusiAsiakas").click(function(){
		document.location="lisaaasiakas.jsp"; 
	});

	haeAsiakkaat(); 	
	$("#hakunappi").click(function(){ 
		haeAsiakkaat(); 
	}); 
	$(document.body).on("keydown", function(event){
		if(event.which==13){
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus(); 
});	
	
function haeAsiakkaat(){
	$("#listaus tbody").empty(); 
	$.getJSON({url:"asiakkaat2/"+$("#hakusana").val(), type:"GET", dataType:"json", success:function(result){		
		$.each(result.asiakkaat2, function(i, field){  
        	var htmlStr;
        	htmlStr+="<tr>";
        	htmlStr+="<td>"+field.asiakas_id+"</td>";
        	htmlStr+="<td>"+field.etunimi+"</td>";
        	htmlStr+="<td>"+field.sukunimi+"</td>";
        	htmlStr+="<td>"+field.puhelin+"</td>";
        	htmlStr+="<td>"+field.sposti+"</td>";
        	htmlStr+="<td><a href='muutaasiakas.jsp?asiakas_id="+field.asiakas_id+"'>Muuta</a>&nbsp;";
        	htmlStr+="<span class='poista' onclick=poista('"+field.asiakas_id+"')>Poista</span></td>";
        	htmlStr+="</tr>";
        	$("#listaus tbody").append(htmlStr);
        });	
    }});
}

function poista(asiakas_id){
	if(confirm("Poista asiakas " + asiakas_id + "?")){
		$.ajax({url:"asiakkaat2/"+asiakas_id, type:"DELETE", dataType:"json", success:function(result) {       
			if(result.response==0){
	      	$("#ilmo").html("Asiakkaan poisto epäonnistui.");
	      }else if(result.response==1){			
	      	$("ilmo").html("Asiakkaan " + asiakas_id + " poisto onnistui.");
	      	haeAsiakkaat(); 
			}
	  }});	
	}
}
</script>
</body>
</html>