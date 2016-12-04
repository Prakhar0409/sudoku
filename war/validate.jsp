<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<jsp:useBean id="p" class="sudopuzzle.sudokupuzzle" />
<%--
int[][] sol=p.answer();
System.out.println(sol[0][0]);




List<int>que=(List<int>) request.getSession().getAttribute("list");

System.out.println("on validate list print "+que[0][0]);	
%>
<%=session.getAttribute("00")%>
--%>


<%--
<%
	int flag=0;
	for(int i=0;i<9;i++){
		for(int j=0;j<9;j++){
			if(Integer.parseInt((String)session.getAttribute("Q"+i+j))==0){
				if(Integer.parseInt((String)session.getAttribute(i+""+j))==Integer.parseInt((String)request.getParameter(i+""+j))){				
				}else{
					flag=-1;
				}
			}
		}
	}
	
	if(flag==0){
		out.println("success");
	}else {
			out.println("failure");
	}
%>
--%>

</body>
</html>