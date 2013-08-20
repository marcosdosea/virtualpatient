/*
* Objetivo da fun��o a seguir � atualizar e validar o model de view partial
* fazendo com que a s� a view partial seja atualizada, dessa forma n�o ocasiona
* reload da pagina nem perda visual do dados preenchidos em outras view partial
*/
$(function () {
    $('form').submit(function () {
        if ($(this).valid()) {
            $.ajax({
                url: this.action,
                type: this.method,
                data: $(this).serialize(),
                success: function (result) {
                    $('#result').html(result);
                }
            });
        }
        return false;
    });
});