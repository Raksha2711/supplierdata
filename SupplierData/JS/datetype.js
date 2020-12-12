	//<!-- Enable-disable script -->
	
		$(document).ready(function () {
		//Profit-Profile
		var $input = $('input[name=pfrom]');
		var $input1 = $('input[name=pto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=drop]').on('change', function () {
			$input.attr('disabled', $(this).val() != "custom");
			$input1.attr('disabled', $(this).val() != "custom");
		});
		//Call-Detail
		var $input2 = $('input[name=cfrom]');
		var $input3 = $('input[name=cto]');
		$input2.attr('disabled', 'disabled');
		$input3.attr('disabled', 'disabled');
		$('select[name=drop2]').on('change', function () {
			$input2.attr('disabled', $(this).val() != "custom");
			$input3.attr('disabled', $(this).val() != "custom");
		});
        //Sodexo
        var $input = $('input[name=sofrom]');
        var $input1 = $('input[name=soto]');
        $input.attr('disabled', 'disabled');
        $input1.attr('disabled', 'disabled');
        $('select[name=drop7]').on('change', function () {
            $input.attr('disabled', $(this).val() != "custom");
            $input1.attr('disabled', $(this).val() != "custom");
        });
		//Help By
		var $input4 = $('input[name=hfrom]');
		var $input5 = $('input[name=hto]');
		$input4.attr('disabled', 'disabled');
		$input5.attr('disabled', 'disabled');
		$('select[name=helpbydate]').on('change', function () {
			$input4.attr('disabled', $(this).val() != "custom");
			$input5.attr('disabled', $(this).val() != "custom");
		});
		//Mistake
		var $input6 = $('input[name=mfrom]');
		var $input7 = $('input[name=mto]');
		$input6.attr('disabled', 'disabled');
		$input7.attr('disabled', 'disabled');
		$('select[name=mistakedate]').on('change', function () {
			$input6.attr('disabled', $(this).val() != "custom");
			$input7.attr('disabled', $(this).val() != "custom");
		});

        //Miscall Data
        var $input = $('input[name=mdfrom]');
        var $input = $('input[name=mdto]');
        $input.attr('disabled', 'disabled');
        $input.attr('disabled', 'disabled');
        $('select[name=miscalldata]').on('change', function () {
            $input.attr('disabled', $(this).val() != "custom8");
            $input.attr('disabled', $(this).val() != "custom8");
        });
                //Post-it Created
		var $input8 = $('input[name=pcfrom]');
		var $input9 = $('input[name=pcto]');
		$input8.attr('disabled', 'disabled');
		$input9.attr('disabled', 'disabled');
		$('select[name=postcreated]').on('change', function () {
			$input8.attr('disabled', $(this).val() != "custom5");
			$input9.attr('disabled', $(this).val() != "custom5");
		});
		//Post-it Assigned
		var $input10 = $('input[name=pafrom]');
		var $input11 = $('input[name=pato]');
		$input10.attr('disabled', 'disabled');
		$input11.attr('disabled', 'disabled');
		$('select[name=postassigned]').on('change', function () {
			$input10.attr('disabled', $(this).val() != "custom6");
			$input11.attr('disabled', $(this).val() != "custom6");
		});
		//Flash Sales Inquiry
		var $input12 = $('input[name=fsfrom]');
		var $input13 = $('input[name=fsto]');
		$input12.attr('disabled', 'disabled');
		$input13.attr('disabled', 'disabled');
		$('select[name=fscalendar]').on('change', function () {
			$input12.attr('disabled', $(this).val() != "custom7");
			$input13.attr('disabled', $(this).val() != "custom7");
		});
	}); 
	
	//<!-- /Enable-disable script -->

// Profile-Profile Date type Script

	
	function changedate(dayformat) {
	    $('#pfrom').val("");
	    $('#pto').val("");
	    document.getElementById('pfrom').disabled = true;
	    document.getElementById('pto').disabled = true;

        if (dayformat == "Yesterday") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('pfrom').value = yesterday;
            document.getElementById('pto').value = yesterday;
		}
        else if (dayformat == "Today") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('pfrom').value = today;
            document.getElementById('pto').value = today;
		}
        else if (dayformat == "This Week") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('pfrom').value = a;
			document.getElementById('pto').value = b;
		}
        else if (dayformat == "Last Week") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pfrom').value = a;
			document.getElementById('pto').value = b;
		}
        else if (dayformat == "This Month") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pfrom').value = a;
			document.getElementById('pto').value = b;
		}
        else if (dayformat == "Last Month") {

            document.getElementById('pfrom').disabled = true;
            document.getElementById('pto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pfrom').value = a;
			document.getElementById('pto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
        else if (dayformat == "custom") 
        {
			document.getElementById('pfrom').disabled = false;
			document.getElementById('pto').disabled = false;
			$('#pfrom').datepicker();
			$('#pto').datepicker();
		}
        //else { alert("Date Not In Well Formte."); }
    }
	
	// Profile-Profile Date type Script
	
	// Call Detail Date type Script
	
	function changedate1(dayformat1) {

	    $('#cfrom').val("");
	    $('#cto').val("");
	    document.getElementById('cfrom').disabled = true;
	    document.getElementById('cto').disabled = true;

        if (dayformat1 == "Yesterday") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('cfrom').value = yesterday;
            document.getElementById('cto').value = yesterday;
		}
        else if (dayformat1 == "Today") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('cfrom').value = today;
            document.getElementById('cto').value = today;
		}
        else if (dayformat1 == "This Week") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('cfrom').value = a;
			document.getElementById('cto').value = b;
		}
        else if (dayformat1 == "Last Week") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('cfrom').value = a;
			document.getElementById('cto').value = b;
		}
        else if (dayformat1 == "This Month") {

             document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('cfrom').value = a;
			document.getElementById('cto').value = b;
		}
        else if (dayformat1 == "Last Month") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('cfrom').value = a;
			document.getElementById('cto').value = b;
		}
        else if (dayformat1 == "SpecificDate") {
        }
		else if (dayformat1 == "custom") {
			document.getElementById('cfrom').disabled = false;
			document.getElementById('cto').disabled = false;
			$('#cfrom').datepicker();
			$('#cto').datepicker();
		}

    }

    // /Call Detail Date type Script

    // Sodexo Date type Script

    function changedate7(dayformat7) {
        
        $('#sofrom').val("");
        $('#soto').val("");
        document.getElementById('sofrom').disabled = true;
        document.getElementById('soto').disabled = true;
        if (dayformat7 == "Yesterday") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            var date = new Date();
            date.setDate(date.getDate() - 1);
            var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('sofrom').value = yesterday;
            document.getElementById('soto').value = yesterday;
        }
        else if (dayformat7 == "Today") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('sofrom').value = today;
            document.getElementById('soto').value = today;
        }
        else if (dayformat7 == "This Week") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('sofrom').value = a;
            document.getElementById('soto').value = b;
        }
        else if (dayformat7 == "Last Week") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('sofrom').value = a;
            document.getElementById('soto').value = b;
        }
        else if (dayformat7 == "This Month") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('sofrom').value = a;
            document.getElementById('soto').value = b;
        }
        else if (dayformat7 == "Last Month") {

            document.getElementById('sofrom').disabled = true;
            document.getElementById('soto').disabled = true;

            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('sofrom').value = a;
            document.getElementById('soto').value = b;
        }
        else if (dayformat7 == "SpecificDate") {
        }
        else if (dayformat7 == "custom") {

            document.getElementById('sofrom').disabled = false;
            document.getElementById('soto').disabled = false;
            $('#sofrom').datepicker();
            $('#soto').datepicker();
        }
    }

    // /Sodexo Date type Script
	
	// Help By Date type Script
	
	function changedate2(helpbydate) {

	    $('#hfrom').val("");
	    $('#hto').val("");
	    document.getElementById('hfrom').disabled = true;
	    document.getElementById('hto').disabled = true;
        if (helpbydate == "Yesterday") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('hfrom').value = yesterday;
            document.getElementById('hto').value = yesterday;
		}
        else if (helpbydate == "Today") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('hfrom').value = today;
            document.getElementById('hto').value = today;
		}
        else if (helpbydate == "This Week") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('hfrom').value = a;
			document.getElementById('hto').value = b;
		}
        else if (helpbydate == "Last Week") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('hfrom').value = a;
			document.getElementById('hto').value = b;
		}
        else if (helpbydate == "This Month") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('hfrom').value = a;
			document.getElementById('hto').value = b;
		}
        else if (helpbydate == "Last Month") {

            document.getElementById('hfrom').disabled = true;
            document.getElementById('hto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('hfrom').value = a;
			document.getElementById('hto').value = b;
		}
        else if (helpbydate == "SpecificDate") {
        }
		else if (helpbydate == "custom") {
			document.getElementById('hfrom').disabled = false;
			document.getElementById('hto').disabled = false;
			$('#hfrom').datepicker();
			$('#hto').datepicker();
		}
    }
	
	// /Help By Date type Script
	
	// Mistake Date type Script
	
	function changedate3(mistakedate) {
	    
	    $('#mfrom').val("");
	    $('#mto').val("");
	    document.getElementById('mfrom').disabled = true;
	    document.getElementById('mto').disabled = true;
        if (mistakedate == "Yesterday") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('mfrom').value = yesterday;
            document.getElementById('mto').value = yesterday;
		}
        else if (mistakedate == "Today") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('mfrom').value = today;
            document.getElementById('mto').value = today;
		}
        else if (mistakedate == "This Week") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('mfrom').value = a;
			document.getElementById('mto').value = b;
		}
        else if (mistakedate == "Last Week") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mfrom').value = a;
			document.getElementById('mto').value = b;
		}
        else if (mistakedate == "This Month") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mfrom').value = a;
			document.getElementById('mto').value = b;
		}
        else if (mistakedate == "Last Month") {

            document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mfrom').value = a;
			document.getElementById('mto').value = b;
		}
        else if (mistakedate == "SpecificDate") {
        }
		else if (mistakedate == "custom") {
			document.getElementById('mfrom').disabled = false;
			document.getElementById('mto').disabled = false;
			$('#mfrom').datepicker();
			$('#mto').datepicker();
		}
    }
	
	// /Mistake Date type Script

    // Miscall Data Script

    function changedate8(miscalldata) {

        $('#mdfrom').val("");
        $('#mdto').val("");
        document.getElementById('mdfrom').disabled = true;
        document.getElementById('mdto').disabled = true;

        if (miscalldata == "Yesterday") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            var date = new Date();
            date.setDate(date.getDate() - 1);
            var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('mdfrom').value = yesterday;
            document.getElementById('mdto').value = yesterday;
        }
        else if (miscalldata == "Today") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('mdfrom').value = today;
            document.getElementById('mdto').value = today;
        }
        else if (miscalldata == "This Week") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mdfrom').value = a;
            document.getElementById('mdto').value = b;
        }
        else if (miscalldata == "Last Week") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mdfrom').value = a;
            document.getElementById('mdto').value = b;
        }
        else if (miscalldata == "This Month") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mdfrom').value = a;
            document.getElementById('mdto').value = b;
        }
        else if (miscalldata == "Last Month") {

            document.getElementById('mdfrom').disabled = true;
            document.getElementById('mdto').disabled = true;

            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('mdfrom').value = a;
            document.getElementById('mdto').value = b;
        }
        else if (miscalldata == "SpecificDate") {
        }
        else if (miscalldata == "custom8") {
            document.getElementById('mdfrom').disabled = false;
            document.getElementById('mdto').disabled = false;
            $('#mdfrom').datepicker();
            $('#mdto').datepicker();
        }
    }
	

	// Post-it Created Date type Script
	
	function changedate4(postcreated) {

	    $('#pcfrom').val("");
	    $('#pcto').val("");
	    document.getElementById('pcfrom').disabled = true;
	    document.getElementById('pcto').disabled = true;

        if (postcreated == "Yesterday") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('pcfrom').value = yesterday;
            document.getElementById('pcto').value = yesterday;
		}
        else if (postcreated == "Today") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('pcfrom').value = today;
            document.getElementById('pcto').value = today;
		}
        else if (postcreated == "This Week") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('pcfrom').value = a;
			document.getElementById('pcto').value = b;
		}
        else if (postcreated == "Last Week") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pcfrom').value = a;
			document.getElementById('pcto').value = b;
		}
        else if (postcreated == "This Month") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pcfrom').value = a;
			document.getElementById('pcto').value = b;
		}
        else if (postcreated == "Last Month") {

            document.getElementById('pcfrom').disabled = true;
            document.getElementById('pcto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pcfrom').value = a;
			document.getElementById('pcto').value = b;
		}
        else if (postcreated == "SpecificDate") {
        }
        else if (postcreated == "custom5") {
			document.getElementById('pcfrom').disabled = false;
			document.getElementById('pcto').disabled = false;
			$('#pcfrom').datepicker();
			$('#pcto').datepicker();
		}
    }
	
	// /Post-it Created Date type Script
	
	// Post-it Assigned Date type Script

    function changedate5(postassigned) 
    {
	    $('#pafrom').val("");
	    $('#pato').val("");
	    document.getElementById('pafrom').disabled = true;
	    document.getElementById('pato').disabled = true;

        if (postassigned == "Yesterday") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('pafrom').value = yesterday;
            document.getElementById('pato').value = yesterday;
		}
        else if (postassigned == "Today") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('pafrom').value = today;
            document.getElementById('pato').value = today;
		}
        else if (postassigned == "This Week") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('pafrom').value = a;
			document.getElementById('pato').value = b;
		}
        else if (postassigned == "Last Week") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pafrom').value = a;
			document.getElementById('pato').value = b;
		}
        else if (postassigned == "This Month") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pafrom').value = a;
			document.getElementById('pato').value = b;
		}
        else if (postassigned == "Last Month") {

            document.getElementById('pafrom').disabled = true;
            document.getElementById('pato').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('pafrom').value = a;
			document.getElementById('pato').value = b;
		}
        else if (postassigned == "SpecificDate") {
        }
		else if (postassigned == "custom") {
			document.getElementById('pafrom').disabled = false;
			document.getElementById('pato').disabled = false;
			$('#pafrom').datepicker();
			$('#pato').datepicker();
		}
    }
	
	// /Post-it Assigned Date type Script
	
	// Flash Sales Inquiry Date type Script
	
	function changedate6(fscalendar) {
	    $('#fsfrom').val("");
	    $('#fsto').val("");
	    document.getElementById('fsfrom').disabled = true;
	    document.getElementById('fsto').disabled = true;

        if (fscalendar == "Yesterday") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('fsfrom').value = yesterday;
            document.getElementById('fsto').value = yesterday;
		}
        else if (fscalendar == "Today") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('fsfrom').value = today;
            document.getElementById('fsto').value = today;
		}
        else if (fscalendar == "This Week") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() + (6 - daynumweek) * 1000 * 60 * 60 * 24);

            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
			document.getElementById('fsfrom').value = a;
			document.getElementById('fsto').value = b;
		}
        else if (fscalendar == "Last Week") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            if (today.getDay() == '0') {
                var daynumweek = today.getDay() + 6;
            }
            else {
                var daynumweek = today.getDay() - 1;
            }
            var firstday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 - daynumweek * 1000 * 60 * 60 * 24);
            var lastday = new Date(today.getTime() - 7 * 1000 * 60 * 60 * 24 + (6 - daynumweek) * 1000 * 60 * 60 * 24);
            //firstday
            var date = new Date(firstday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
            mnth = ("0" + (date.getMonth() + 1)).slice(-2),
            day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('fsfrom').value = a;
			document.getElementById('fsto').value = b;
		}
        else if (fscalendar == "This Month") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth, 1);
            var lastday = new Date(currentyear, currentmonth + 1, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('fsfrom').value = a;
			document.getElementById('fsto').value = b;
		}
        else if (fscalendar == "Last Month") {

            document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			
            //lastmonth
            var today = new Date();
            var currentmonth = today.getMonth();
            var currentyear = today.getFullYear();
            var firstday = new Date(currentyear, currentmonth - 1, 1);
            var lastday = new Date(currentyear, currentmonth, 0);
            //firstday
            var date = new Date(firstday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var a = [day, mnth, date.getFullYear()].join("/");
            //lastday
            var date = new Date(lastday),
			mnth = ("0" + (date.getMonth() + 1)).slice(-2),
			day = ("0" + date.getDate()).slice(-2);
            var b = [day, mnth, date.getFullYear()].join("/");
            document.getElementById('fsfrom').value = a;
			document.getElementById('fsto').value = b;
		}
        else if (fscalendar == "SpecificDate") {
        }
        else if (fscalendar == "custom7") 
        {
			document.getElementById('fsfrom').disabled = false;
			document.getElementById('fsto').disabled = false;
			$('#fsfrom').datepicker();
			$('#fsto').datepicker();
		}
        //else { alert("Date Not In Well Formte."); }
    }
	
	// /Flash Sales Inquiry Date type Script
	