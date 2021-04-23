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
				<th colspan="6" class="vasemmalle"><a href='listaaasiakkaat.jsp?'>Takaisin listaukseen</a></th>
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
				<td><input type="submit" id="tallenna" value="Lisää"></td>
			</tr>
		</tbody>
	</table>
</form>
<span id="ilmo"></span>
</body>
<script>


$(document).ready(function(){
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
			lisaaTiedot(); 
			}
	}); 
	$("#asiakas_id").focus(); 
}); 

function lisaaTiedot(){	
	var formJsonStr = formDataJsonStr($("#tiedot").serializeArray()); 
	$.ajax({url:"asiakkaat2", data:formJsonStr, type:"POST", dataType:"json", success:function(result) {       
		if(result.response==0){
      	$("#ilmo").html("Asiakkaan lisääminen epäonnistui.");
      }else if(result.response==1){			
      	$("#ilmo").html("Asiakkaan lisääminen onnistui.");
      	$("#tiedot input").val("");
		}
  }});	
}
</script>
</html>