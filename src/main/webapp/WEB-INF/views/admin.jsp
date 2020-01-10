<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ page import="java.util.Random,java.text.*"%>
        <html>
            <jsp:include page="/WEB-INF/views/client/header.jsp" />
            <jsp:include page="/WEB-INF/views/client/menu.jsp" />

                <table style="font-size: 40px; text-align: center; margin: 200px auto; border-collapse: none!important;">
                    <thead style="background: #333333; color: palevioletred;">
                        <th class="bang">   ID vật nuôi   </th>
                        <th class="bang">   ID Đơn hàng   </th>
                        <th class="bang">   Số Lượng   </th>
                        <th class="bang">   Phê duyệt   </th>
                    </thead>
                    <tbody style="background: #4b939c;">
                        <c:forEach var="row" items="${rowddh}" varStatus="status">
                            <tr>
                                <td>${row.idvatnuoi}</td>
                                <td>${row.iddh}</td>
                                <td>${row.soluong}</td>
                                <td><a href="updatestatus/${row.id}"><button>Duyệt</button></a></td>
                            </tr>
                            
                        </c:forEach>
                    </tbody>
                    
                </table>
                <jsp:include page="/WEB-INF/views/client/footer.jsp" />
        </html>