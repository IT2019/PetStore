<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<body>
		<h2>Hello World!</h2>
		<c:forEach var="pet" items="${pets}" varStatus="status">
			<h1>${pet.tenvatnuoi}</h1>
		</c:forEach>	
	</body>
</html>
