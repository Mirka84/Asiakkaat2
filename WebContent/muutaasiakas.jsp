<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/muotoilu.css">
<script src="scripts/jsmain.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form id="tiedot">
	<table>
		<thead>
			<tr>
				<th colspan="6" class="oikealle"><a href='listaaasiakkaat.jsp?'>Takaisin listaukseen</a></th>
			</tr>
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
			<tr>
				<td><input type="text" name="asiakas_id" id="asiakas_id"></td>
				<td><input type="text" name="etunimi" id="etunimi"></td>
				<td><input type="text" name="sukunimi" id="sukunimi"></td>
				<td><input type="text" name="puhelin" id="puhelin"></td>
				<td><input type="text" name="sposti" id="sposti"></td>
				<td><input type="submit" id="tallenna" value="Hyväksy"></td>
			</tr>
		</tbody>
	</table>
	<input type="hidden" id="vanhaasiakas_id" value="vanhaasiakas_id">
</form>
<span id="ilmo"></span>
</body>
<script>
$(document).ready(function(){
	var asiakas_id=requestURLParam("asiakas_id"); 
	$.ajax({url:"asiakkaat2/haeyksi/"+asiakas_id, type:"GET", dataType:"json", success:function(result){
		$("#asiakas_id").val(result.asiakas_id);
		$("#etunimi").val(result.etunimi);
		$("#sukunimi").val(result.sukunimi);
		$("#puhelin").val(result.puhelin);
		$("#sposti").val(result.sposti);
		}});
	
	$("#tiedot").validate({
			rules: {
				etunimi: {
					required: true,
					minlength: 2
				},
				sukunimi:{
					required: true,
					minlength: 2
				},
				puhelin: {
					required: true,
					minlength: 7
				},
				sposti: {
					required: true,
					minlength: 5
				}
			},
			messages: {
				etunimi: {
					required: "Etunimi puuttuu",
					minlength: "Etunimi on liian lyhyt"
				},
				sukunimi: {
					required: "Sukunimi puuttuu",
					minlength: "Sukunimi on liian lyhyt"
				},
				puhelin: {
					required: "Puhelinnumero puuttuu",
					minlength: "Puhelinnumero on liian lyhyt"
				},
				sposti: {
					required: "Sähköpostiosoite puuttuu",
					minlength: "Sähköpostiosoite ei ole kelvollinen"
				}
				
			},
			submitHandler: function(form){
				paivitaTiedot(); 
				}
		});  
	}); 

	function paivitaTiedot(){	
		var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); 
		$.ajax({url:"asiakkaat2", data:formJsonStr, type:"PUT", dataType:"json", success:function(result) {       
			if(result.response==0){
	      	$("#ilmo").html("Asiakkaan päivittäminen epäonnistui.");
	      }else if(result.response==1){			
	      	$("#ilmo").html("Asiakkaan päivittäminen onnistui.");
	      	$("#tiedot input").val("");
			}
	  }});	
	}
</script>
</html>