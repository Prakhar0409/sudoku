<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="./puzzlestyle.css">
</head>
<body onload="timer()">


<header><h1>PYA's SUDOKU</h1></header>

<p style="text-align:center">Timer:<div id="txt" style="text-align:center"></div></p>

<jsp:useBean id="p" class="sudopuzzle.sudokupuzzle" />

<%
			int[][] x=p.a;
			
			
			if("Easy".equals(request.getParameter("easy"))){
				p.dif=0;p.valid=0;p.sol=0;
				x=p.generator();
				out.println("Easy Sudoku");p.sec=0;p.min=0;
				%>
				<script>startTime();</script>
			<%
			}
			if("Moderate".equals(request.getParameter("moderate"))){
				p.dif=1;p.valid=0;p.sol=0;
				x=p.generator();
				out.println("Moderate Sudoku");p.sec=0;p.min=0;
				%>
					<script>startTime();</script>
			<%	
			}
			if("Hard".equals(request.getParameter("hard"))){
				p.dif=2;p.valid=0;p.sol=0;
				x=p.generator();p.sec=0;p.min=0;
				out.println("Hard Sudoku");
			%>	
				<script>startTime();</script>
			<%
			}
			if("Reseter".equals(request.getParameter("reset"))){
				p.valid=0;
				p.sol=0;
				%>
							<script>startTime();</script>
		<%		x=p.generator();p.sec=0;p.min=0;
			}
			if("GeneratePuzzle".equals(request.getParameter("generate"))){
				p.valid=0;
				p.sol=0;
				x=p.generator();p.sec=0;p.min=0;
				out.println("Easy Sudoku");
				
			%>	
			
		<%		
			}
			

			int[][] sol=p.answer();		
	
%>

<%

	if("Validator".equals(request.getParameter("validate"))){
		System.out.println("got it");
		int flag=1;
			if(request.getParameter("s")!=null && request.getParameter("s")!="" ){
					p.sec=Integer.parseInt(request.getParameter("s"));
					System.out.println("sec is "+p.sec);
				}
				if(request.getParameter("m")!=""){
					p.min=Integer.parseInt(request.getParameter("m"));
			}
		
		for(int i=0;i<9;i++){
			for(int j=0;j<9;j++){
				if(x[i][j]>9){					
						if(request.getParameter(i+""+j)==null || Integer.parseInt(request.getParameter(i+""+j))!=(x[i][j]-10)){
							flag=0;
							break;
						}
					}
			}
		}
		p.sol=0;
		if(flag==0){
			%>
			<script>alert("Incorrect answer.");
			
			</script>
		<%
		
						
		}else{
				p.valid=1;
			%>
			<script>alert("Congratulations! You successfully solved the puzzle");
			
			</script>
		<%
			
				
		}
	}
%>

<%
	if("Solution".equals(request.getParameter("ans"))){
		x=p.solution;
		if(request.getParameter("s")!=null && request.getParameter("s")!="" ){
					p.sec=Integer.parseInt(request.getParameter("s"));
					System.out.println("sec is "+p.sec);
				}
				if(request.getParameter("m")!=""){
					p.min=Integer.parseInt(request.getParameter("m"));
			}
		p.valid=1;p.sol=1;
		%>
			<script>alert("You have given up and chosen the Easier way!");
			
			</script>
		<%}
		%>
		
		

<form method="post" action="puzzle.jsp">
<table align="center">
<%
		
		for(int i=0;i<9;i++){
		%>	<tr>		
		<%	for(int j=0;j<9;j++){
		%>		<td class="cell"><%if(x[i][j]>9)
				{%><input class='cell' name="<%=i%><=j%>" type="text" placeholder="-"><%}else{out.println(x[i][j]);}%></td>
	<%}%></tr>
	<%}%>
</table>

<input type="hidden" id="sec" name="s" value="0">
<input type="hidden" id="min" name="m" value="0">
<input type="submit" id="validatorid" class="butn" name="validate" value="Validator" />
<input type="submit" class="butn" name="ans" value="Solution" />

</form>

<form >
<input type="submit" class="butn" name="reset" value="Reseter" />
</form>


<form method=get>
<input type="submit" id="genpuzzleid" class="butn" name="generate" value="GeneratePuzzle" />
</form>
<br/><br/><br/><br/>
<div>
<form>
	<input type="submit" style="margin-left:39%;" class="butn2" name="easy" value="Easy">
	<input type="submit" class="butn2" name="moderate" value="Moderate">
	<input type="submit" class="butn2" name="hard" value="Hard">
</form>
</div>




<footer>
	<div id="call">Call: +91-8588815188</div>
	<div id="contact"> Website: www.cse.iitd.ac.in/~cs1140207<br/>Email: prakhar0409@gmail.com</div>
	<div id="copyright"> &copy; PYA </div>
</footer>



<script>

		var d0;
		var timeron=true; 
		var min="<%=p.min%>";
		var sec="<%=p.sec%>";
		function timer() {
				sec=parseInt(sec)+1;
				if(sec>=60){sec=sec-60;min=parseInt(min)+1;}
				sec=sec.toString();
				console.log(sec+" "+min);
				if(sec.length==1){sec="0"+sec;}
				min=min.toString();
				if(min.length==1){min="0"+min;}
	    	document.getElementById("sec").value =sec;
			document.getElementById('min').value =min;
			document.getElementById('txt').innerHTML =min+":"+sec;
	    	
	    }
	    console.log("<%=p.valid%>");
	    window.onload=function(){
	    <%if(p.valid==0){%>
	    	var t=setInterval(timer,1000);
	    <%}else{%>
	    	var x=timer();
	    <%}%>
	    }
	

</script>

</body>
</html>