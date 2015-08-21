$(document).ready(function(){
    
    // Colorpicker and datepicker
    $('#cp1, #cp2').colorpicker(); 
    $('#dp1, #dp2').datepicker();
    
    // Form Validation
    $("#register_form").validate({
				rules:{
					nome:"required",
					email:{							
						email: true
						},
					pwd:{
						required:true,
						minlength: 6
					},
					cpwd:{
						required:true,
						equalTo: "#pwd"
					},
					tipo_pessoa:"required",
					estado:"required",
					cidade:"required",
					codigo_func:"required",
					cpf_func:{
						required:true,
						number: true
					},
					rg_func:{
						required:true,
						number: true
					},
					ctps:"required",
					pis:"required",
					serie:"required",
					data_nasc_func:"required",
					data_adm_func:"required",
					nome_pai:"required",
					nome_mae:"required",
					cel_func:"required"
					
				},
				messages:{
					nome:"Informe o nome completo",
					user_email:{
						required:"Informe o endereço de email",
						email:"Informe um endereço de email válido"
					},
					pwd:{
						required:"Informe sua senha",
						minlength:"Password must be minimum 6 characters"
					},
					cpwd:{
						required:"Confirme sua senha",
						equalTo:"Senha e confirmação precisam "
					},
					tipo_pessoa:"Selecione o tipo da pessoa",
					estado:"Selecione um estado",
					cidade:"Selecione o estado e logo após a cidades",
					codigo_func:"Informe o código do funcionário",
					cpf_func:{
						required:"Informe o CPF do funcionário",
						number: "Somente números"
					},
					rg_func:{
						required:"Informe o RG do funcionário",
						number: "Somente números"
					},
					ctps:"Informe o CTPS do funcionário",
					pis:"Informe o PIS do funcionário",
					serie:"Informe a Série do funcionário",
					data_nasc_func:"Informe a data de nascimento do funcionário",
					data_adm_func:"Informe a data de admissão do funcionário",
					nome_pai:"Nome do pai obrigatório",
					nome_mae:"Nome da mãe obrigatório",
					cel_func:"Informe o número do celular do funcionário"
				},
				errorClass: "help-inline",
				errorElement: "span",
				highlight:function(element, errorClass, validClass) {
					$(element).parents('.control-group').addClass('error');
				},
				unhighlight: function(element, errorClass, validClass) {
					$(element).parents('.control-group').removeClass('error');
					$(element).parents('.control-group').addClass('success');
				}
			});
});
