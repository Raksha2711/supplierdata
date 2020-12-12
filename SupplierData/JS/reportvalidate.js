	//<!-- Enable-disable script -->
		$(document).ready(function () {
		//CS Performance Report
		var $input = $('input[name=cfrom]');
		var $input1 = $('input[name=cto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=csreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "ccustom");
			$input1.attr('disabled', $(this).val() != "ccustom");
		});
		//Dispatch Agent Performance Report
		var $input = $('input[name=dfrom]');
		var $input1 = $('input[name=dto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=dispatchreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "dcustom");
			$input1.attr('disabled', $(this).val() != "dcustom");
		});
		//Dispatch Report
		var $input = $('input[name=dpfrom]');
		var $input1 = $('input[name=dpto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=dispatchreport2]').on('change', function () {
			$input.attr('disabled', $(this).val() != "dpcustom");
			$input1.attr('disabled', $(this).val() != "dpcustom");
		});
		//Employee Working Hours Report
		var $input = $('input[name=efrom]');
		var $input1 = $('input[name=eto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=empreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "ecustom");
			$input1.attr('disabled', $(this).val() != "ecustom");
		});
		//Media Received & Missed Calls Report
		var $input = $('input[name=mfrom]');
		var $input1 = $('input[name=mto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=mediareport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "mcustom");
			$input1.attr('disabled', $(this).val() != "mcustom");
		});
		//Rollover Report
		var $input = $('input[name=rfrom]');
		var $input1 = $('input[name=rto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=rolloverreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "rcustom");
			$input1.attr('disabled', $(this).val() != "rcustom");
		});
		//Sales Agent Target Data Report
		var $input = $('input[name=sfrom]');
		var $input1 = $('input[name=sto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=salesreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "scustom");
			$input1.attr('disabled', $(this).val() != "scustom");
		});
		//Sage MCS Card Type Report
		var $input = $('input[name=sgfrom]');
		var $input1 = $('input[name=sgto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=sagereport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "sgcustom");
			$input1.attr('disabled', $(this).val() != "sgcustom");
		});
		//UK Booking Report
		var $input = $('input[name=ufrom]');
		var $input1 = $('input[name=uto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=ukreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "ucustom");
			$input1.attr('disabled', $(this).val() != "ucustom");
		});
		//Barger Agent Report
		var $input = $('input[name=bfrom]');
		var $input1 = $('input[name=bto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=bargerreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "bcustom");
			$input1.attr('disabled', $(this).val() != "bcustom");
		});
		//Media QC Report
		var $input = $('input[name=mqfrom]');
		var $input1 = $('input[name=mqto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=mediaqcreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "mqcustom");
			$input1.attr('disabled', $(this).val() != "mqcustom");
		});
		//Flash Sale Email Inquiry Report
		var $input = $('input[name=fsfrom]');
		var $input1 = $('input[name=fsto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=flashsalesreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "fscustom");
			$input1.attr('disabled', $(this).val() != "fscustom");
		});
		//Agent Sales Report
		var $input = $('input[name=asfrom]');
		var $input1 = $('input[name=asto]');
		$input.attr('disabled', 'disabled');
		$input1.attr('disabled', 'disabled');
		$('select[name=agentsalesreport]').on('change', function () {
			$input.attr('disabled', $(this).val() != "ascustom");
			$input1.attr('disabled', $(this).val() != "ascustom");
		});
	}); 
	//<!-- /Enable-disable script -->

	// CS Performance Report Date type Script
	function changedate(dayformat) {

        if (dayformat == "Yesterday") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('cfrom').value = yesterday;
            document.getElementById('cto').value = yesterday;
		}
        else if (dayformat == "Today") {

            document.getElementById('cfrom').disabled = true;
            document.getElementById('cto').disabled = true;
			
            var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('cfrom').value = today;
            document.getElementById('cto').value = today;
		}
        else if (dayformat == "This Week") {

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
        else if (dayformat == "Last Week") {

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
        else if (dayformat == "This Month") {

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
        else if (dayformat == "Last Month") {

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
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "ccustom") {
			document.getElementById('cfrom').disabled = false;
            document.getElementById('cto').disabled = false;
		}
    }
	// CS Performance Report Date type Script
	
	// Dispatch Agent Performance Report Date type Script
	function changedate1(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('dfrom').value = yesterday;
            document.getElementById('dto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('dfrom').value = today;
            document.getElementById('dto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
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
			document.getElementById('dfrom').value = a;
			document.getElementById('dto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
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
            document.getElementById('dfrom').value = a;
			document.getElementById('dto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
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
            document.getElementById('dfrom').value = a;
			document.getElementById('dto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('dfrom').disabled = true;
            document.getElementById('dto').disabled = true;
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
            document.getElementById('dfrom').value = a;
			document.getElementById('dto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "dcustom") {
			document.getElementById('dfrom').disabled = false;
            document.getElementById('dto').disabled = false;
		}
	}
	// Dispatch Agent Performance Report Date type Script
	
	// Dispatch Report Date type Script
	function changedate2(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('dpfrom').value = yesterday;
            document.getElementById('dpto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('dpfrom').value = today;
            document.getElementById('dpto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
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
			document.getElementById('dpfrom').value = a;
			document.getElementById('dpto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
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
            document.getElementById('dpfrom').value = a;
			document.getElementById('dpto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
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
            document.getElementById('dpfrom').value = a;
			document.getElementById('dpto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('dpfrom').disabled = true;
            document.getElementById('dpto').disabled = true;
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
            document.getElementById('dpfrom').value = a;
			document.getElementById('dpto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "dpcustom") {
			document.getElementById('dpfrom').disabled = false;
            document.getElementById('dpto').disabled = false;
		}
    }
	// Dispatch Report Date type Script
	
	// Employee Working Hours Report Date type Script
	function changedate3(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('efrom').value = yesterday;
            document.getElementById('eto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('efrom').value = today;
            document.getElementById('eto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
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
			document.getElementById('efrom').value = a;
			document.getElementById('eto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
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
            document.getElementById('efrom').value = a;
			document.getElementById('eto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
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
            document.getElementById('efrom').value = a;
			document.getElementById('eto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('efrom').disabled = true;
            document.getElementById('eto').disabled = true;
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
            document.getElementById('efrom').value = a;
			document.getElementById('eto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "ecustom") {
			document.getElementById('efrom').disabled = false;
            document.getElementById('eto').disabled = false;
		}
    }
	// Employee Working Hours Report Date type Script
	
	// Media Received & Missed Calls Report Date type Script
	function changedate4(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('mfrom').value = yesterday;
            document.getElementById('mto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('mfrom').disabled = true;
            document.getElementById('mto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('mfrom').value = today;
            document.getElementById('mto').value = today;
		}
        else if (dayformat == "This Week") {
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
			document.getElementById('eto').value = b;
		}
        else if (dayformat == "Last Week") {
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
        else if (dayformat == "This Month") {
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
        else if (dayformat == "Last Month") {
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
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "mcustom") {
			document.getElementById('mfrom').disabled = false;
            document.getElementById('mto').disabled = false;
		}
    }
	// Media Received & Missed Calls Report Date type Script
	
	// Rollover Report Date type Script
	function changedate5(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('rfrom').value = yesterday;
            document.getElementById('rto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('rfrom').value = today;
            document.getElementById('rto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
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
			document.getElementById('rfrom').value = a;
			document.getElementById('rto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
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
            document.getElementById('rfrom').value = a;
			document.getElementById('rto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
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
            document.getElementById('rfrom').value = a;
			document.getElementById('rto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('rfrom').disabled = true;
            document.getElementById('rto').disabled = true;
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
            document.getElementById('rfrom').value = a;
			document.getElementById('rto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "rcustom") {
			document.getElementById('rfrom').disabled = false;
            document.getElementById('rto').disabled = false;
		}
    }
	// Rollover Report Date type Script
	
	// Sales Agent Target Data Report Date type Script
	function changedate6(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('sfrom').value = yesterday;
            document.getElementById('sto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('sfrom').value = today;
            document.getElementById('sto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
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
			document.getElementById('sfrom').value = a;
			document.getElementById('sto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
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
            document.getElementById('sfrom').value = a;
			document.getElementById('sto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
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
            document.getElementById('sfrom').value = a;
			document.getElementById('sto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('sfrom').disabled = true;
            document.getElementById('sto').disabled = true;
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
            document.getElementById('sfrom').value = a;
			document.getElementById('sto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "scustom") {
			document.getElementById('sfrom').disabled = false;
            document.getElementById('sto').disabled = false;
		}
    }
	// Sales Agent Target Data Report Date type Script
	
	// Sage MCS Card Type Report Date type Script
	function changedate7(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('sgfrom').value = yesterday;
            document.getElementById('sgto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('sgfrom').value = today;
            document.getElementById('sgto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
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
			document.getElementById('sgfrom').value = a;
			document.getElementById('sgto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
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
            document.getElementById('sgfrom').value = a;
			document.getElementById('sgto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
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
            document.getElementById('sgfrom').value = a;
			document.getElementById('sgto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('sgfrom').disabled = true;
            document.getElementById('sgto').disabled = true;
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
            document.getElementById('sgfrom').value = a;
			document.getElementById('sgto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "sgcustom") {
			document.getElementById('sgfrom').disabled = false;
            document.getElementById('sgto').disabled = false;
		}
    }
	// Sage MCS Card Type Report Date type Script
	
	// UK Booking Report Date type Script
	function changedate8(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('ufrom').value = yesterday;
            document.getElementById('uto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('ufrom').value = today;
            document.getElementById('uto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
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
			document.getElementById('ufrom').value = a;
			document.getElementById('uto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
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
            document.getElementById('ufrom').value = a;
			document.getElementById('uto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
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
            document.getElementById('ufrom').value = a;
			document.getElementById('uto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('ufrom').disabled = true;
            document.getElementById('uto').disabled = true;
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
            document.getElementById('ufrom').value = a;
			document.getElementById('uto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "ucustom") {
			document.getElementById('ufrom').disabled = false;
            document.getElementById('uto').disabled = false;
		}
    }
	// UK Booking Report Date type Script
	
	// Barger Agent Report Date type Script
	function changedate9(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('bfrom').value = yesterday;
            document.getElementById('bto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('bfrom').value = today;
            document.getElementById('bto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
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
			document.getElementById('bfrom').value = a;
			document.getElementById('bto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
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
            document.getElementById('bfrom').value = a;
			document.getElementById('bto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
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
            document.getElementById('bfrom').value = a;
			document.getElementById('bto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('bfrom').disabled = true;
            document.getElementById('bto').disabled = true;
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
            document.getElementById('bfrom').value = a;
			document.getElementById('bto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "bcustom") {
			document.getElementById('bfrom').disabled = false;
            document.getElementById('bto').disabled = false;
		}
    }
	// Barger Agent Report Date type Script
	
	// Media QC Report Date type Script
	function changedate10(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('mqfrom').value = yesterday;
            document.getElementById('mqto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('mqfrom').value = today;
            document.getElementById('mqto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
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
			document.getElementById('mqfrom').value = a;
			document.getElementById('mqto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
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
            document.getElementById('mqfrom').value = a;
			document.getElementById('mqto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
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
            document.getElementById('mqfrom').value = a;
			document.getElementById('mqto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('mqfrom').disabled = true;
            document.getElementById('mqto').disabled = true;
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
            document.getElementById('mqfrom').value = a;
			document.getElementById('mqto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "mqcustom") {
			document.getElementById('mqfrom').disabled = false;
            document.getElementById('mqto').disabled = false;
		}
    }
	// Media QC Report Date type Script
	
	// Flash Sale Email Inquiry Report Date type Script
	function changedate11(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('fsfrom').value = yesterday;
            document.getElementById('fsto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('fsfrom').disabled = true;
            document.getElementById('fsto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('fsfrom').value = today;
            document.getElementById('fsto').value = today;
		}
        else if (dayformat == "This Week") {
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
        else if (dayformat == "Last Week") {
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
        else if (dayformat == "This Month") {
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
        else if (dayformat == "Last Month") {
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
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "fscustom") {
			document.getElementById('fsfrom').disabled = false;
            document.getElementById('fsto').disabled = false;
		}
    }
	// Flash Sale Email Inquiry Report Date type Script
	
	// Agent Sales Report Date type Script
	function changedate12(dayformat) {
		if (dayformat == "Yesterday") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
			var date = new Date();
            date.setDate(date.getDate() - 1);
			var yesterday = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            //var yesterday = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
            document.getElementById('asfrom').value = yesterday;
            document.getElementById('asto').value = yesterday;
		}
        else if (dayformat == "Today") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
			var date = new Date();
            var today = ("0" + date.getDate().toString()).substr(-2) + "/" + ("0" + (date.getMonth() + 1).toString()).substr(-2) + "/" + (date.getFullYear().toString());
            document.getElementById('asfrom').value = today;
            document.getElementById('asto').value = today;
		}
        else if (dayformat == "This Week") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
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
			document.getElementById('asfrom').value = a;
			document.getElementById('asto').value = b;
		}
        else if (dayformat == "Last Week") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
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
            document.getElementById('asfrom').value = a;
			document.getElementById('asto').value = b;
		}
        else if (dayformat == "This Month") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
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
            document.getElementById('asfrom').value = a;
			document.getElementById('asto').value = b;
		}
        else if (dayformat == "Last Month") {
			document.getElementById('asfrom').disabled = true;
            document.getElementById('asto').disabled = true;
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
            document.getElementById('asfrom').value = a;
			document.getElementById('asto').value = b;
		}
        else if (dayformat == "SpecificDate") {
        }
		else if (dayformat == "ascustom") {
			document.getElementById('asfrom').disabled = false;
            document.getElementById('asto').disabled = false;
		}
    }
	// Agent Sales Report Date type Script
	
	

	