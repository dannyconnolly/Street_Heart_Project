	function doMultiply(var1, var2, var3){
		
		if (isNaN(var2) || var3 <= 0){
				alert("Please enter a numeric value greater than zero!");
				
			}
			else if (isNaN(var2)|| var2 > 100){
				alert("Please pick a number less than 100!");
			}
			document.writeln("<h1 style=\"color:#99CCFF; font-family: calibri, arial, sans-serif;\">Hello " + var1 + "</h2>");
			document.writeln("<p style=\"color:#99CCFF; font-family: calibri, arial, sans-serif;\">The table of " + var2 + " up to " + var3 + " is as follows... </p>");
			for (var times = 1; times <= var3; times++) {
				document.writeln("<p style=\"color:#99CCFF; font-family: calibri, arial, sans-serif;\">" + var2 + " x " + times + " = " + (times * var2) + "</p>");
	    }
    }